//
//  ArrayExt.swift
//  Flyweight
//
//  Created by Shumakov Dmytro on 08.12.2022.
//

import Foundation

extension Array where Element == String {

    /// Returns a Flyweight's string hash for a given state.
    var key: String {
        return self.joined()
    }
}
