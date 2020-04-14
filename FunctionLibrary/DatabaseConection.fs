namespace FunctionLibrary

open System
open Npgsql.FSharp
open Npgsql.FSharp.OptionWorkflow

module DatabaseConection =

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
        type Licence ={
            UserID : Int32
            LicenceUpdate : String
            LicencePeriod : String
            ProgramID : Int32
            }
    
    let verifyUser(connectionString : Sql.ConnectionStringBuilder, username : String, password : String) : bool = 
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

    let retrieveUserLicence(connectionString : Sql.ConnectionStringBuilder, licence : DatabaseObjects.Licence, programCode: String) = 
        connectionString
        |> Sql.connectFromConfig
        |> Sql.query "SELECT clienti.id"