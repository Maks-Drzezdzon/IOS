//main link + notes https://www.tutorialspoint.com/swift/index.htm
//array link https://developer.apple.com/documentation/swift/array

/*****************************************************************/
/*****************************************************************/
import cocoa
//imports can be any objective c, swift or c library
// variables
var str = "this is a test";
let constant = 12;
var number:Int = 23;
var decimal:Float = 2.1;
// ';' are not manditory in swift but they are allowed

print("This is a string \(str)  this is a constant \(constant)  this is a number \(number)  this is a decimal  \(decimal)");
var allow:Bool = true;
var close:Bool = false;
var numbers: [Float] = [Float(constant), Float(number), decimal];

var strWithType: String = "test string";
let constantWithType: String = " ";


//functions

func function(data: String) -> String{
	//similar to how python in web.
	return data
}
print(function(data: strWithType));

/*
  _                                    _     
 | |                                  | |    
 | | _____ _   ___      _____  _ __ __| |___ 
 | |/ / _ \ | | \ \ /\ / / _ \| '__/ _` / __|
 |   <  __/ |_| |\ V  V / (_) | | | (_| \__ \
 |_|\_\___|\__, | \_/\_/ \___/|_|  \__,_|___/
            __/ |                            
           |___/                             

Class	deinit	Enum	extension
Func	import	Init	internal
Let	operator	private	protocol
public	static	struct	subscript
typealias	var


// key in statements

break	case	continue	default
do	else	fallthrough	for
if	in	return	switch
where	while

//key in contexts

associativity	convenience	dynamic	didSet
final	get	infix	inout
lazy	left	mutating	none
nonmutating	optional	override	postfix
precedence	prefix	Protocol	required
right	set	Type	unowned
weak	willSet
*/
