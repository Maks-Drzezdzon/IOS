
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

