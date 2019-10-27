print("items to print are ", item:"value", key:"value")
print("5+3 is \(5+3)");

var number = 10;
var numberTwo = 1
var numberFive:Float
numberFive = 1.0

print("values can be printed \(number) with \ and ( ) ");

//optionals in swift

var hiddenInt: Int? = nil
// nil means no value
hiddenInt = 10
//when uisng optionals you have to unwrap the var to get its value
if hiddenInt != nil{
	print(hiddenInt!)
}else{
	print("data is nil")
}

//optional binding
#
# not clear on this look at later
#
var myString:String?
myString = "Hello, Swift 4!"

if let yourString = myString {
   print("Your string has - \(yourString)")
} else {
   print("Your string does not have a value")
}

//constants
let _const="maks"
//must start with _ or lowercase letter