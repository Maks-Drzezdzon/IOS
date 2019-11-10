class User {
    var name: String
    var age: Int
    
    init(name: String, age:Int) {
        self.age = age
        self.name = name
    }
    
    func move()  {
        print("i can move")
    }
    
    func run() {
        print("i can run")
    }
}
