import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    
    var body: some View {
        // adds back button and makes it easier to create a view faster
        NavigationView{
            // list view
            // uses posts data from netMgr
            // which is an observalbe
            List(networkManager.posts) { post in
                // gives button indicator
                // expects a view
                // view expects a url to parse
                NavigationLink(destination: DetailView(url: post.url)){
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                        }
                }
            }.navigationBarTitle("HackerNews")
        }.onAppear {
            self.networkManager.getData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
