//
//  FlyweightVC.swift
//  Flyweight
//
//  Created by Shumakov Dmytro on 08.12.2022.
//

import UIKit
import Foundation

class FlyweightVC: UIViewController {
    
    // MARK: - IBOutlets
    
    // MARK: - Properties
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testFlyweightConcept()
        testFlyweightForExample()
    }
    
    // MARK: - Methods
    
    func testFlyweightConcept() {
        
        /// The client code usually creates a bunch of pre-populated flyweights
        /// in the initialization stage of the application.
        
        let factory = FlyweightFactory(states:
                                        [
                                            ["Chevrolet", "Camaro2018", "pink"],
                                            ["Mercedes Benz", "C300", "black"],
                                            ["Mercedes Benz", "C500", "red"],
                                            ["BMW", "M5", "red"],
                                            ["BMW", "X6", "white"]
                                        ])
        
        factory.printFlyweights()
        
        /// ...
        
        addCarToPoliceDatabase(factory,
                               "CL234IR",
                               "James Doe",
                               "BMW",
                               "M5",
                               "red")
        
        addCarToPoliceDatabase(factory,
                               "CL234IR",
                               "James Doe",
                               "BMW",
                               "X1",
                               "red")
        
        factory.printFlyweights()
    }
    
    func addCarToPoliceDatabase(
        _ factory: FlyweightFactory,
        _ plates: String,
        _ owner: String,
        _ brand: String,
        _ model: String,
        _ color: String) {
            
            print("Client: Adding a car to database.\n")
            
            let flyweight = factory.flyweight(for: [brand, model, color])
            
            /// The client code either stores or calculates extrinsic state and
            /// passes it to the flyweight's methods.
            flyweight.operation(uniqueState: [plates, owner])
        }
    
    
    func testFlyweightForExample() {
        let maineCoon = Animal(name: "Maine Coon",
                               country: "USA",
                               type: .cat)
        
        let sphynx = Animal(name: "Sphynx",
                            country: "Egypt",
                            type: .cat)
        
        let bulldog = Animal(name: "Bulldog",
                             country: "England",
                             type: .dog)
        
        print("Client: I created a number of objects to display")
        
        /// Displaying objects for the 1-st time.
        
        print("Client: Let's show animals for the 1st time\n")
        display(animals: [maineCoon, sphynx, bulldog])
        
        
        /// Displaying objects for the 2-nd time.
        ///
        /// Note: Cached object of the appearance will be reused this time.
        
        print("\nClient: I have a new dog, let's show it the same way!\n")
        
        let germanShepherd = Animal(name: "German Shepherd",
                                    country: "Germany",
                                    type: .dog)
        
        display(animals: [germanShepherd])
    }
    
}

extension FlyweightVC {

    func display(animals: [Animal]) {

        let cells = loadCells(count: animals.count)

        for index in 0..<animals.count {
            cells[index].update(with: animals[index])
        }

        /// Using cells...
    }

    func loadCells(count: Int) -> [Cell] {
        /// Emulates behavior of a table/collection view.
        return Array(repeating: Cell(), count: count)
    }
}
