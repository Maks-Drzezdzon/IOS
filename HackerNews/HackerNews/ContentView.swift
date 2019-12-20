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
                HStack {
                    Text(String(post.points))
                    Text(post.title)
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
