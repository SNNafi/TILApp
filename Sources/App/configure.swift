import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.postgres(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? PostgresConfiguration.ianaPortNumber,
        username: Environment.get("DATABASE_USERNAME") ?? "tilapp",
        password: Environment.get("DATABASE_PASSWORD") ?? "tilapp",
        database: Environment.get("DATABASE_NAME") ?? "tilapp"
    ), as: .psql)


    app.migrations.add(CreateAcronym())
    app.logger.logLevel = .debug
    // app.http.server.configuration.hostname = "127.0.0.1"
    // app.http.server.configuration.port = 9090
    try app.autoMigrate().wait()

    // register routes
    try routes(app)
}
