//tuples
var tupleName = (1, 2.0, 'a', "ab");
var error501 = (501, "not implemented")
print("error /(error501)")
//or
var error501 = (errorCode: 501, description: "not implemented")
print(error501.errorCode)
print(error501.description)