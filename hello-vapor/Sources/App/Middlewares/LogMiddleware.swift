//
//  LogMiddleware.swift
//
//
//  Created by Minseong Kang on 12/31/23.
//

import Foundation
import Vapor

struct LogMiddleware: AsyncMiddleware {
	func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
		print("LOG MIDDLEWARE")
		return try await next.respond(to: request)
	}
}
