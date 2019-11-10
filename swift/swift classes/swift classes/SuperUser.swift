
// inherits from user
// structs cant inherit and are immutable
// when values change in struct it creates a new struct with new values
// objs are accessed by reference
// structs are passed by value / by copies of the original struct
// apple docs suggest structs over objects, use classes for objc code
class SuperUser: User {
    func Admin() {
         print("im a super user")
    }
    override func move() {
        super.move()
        print("super user move")
    }
}
