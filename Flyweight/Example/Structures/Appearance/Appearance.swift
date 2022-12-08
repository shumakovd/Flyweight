//
//  Appearance.swift
//  Flyweight
//
//  Created by Shumakov Dmytro on 08.12.2022.
//

import UIKit
import Foundation

struct Appearance: Equatable {

    /// This object contains a predefined appearance of every cell

    let photos: [UIImage]
    let backgroundColor: UIColor
}

extension Appearance: CustomStringConvertible {

    var description: String {
        return "photos: \(photos.count), \(backgroundColor)"
    }
}
