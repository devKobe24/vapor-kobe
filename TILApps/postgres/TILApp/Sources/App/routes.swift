import Fluent
import Vapor

func routes(_ app: Application) throws {
	app.get { req async in
		"It works!"
	}
	
	app.get("hello") { req async -> String in
		"Hello, world!"
	}
	
	// 1
	app.post("api", "acronyms") { req -> EventLoopFuture<Acronym> in
		// 2
		let acronym = try req.content.decode(Acronym.self)
		// 3
		return acronym.save(on: req.db).map {
			// 4
			acronym
		}
	}
}
