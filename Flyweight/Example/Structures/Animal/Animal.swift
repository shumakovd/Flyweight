//
//  Animal.swift
//  Flyweight
//
//  Created by Shumakov Dmytro on 08.12.2022.
//

import Foundation

struct Animal: Equatable {

    /// This is an external context that contains specific values and an object
    /// with a common state.
    ///
    /// Note: The object of appearance will be lazily created when it is needed

    let name: String
    let country: String
    let type: Type

    var appearance: Appearance {
        return AppearanceFactory.appearance(for: type)
    }
}

extension Animal: CustomStringConvertible {

    var description: String {
        return "\(name), \(country), \(type.rawValue) + \(appearance.description)"
    }
}
