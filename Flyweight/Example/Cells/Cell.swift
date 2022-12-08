//
//  Cell.swift
//  Flyweight
//
//  Created by Shumakov Dmytro on 08.12.2022.
//

import Foundation

class Cell {

    private var animal: Animal?

    func update(with animal: Animal) {
        self.animal = animal
        let type = animal.type.rawValue
        let photos = "photos \(animal.appearance.photos.count)"
        print("Cell: Updating an appearance of a \(type)-cell: \(photos)\n")
    }
}
