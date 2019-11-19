
print("testing xocde \(10+10) with string interpolation ")
// hold command and / to comment whole line out

struct Town {
    //structs in swift let you create your own data structures
    let name:String
    var citizens:[String]
    var resources:[String: Int]
    
    init(name: String, people: [String], stats:[String:Int]){
        self.name = name
        self.citizens = people
        self.resources = stats
    }
    
    func fortify(){
        print("Wall created")
    }
}

var myTown = Town(name: "town name", people: ["person", "person 2"], stats: ["gold" : 100])
print(myTown.name)
print(myTown.citizens[0])
print(myTown.resources["gold"]!)

protocol CanFly{
    func fly()
}

class Bird{
    var isFemale = true
    func  layEgg() {
        print("lay egg")
    }
}

class Eagle : Bird, CanFly{
    func fly() {
        print("eagle can fly")
    }
    
    func soar(){
        print("eagle glides in air using air currents")
    }
   
}

class Penguin: Bird {
    func swim() {
        print("swims")
    }
}

struct FlyingMuseum{
    func flyingDemo(flyingObject : CanFly){
        flyingObject.fly()
        
    }
    struct AirPlane: CanFly{
        func fly() {
            print("fly")
        }
    }
}


let penguin = Penguin()
penguin.swim()
//cant fly because it does not implement the canfly protocol much like interfaces in java





let pizzaInches: Int = 14
let slicesPerPerson: Int = 4
var numberOfPeople: Int = 12
var numberOfSlices: Int {
    //getter in swift
    get{
        return pizzaInches - 4
    }
    //setter in swift
    set{
        print("number of slices is now \(newValue)")
    }
    //without these you can not reassign values
    //numberOfSlices=10
}

var numberOfPizza: Int {
    get{
        let numberOfPeopleFedPerPizza = numberOfSlices/slicesPerPerson
        return numberOfPeople/numberOfPeopleFedPerPizza
    }
    set{
        let totalSlices = numberOfSlices * newValue
        numberOfPeople = totalSlices/slicesPerPerson
    }
}

print("you can feed \(numberOfPeople) people")

