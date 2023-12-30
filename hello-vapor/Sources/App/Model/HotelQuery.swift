//
//  File.swift
//  
//
//  Created by Minseong Kang on 12/30/23.
//

import Foundation
import Vapor

struct HotelQuery: Content {
	let sort: String
	let search: String?
}
