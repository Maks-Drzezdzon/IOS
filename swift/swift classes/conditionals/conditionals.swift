var name = "maks"
//if stmt

if name != nil {
	print("do things")
}else if name == 10{
	print("do other things")
}else{
	print(name)
}

var error = 404
// # https://shiftwebsolutions.com/15-common-web-errors/
// # do more here later
switch error {
   case 404 :
      print(" ")
      fallthrough
      // # look what this does later
   case 500 :
      print(" ")
   case 401 :
      print(" ")
   default :
      print( "")
}
