// import ballerina/http;
import ballerina/sql;
import ballerinax/postgresql;
import ballerinax/postgresql.driver as _;

configurable string host = "172.23.0.2";

postgresql:Client|sql:Error db = check new (host, "postgres", "postgres", "postgres", 5432);

