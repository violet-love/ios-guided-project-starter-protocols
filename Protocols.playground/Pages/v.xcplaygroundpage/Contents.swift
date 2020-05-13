import Foundation

//: # Protocols
//: Protocols are, as per Apple's definition in the _Swift Programming Language_ book:
//:
//: "... a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol."
//:
//: The below example shows a protocol that requires conforming types have a particular property defined.
//Any one using this protocol using this protocol must have a fullName property.
protocol FullyNamed {
    
    var fullName: String { get }
    
}

//The " : FullyNamed" is the adoption or "promise" that we will follow the protocol's requirements
struct Person: FullyNamed {
    
    var fullName: String
    
}

let me = Person(fullName: "Violet Lavender Love")

class StarShip: FullyNamed {
    //The StarShip could have a prefix but not all will
    var prefix: String?
    var name: String
    
    init(prefix: String?, name: String) {
        
        self.prefix = prefix
        self.name = name
        
    }
    // Conformance to the FullyNamed protocol
    var fullName: String {
       
        if let unwrappedPrefix = prefix {
            
            return "\(unwrappedPrefix) \(name)"
            
        } else {
            return name
        }
        
    }
}
extension StarShip: Equatable {
    //All we need to do is compare each side and see if they have the same values or not
    static func == (lhs: StarShip, rhs: StarShip) -> Bool {
        if lhs.fullName == rhs.fullName {
            return true
        } else {
            return false
        }
    }
}
let firefly = StarShip(prefix: nil, name: "Serenity")
let enterprise = StarShip(prefix: "USS", name: "Enterprise")
print(enterprise.fullName)

enterprise.name = "Lambda"
print(enterprise.name)

let fullyNamedThings: [FullyNamed] = [me, enterprise]
//: Protocols can also require that conforming types implement certain methods.
protocol GeneratesRandomNumbers {
    //We intentionally don't write the implementation of this function in the protocol. We instead leave it to the the adopters to create their own implementation
    func random() -> Int
}

class OneThroughTen: GeneratesRandomNumbers {
    func random() -> Int {
        return Int.random(in: 1...10)
    }
}

let generator = OneThroughTen()

generator.random()
//: Using built-in Protocols
if firefly == enterprise {
    print("They are the same!")
} else {
    print("These are not the same StarShip, Silly!")
}


//: ## Protocols as Types


// Make a protocol called Animal
// The protocol needs to have a property called numberOfLegs: Int
// and a function called func speak()
// Create two or more data types (class or struct) that adopt and conform to this protocol.
// Cat and Dog for example

protocol Animal {
    let numberOfLegs: Int { get }
    func Speak() {
    }
}

class Dog: Animal {
    
    let numberOfLegs: Int
    
    init(numberOfLegs: Int = 4) {
        self.numberOfLegs = numberOfLegs
    }
    func speak() {
        print("Bark, Bark")
    }
}

class Sloth: Animal {
    
    let numberOfLegs: Int
    
    init(numberOfLegs: Int = 4) {
        self.numberOfLegs = numberOfLegs
    }
    
    func speak() {
        print("Moom, Mooom")
    }
}
