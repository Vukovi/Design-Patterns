
protocol DriveVehicle {
    func startVehicle()
    func haveASeat()
    func useProtection()
    func lookAtTheMirror()
    func turnSignal()
    func drive()
}

extension DriveVehicle {
    
    // ovo bi mogla biti apstraktna klasa
    
    func startVehicle() {
        haveASeat()
        useProtection()
        lookAtTheMirror()
        turnSignal()
        drive()
    }
    
    func haveASeat() {
        preconditionFailure("This method should be overriden")
    }
    
    func useProtection() {
        preconditionFailure("This method should be overriden")
    }
    
    func lookAtTheMirror() {
        preconditionFailure("This method should be overriden")
    }
    
    func turnSignal() {
        preconditionFailure("This method should be overriden")
    }
    
    func drive() {
        preconditionFailure("This method should be overriden")
    }
}


class Bicycle: DriveVehicle {
    func haveASeat() {
        print("sit down on a bicycle seat")
    }
    
    func useProtection() {
        print("wear a helmet")
    }
    
    func lookAtTheMirror() {
        print("look at the mirror")
    }
    
    func turnSignal() {
        print("rise your hand")
    }
    
    func drive() {
        print("pedal")
    }
}


class Car: DriveVehicle {
    func haveASeat() {
        print("sit down on a car seat")
        closeTheDoor()
    }
    
    func closeTheDoor() {
        print("if we have a door close it")
    }
    
    func useProtection() {
        print("fasten seat belt")
    }
    
    func lookAtTheMirror() {
        print("look at the mirrors")
    }
    
    func turnSignal() {
        print("turn on left turn light")
    }
    
    func drive() {
        print("push pedal")
    }
}

let car = Car()
let bicycle = Bicycle()

car.startVehicle()
print("#############")
bicycle.startVehicle()
