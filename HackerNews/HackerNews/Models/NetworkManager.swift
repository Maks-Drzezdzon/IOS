import Foundation

class NetworkManager: ObservableObject{
    @Published var posts = [Post]()
    // 2 way binding observable and observed
    // listener for when content is changed
    
    func getData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do {
                            // decode data
                            let results = try decoder.decode(Results.self, from: safeData)
                            // can not publish changes from abckground thread
                            // so you have to use mainthread like andrioid
                            DispatchQueue.main.async {
                                // bind variable to object
                                // save results.hits array data
                                self.posts = results.hits
                                // posts is an observable so it will be polled when data is updated
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            // starts networking task
            task.resume()
        }
    }
}
