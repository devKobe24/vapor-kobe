//
//  PaintsController.swift
//
//
//  Created by Minseong Kang on 12/30/23.
//

import Foundation
import Vapor

struct PaintsController: RouteCollection {
	func boot(routes: RoutesBuilder) throws {
		let paints = routes.grouped("paints")
		// /paints
		paints.get(use: painters)
		
		paints.get(":artist", ":title", use: show)
	}
	
	func painters(req: Request) async throws -> [String] {
		return ["vincent", "kobe", "min seong", "zico"]
	}
	
	func show(req: Request) async throws -> [String: String] {
		guard let artist = req.parameters.get("artist"),
					let title = req.parameters.get("title")
		else {
			throw Abort(.badRequest)
		}
		return [artist: title]
	}
}
