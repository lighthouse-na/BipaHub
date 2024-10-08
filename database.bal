import ballerinax/mysql;

configurable string host = "127.0.0.1";
configurable int port = 3306;
configurable string user = "myuser";
configurable string password = "mypassword";
configurable string database = "mydb";

final mysql:Client mydb = check new (host, user, password, database, port);

