
class Account {
    var balance: Int
    var accountName: String
    
    init(accountName: String, balance: Int) {
        self.accountName = accountName
        self.balance = balance
    }
}

protocol Command {
    func execute()
    var isComplere: Bool { get set }
}

class Deposit: Command {
    
    private var _account: Account
    private var _amount: Int
    
    var isComplere: Bool = false
    
    init(account: Account, amount: Int) {
        self._account = account
        self._amount = amount
    }
    
    func execute() {
        _account.balance += _amount
        isComplere = true
    }
}

class Withdraw: Command {
    
    private var _account: Account
    private var _amount: Int
    
    var isComplere: Bool = false
    
    init(account: Account, amount: Int) {
        self._account = account
        self._amount = amount
    }
    
    func execute() {
        if _account.balance >= _amount {
            _account.balance -= _amount
            isComplere = true
        } else {
            print("Nor enough money")
        }
    }
    
}



class TransactionManager {
    static let shared = TransactionManager()
    private init() {}
    private var _transactions: [Command] = []
    
    var pendingtransactions: [Command] {
        get {
            return self._transactions.filter{ $0.isComplere == false }
        }
    }
    
    func addtransactions(command: Command) {
        self._transactions.append(command)
    }
    
    func processingTransactions() {
        _transactions.filter { $0.isComplere == false }.forEach { $0.execute() }
    }
}


let account = Account(accountName: "Vuk knezevic", balance: 1000)
let transactionManager = TransactionManager.shared
transactionManager.addtransactions(command: Deposit(account: account, amount: 100))
transactionManager.pendingtransactions
account.balance // 1000
transactionManager.processingTransactions()
account.balance // 1100





