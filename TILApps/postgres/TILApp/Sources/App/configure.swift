import NIOSSL
import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
	// uncomment to serve files from /Public folder
	// app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
	
	app.databases.use(DatabaseConfigurationFactory.postgres(configuration: .init(
		hostname: Environment.get("DATABASE_HOST") ?? "localhost",
		port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? SQLPostgresConfiguration.ianaPortNumber,
		username: Environment.get("DATABASE_USERNAME") ?? "kobe",
		password: Environment.get("DATABASE_PASSWORD") ?? "kobe1234",
		database: Environment.get("DATABASE_NAME") ?? "vapor_database",
		tls: .prefer(try .init(configuration: .clientDefault)))
	), as: .psql)
	
	// 1
	app.migrations.add(CreateAcronym())
	
	// 2
	app.logger.logLevel = .debug
	
	// 3
	try app.autoMigrate().wait()
//	try await app.autoMigrate().get()
	
	// register routes
	try routes(app)
}
