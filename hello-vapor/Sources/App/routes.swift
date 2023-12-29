import Vapor

func routes(_ app: Application) throws {
	// http://127.0.0.1:8080
	app.get { req async in
		"It works!"
	}
	
	// http://127.0.0.1:8080/hello
	app.get("hello") { req async -> String in
		"Hello, world!"
	}
	
	// /movies/action
	// /movies/horror
	// /movies/kids
	// /movies/comedy
	// route parameters/dynamic parameters
	app.get("movies", ":genre") { req async throws -> String in
		guard let genre = req.parameters.get("genre") else {
			throw Abort(.badRequest)
		}
		return "All movies of genre: \(genre)"
	}
	
	// /movies/action/2023
	app.get("movies",":genre", ":year") { req async throws -> String in
		guard let genre = req.parameters.get("genre"),
						let year = req.parameters.get("year")
		else {
			throw Abort(.badRequest)
		}
		return "All movies of genre: \(genre), for year \(year)"
	}
}