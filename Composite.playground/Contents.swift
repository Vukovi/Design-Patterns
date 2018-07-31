// ovaj patern je kao rekurzija

protocol Coworker {
    func hire(coworker: Coworker)
    func getInfo()
    var lvl: Int { get }
}

// Grana
class Manager: Coworker {
    private var coworkers = [Coworker]()
    var lvl: Int
    
    init(lvl: Int) {
        self.lvl = lvl
    }
    
    func hire(coworker: Coworker) {
        self.coworkers.append(coworker)
    }
    
    func getInfo() {
        print(self.lvl.description + " level manager")
        for coworker in coworkers {
            coworker.getInfo()
        }
    }
}

// List
class LowLevelManager: Coworker {
    var lvl: Int
    
    init(lvl: Int) {
        self.lvl = lvl
    }
    
    func hire(coworker: Coworker) {
        print("can't hire")
    }
    
    func getInfo() {
        print(self.lvl.description + " level manager")
    }
}

let topManager = Manager(lvl: 1)
let managerLvl2 = Manager(lvl: 2)

let managerLvl3_1 = Manager(lvl: 3)
let managerLvl3_2 = Manager(lvl: 3)

let managerLvl10 = Manager(lvl: 10)



topManager.hire(coworker: managerLvl2)

managerLvl2.hire(coworker: managerLvl3_1)
managerLvl2.hire(coworker: managerLvl3_2)

managerLvl3_1.hire(coworker: managerLvl10)

topManager.getInfo()
// 1 level manager
// 2 level manager
// 3 level manager
// 10 level manager
// 3 level manager
