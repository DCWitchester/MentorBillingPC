namespace FunctionLibrary

open System
open Npgsql.FSharp
open Npgsql.FSharp.OptionWorkflow

module DatabaseConnection =

    //the qualifier acces entrace
    [<RequireQualifiedAccess>]
    type SqlValue =
        | Null
        | Short of int16
        | Int of int
        | Long of int64
        | String of string
        | Date of DateTime
        | Bool of bool
        | Number of double
        | Decimal of decimal
        | Bytea of byte[]
        | HStore of Map<string, string>
        | Uuid of Guid
        | Timestamp of DateTime
        | TimestampWithTimeZone of DateTime
        | Time of TimeSpan
        | TimeWithTimeZone of DateTimeOffset
        | Jsonb of string

    // A row is a list of key/value pairs
    type SqlRow = list<string * SqlValue>

    // A table is list of rows
    type SqlTable = list<SqlRow>

    //Connection String
    ///the default connection towards the database: for use when no other connection is given
    let defaultConnectionSettings = 
        Sql.host "5.2.228.239"
        |> Sql.port 26662
        |> Sql.username "postgres"
        |> Sql.password "pgsql"
        |> Sql.database "MentorWorkOrder"
        |> Sql.sslMode SslMode.Prefer

    ///the default connection will be instantiated with the default connection
    let mutable connection = defaultConnectionSettings

    ///this fucntion will set the connection to one based on the given connection string
    let setConnectionFromUri (uri:String) = connection <- Sql.fromUriToConfig(Uri uri)
    let createConnectionFromUri (uri:String) = Sql.fromUriToConfig(Uri uri)

module ControllerFunctions =

    module DatabaseObjects = 
        type LicenceValidator = {
            username : String
            password : String
            version : String
            programCode : Int32
            }

        type Licence = {
            LicenceID : Int32
            UserID : Int32
            LicenceUpdate : DateTime
            LicencePeriod : Int32
        }
    
    let verifyUser(connectionString : Sql.ConnectionStringBuilder, username : String) : bool = 
        connectionString
        |> Sql.connectFromConfig
        |> Sql.query "SELECT COUNT(*) 
                        FROM clienti
                        WHERE nume_utilizator = @username"
        |> Sql.parameters
            [
                "username", Sql.Value username
            ]
        |> Sql.prepare
        |> Sql.executeScalar
        |> Sql.toInt
        |> function
            | value -> 
                if(value>(int32 0))
                    then true
                    else false

    let verifyPassword(connectionString : Sql.ConnectionStringBuilder, username : String, password : String) : bool = 
        connectionString
        |> Sql.connectFromConfig
        |> Sql.query "SELECT COUNT(*) 
                        FROM clienti
                        WHERE nume_utilizator = @username AND (parola = @password OR parola_autogenerata = @password)"
        |> Sql.parameters
            [
                "username", Sql.Value username
                "password", Sql.Value password
            ]
        |> Sql.prepare
        |> Sql.executeScalar
        |> Sql.toInt
        |> function
            | value -> 
                if(value>(int32 0))
                    then true
                    else false

    let checkActivLicence(connectionString : Sql.ConnectionStringBuilder,  licence: DatabaseObjects.LicenceValidator) : Boolean = 
        connectionString
        |> Sql.connectFromConfig
        |> Sql.query "SELECT (licente.data_actualizare + (licente.perioada::VARCHAR || ' months')::INTERVAL) > 'now'::TIMESTAMP WITHOUT TIME ZONE 
                        FROM licente LEFT JOIN clienti_versiuni ON licente.clienti_versiuni_id = clienti_versiuni.id
                                    LEFT JOIN clienti ON clienti_versiuni.clienti_id = clienti.id
                                    LEFT JOIN versiuni ON clienti_versiuni.versiuni_id = versiuni.id
                                    LEFT JOIN programe ON versiuni.programe_id = programe.id
                        WHERE clienti.nume_utilizator = @username AND (clienti.parola = @password OR clienti.parola_autogenerata = @password)
                                AND programe.cod_program = @programCode 
                                AND versiuni.versiune = @version"
        |> Sql.parameters
            [
                "username", Sql.Value licence.username
                "password", Sql.Value licence.password
                "programCode", Sql.Value licence.programCode
                "version", Sql.Value licence.version
            ]
        |> Sql.prepare
        |> Sql.executeScalar
        |> Sql.toBool

    let retreiveLicence(connectionString : Sql.ConnectionStringBuilder, licence : DatabaseObjects.LicenceValidator) : DatabaseObjects.Licence list =
        connectionString
        |> Sql.connectFromConfig
        |> Sql.query "SELECT licente.data_actualizare, licente.perioada, clienti.id AS client_id, licente.id AS licenta_id
                        FROM licente LEFT JOIN clienti_versiuni ON licente.clienti_versiuni_id = clienti_versiuni.id
                                    LEFT JOIN clienti ON clienti_versiuni.clienti_id = clienti.id
                                    LEFT JOIN versiuni ON clienti_versiuni.versiuni_id = versiuni.id
                                    LEFT JOIN programe ON versiuni.programe_id = programe.id
                        WHERE clienti.nume_utilizator = @username AND (clienti.parola = @password OR clienti.parola_autogenerata = @password)
                                AND programe.cod_program = @programCode 
                                AND versiuni.versiune = @version"
        |> Sql.parameters
            [
                "username", Sql.Value licence.username
                "password", Sql.Value licence.password
                "programCode", Sql.Value licence.programCode
                "version", Sql.Value licence.version
            ]
        |> Sql.prepare
        |> Sql.executeTable
        |> Sql.mapEachRow (fun row ->
                option {
                    let! licenceID = Sql.readInt "licenta_id" row
                    let! userID = Sql.readInt "client_id" row
                    let! licenceUpdate = Sql.readDate "data_actualizare" row
                    let! licencePeriod = Sql.readInt "perioada" row
                    return { LicenceID = licenceID; UserID = userID; LicenceUpdate = licenceUpdate; LicencePeriod = licencePeriod }
                })
        
