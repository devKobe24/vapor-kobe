import Vapor

/*
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
	
	// MARK: Query Strings
	// /hotels?sort=desc&search=houston
	app.get("hotels") { req async throws in
		let hotelQuery = try req.query.decode(HotelQuery.self)
		return hotelQuery
	}
}
*/
/*
// MARK: - Route Groups
func routes(_ app: Application) throws {
	// /movies
	// /movies/12
	let movies = app.grouped("movies")
	
	// /users
	// /users/premium
	let users = app.grouped("users")
	
	// /movies
	movies.get { req async -> String in
		return "Movies"
	}
	
	
	// /movies/34
	movies.get(":movieId") { req async throws -> String in
		guard let movieId = req.parameters.get("movieId") else {
			throw Abort(.badRequest)
		}
		
		return "MovieId = \(movieId)"
	}
	
	// users/premium
	users.get("premium") { req async -> String in
		return "Premium"
	}
	
	let masterpice = app.grouped("masterpice")
	
	masterpice.get { req async -> [String: String] in
		return ["별이 빛나는 밤에": "https://github.com/devKobe24/images/blob/main/vincent.jpeg?raw=true"]
	}
	
	masterpice.get(":title") { req async throws in
		guard let title = req.parameters.get("title") else {
			throw Abort(.badRequest)
		}
		return [MasterPices(title: title, url: "https://github.com/devKobe24/images/blob/main/vincent.jpeg?raw=true")]
	}
	
	masterpice.post { req async throws in
		let masterpice = try req.content.decode(MasterPices.self)
		return masterpice
	}
}
*/

/*
// MARK: MVC
func routes(_ app: Application) throws {
	try app.register(collection: MoviesController())
	try app.register(collection: PaintsController())
}
*/

// MARK: Middleware
func routes(_ app: Application) throws {
	app.middleware.use(LogMiddleware())
	
	// /
	app.get { req async in
		"It works!"
	}
	
	// /hello
	app.get("hello") { req async -> String in
		"Hello, world!"
	}
}
