//
//  AuthenticationMiddleware.swift
//
//
//  Created by Minseong Kang on 12/31/23.
//

import Foundation
import Vapor

struct AuthenticationMiddleware: AsyncMiddleware {
	
	func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
		// Headers: Authorization: Bearer EDFR123124ASDASD
		
		guard let authorization = request.headers.bearerAuthorization else {
			throw Abort(.unauthorized)
		}
		print(authorization.token)
		return try await next.respond(to: request)
	}
}
