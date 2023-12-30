//
//  MoviesController.swift
//
//
//  Created by Minseong Kang on 12/30/23.
//

import Foundation
import Vapor

struct MoviesController: RouteCollection {
	func boot(routes: RoutesBuilder) throws {
		let movies = routes.grouped("movies")
		// /movies
		movies.get(use: index)
		
		// /movies/23
		movies.get(":movieId", use: show)
	}
	
	func index(req: Request) async throws -> String {
		return "Index"
	}
	
	func show(req: Request) async throws -> String {
		guard let movieId = req.parameters.get("movieId") else {
			throw Abort(.badRequest)
		}
		return "\(movieId)"
	}
}
