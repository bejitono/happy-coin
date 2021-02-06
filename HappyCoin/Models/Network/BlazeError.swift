//
//  ServiceError.swift
//  Blaze
//
//  Created by De MicheliStefano on 25.10.20.
//

import Foundation

enum BlazeError: Error {
    case parsing(description: String)
    case network(description: String)
}
