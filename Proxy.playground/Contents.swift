

//class User {
//    let id = "123"
//}
//
//protocol ServerProtocol {
//    func grantAccess(user: User)
//    func denyAccess(user: User)
//}
//
//class ServerSide: ServerProtocol {
//    func grantAccess(user: User) {
//        print("access granted to user with id = \(user.id)")
//    }
//    func denyAccess(user: User) {
//        print("access denied to user with id = \(user.id)")
//    }
//}

// proxy je kopija servera
//class ServerProxy: ServerProtocol {
//
//    lazy private var server: ServerSide = ServerSide()
//
//    func grantAccess(user: User) {
//        server.grantAccess(user: user)
//    }
//    func denyAccess(user: User) {
//        server.denyAccess(user: user)
//    }
//}


//let user = User()
//let proxy = ServerProxy()
//proxy.grantAccess(user: user)
//proxy.denyAccess(user: user)


/// Ovi iznad je bio virtualni proxy, a sad sigurnosni proxy
// Dakle postoji mnogo proxyja: virtualni, kesirani, sigurnosni, sinhronizirajuci, itd.


class User {
    let name = "Vuk"
    let password = "123"
}

protocol ServerProtocol {
    func grantAccess(user: User)
}

class ServerSide: ServerProtocol {
    func grantAccess(user: User) {
        print("access granted to user with nsme = \(user.name)")
    }
}

class ServerProxy: ServerProtocol {
    
    private var server: ServerSide!
    
    func grantAccess(user: User) {
        guard server != nil else {
            print("access can't be granted")
            return
        }
        server.grantAccess(user: user)
    }
    
    func authenticate(user: User) {
        guard user.password == "123" else { return }
        print("user authenticated")
        server = ServerSide()
    }
   
}

let user = User()
let proxy = ServerProxy()

proxy.grantAccess(user: user) // access can't be granted
proxy.authenticate(user: user) // user authenticated
proxy.grantAccess(user: user) // access granted to user with nsme = Vuk
