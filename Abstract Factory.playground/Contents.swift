import UIKit

protocol Car {
    func drive()
}

class LittleSizeCar: Car {
    func drive() {
        print("Little car")
    }
}

class MiddleSizeCar: Car {
    func drive() {
        print("Middle car")
    }
}


protocol Bus {
    func drive()
}

class LittleSizeBus: Bus {
    func drive() {
        print("Little bus")
    }
}

class MiddleSizeBus: Bus {
    func drive() {
        print("Middle bus")
    }
}



protocol Factory {
    func produceBus() -> Bus
    func produceCar() -> Car
}

class LittleSizeFactory: Factory {
    func produceBus() -> Bus {
        print("little size bus is created")
        return LittleSizeBus()
    }
    
    func produceCar() -> Car {
        print("little size car is created")
        return LittleSizeCar()
    }
}

class MiddleSizeFactory: Factory {
    func produceBus() -> Bus {
        print("little size bus is created")
        return MiddleSizeBus()
    }
    
    func produceCar() -> Car {
        print("little size car is created")
        return MiddleSizeCar()
    }
}


let littleFactory = LittleSizeFactory()
littleFactory.produceCar()

let middleFactory = MiddleSizeFactory()
middleFactory.produceBus()
