import UIKit

enum CarType {
    case huge
    case fast
}

protocol Car {
    func drive()
}


class HugeCar: Car {
    func drive() {
        print("you drive huge car")
    }
}

class FastCar: Car {
    func drive() {
        print("you drive fast car")
    }
}

let hugeCar = HugeCar()
hugeCar.drive()

let fastCar = FastCar()
fastCar.drive()


class CarFactory {
    
    static func produceCar(type: CarType) -> Car {
        var car: Car
        
        switch type {
        case .fast:
            car = FastCar()
        case .huge:
            car = HugeCar()
        }
        
        return car
    }
}

let newHugeCar = CarFactory.produceCar(type: .huge)
let newFastCar = CarFactory.produceCar(type: .fast)
