//main link + notes https://www.tutorialspoint.com/swift/index.htm
// variables
var str = "this is a test"
let constant = 12
var number:Int = 23
var decimal:Float = 2.1

print("This is a string \(str)  this is a constant \(constant)  this is a number \(number)  this is a decimal  \(decimal)")
var allow:Bool = true
var close:Bool = false
var numbers: [Float] = [Float(constant), Float(number), decimal]

var strWithType: String = "test string"
let constantWithType: String = " "

// array link https://developer.apple.com/documentation/swift/array

//functions

func function(data: String) -> String{
	//similar to how python in web.
	return data
}
print(function(data: strWithType))