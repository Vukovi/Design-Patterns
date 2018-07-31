
class FruitShop {
    func buyFruits() -> String {
        return "fruit"
    }
}

class MeatShop {
    func buyMeat() -> String {
        return "meat"
    }
}

class MilkShop {
    func buyMilk() -> String {
        return "milk"
    }
}

class SweetShop {
    func buySweets() -> String {
        return "sweets"
    }
}

class BreadShop {
    func buyBread() -> String {
        return "bread"
    }
}

// Facade
class SuperMarket {
    let fruitShop = FruitShop()
    let meatShop = MeatShop()
    let milkShop = MilkShop()
    let sweeitShop = SweetShop()
    let breadShop = BreadShop()
    
    func buyProduct() -> String {
        var products = ""
        products += fruitShop.buyFruits() + ", "
        products += meatShop.buyMeat() + ", "
        products += milkShop.buyMilk() + ", "
        products += sweeitShop.buySweets() + ", "
        products += breadShop.buyBread()
        return products
    }
}

let sm = SuperMarket()
sm.buyProduct()
