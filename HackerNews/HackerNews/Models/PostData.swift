import Foundation

struct Results: Decodable{
    let hits:[Post]
}

// struct to keep data from json
struct Post: Decodable, Identifiable{
    // req identifiable so post can be used in list
    var id: String{
        return objectID // binds id field to custom id field
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String? // if post is a comment or Q&A
}
