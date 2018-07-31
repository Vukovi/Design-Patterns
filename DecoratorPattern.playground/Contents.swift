import UIKit

protocol Porsche {
    func getPrice() -> Double
    func getDescription() -> String
}

class Boxter: Porsche {
    func getPrice() -> Double {
        return 120
    }
    
    func getDescription() -> String {
        return "Porsche Boxter"
    }
}


class PorscheDecorator: Porsche {
    
    private let decoratedPorsche: Porsche
    
    required init(decoratedPorsche: Porsche) {
        self.decoratedPorsche = decoratedPorsche
    }
    
    func getPrice() -> Double {
        return decoratedPorsche.getPrice()
    }
    
    func getDescription() -> String {
        return decoratedPorsche.getDescription()
    }

}

class PremiumAudioSystem: PorscheDecorator {
    required init(decoratedPorsche: Porsche) {
        super.init(decoratedPorsche: decoratedPorsche)
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 30
    }
    
    override func getDescription() -> String {
        return super.getDescription() + "with premium audio system"
    }
}

class PanoramicSunroof: PorscheDecorator {
    required init(decoratedPorsche: Porsche) {
        super.init(decoratedPorsche: decoratedPorsche)
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 20
    }
    
    override func getDescription() -> String {
        return super.getDescription() + "with panoramic sunroof"
    }
}





var porscheBoxter: Porsche = Boxter()
porscheBoxter.getDescription()
porscheBoxter.getPrice()

porscheBoxter = PremiumAudioSystem(decoratedPorsche: porscheBoxter)
porscheBoxter.getDescription()
porscheBoxter.getPrice()


porscheBoxter = PanoramicSunroof(decoratedPorsche: porscheBoxter)
porscheBoxter.getDescription()
porscheBoxter.getPrice()
