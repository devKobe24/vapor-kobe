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
	
	// http://127.0.0.1:8080/drama/romantic
	app.get("drama", "romantic") { req async -> String in
		"Romantic drama"
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
	
	app.get("customers", ":customerId") { req async throws -> String in
		guard let customerId = req.parameters.get("customerId", as: Int.self) else {
			throw Abort(.badRequest)
		}
		return "\(customerId)"
	}
	
	// /movies
	app.get("movies") { req async in
		[Movie(title: "Batman", year: 2023),
		 Movie(title: "Superman", year: 2022),
		 Movie(title: "Spiderman", year: 2020)
		]
	}
	
	// MARK: POST Route
	app.post("movies") { req async throws in
		let movie = try req.content.decode(Movie.self)
		return movie
	}
}
