import SwiftUI

struct DetailView: View {
    let url: String?
    
    var body: some View {
        // initialize webview with param
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}

