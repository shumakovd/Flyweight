//
//  AppearenceFactory.swift
//  Flyweight
//
//  Created by Shumakov Dmytro on 08.12.2022.
//

import UIKit
import Foundation

class AppearanceFactory {

    private static var cache = [Type: Appearance]()

    static func appearance(for key: Type) -> Appearance {

        guard cache[key] == nil else {
            print("AppearanceFactory: Reusing an existing \(key.rawValue)-appearance.")
            return cache[key]!
        }

        print("AppearanceFactory: Can't find a cached \(key.rawValue)-object, creating a new one.")

        switch key {
        case .cat:
            cache[key] = catInfo
        case .dog:
            cache[key] = dogInfo
        }

        return cache[key]!
    }
}

extension AppearanceFactory {

    private static var catInfo: Appearance {
        return Appearance(photos: [UIImage()], backgroundColor: .red)
    }

    private static var dogInfo: Appearance {
        return Appearance(photos: [UIImage(), UIImage()], backgroundColor: .blue)
    }
}
