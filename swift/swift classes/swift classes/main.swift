
// creating objects
let maks = User(name: "maks", age: 11)
let superMaks = SuperUser(name: "name", age: 2)

print(maks.move())
print(superMaks.move())
print(superMaks.Admin())


//  delegate pattern
//  this is an interface in java
protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assessSituiation() {
        print("does the thing")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
    
}

//structs cant inherit but can implement protocols/interfaces
struct Paramdeic: AdvancedLifeSupport {
    func performCPR() {
        print("do the paramedic thing")
    }
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
}

class Doctor: AdvancedLifeSupport{
    func performCPR() {
        print("do doctor cpr thing")
    }
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    
}

let e = EmergencyCallHandler()
let p = Paramdeic(handler: <#T##EmergencyCallHandler#>)



