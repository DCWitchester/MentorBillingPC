namespace FunctionLibrary

open System
open Npgsql.FSharp
open Npgsql.FSharp.OptionWorkflow

module DatabaseObjects = 
    type User ={
        ID : int32
        Username : string
        Password : string
        Name : string
        }

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
    let setConnectionFromUri (uri:string) = connection <- Sql.fromUriToConfig(Uri uri)


    module DatabaseFunctions = 
        let insertUser(connectionString : Sql.ConnectionStringBuilder, user: DatabaseObjects.User) =
            connectionString 
            |> Sql.connectFromConfig
            |> Sql.query "INSERT INTO utilizatori(nume_utilizator,parola,denumire_utilizator) 
                                VALUES(@numeUtilizator,@parola,@denumireUtilizator) 
                                ON CONFLICT utilizatori_nume_utilizator_key 
                                DO UPDATE SET parola = @parola, denumire_utilizator = @denumireUtilizator, activ = true"
            |> Sql.parameters
                [
                    "numeUtilizator", Sql.Value user.Username
                    "parola", Sql.Value user.Password
                    "denumire_utilizator", Sql.Value user.Name
                ]
            |> Sql.prepare
            |> Sql.executeNonQuery