//
//  User.swift
//  HappyCoin
//
//  Created by Stefano on 25.02.21.
//

struct User {
    var coins: [Coin]
}

extension User: UserCacheStringConvertible {
    static var key: String = "HappyCoin.User"
}
