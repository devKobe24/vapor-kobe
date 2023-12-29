//
//  Movie.swift
//
//
//  Created by Minseong Kang on 12/30/23.
//

import Foundation
import Vapor

struct Movie: Content {
	let title: String
	let year: Int
}
