import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(.systemTeal)
                .edgesIgnoringSafeArea(.all)
            VStack {
                
                Image("maks")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: CGFloat(150.0), height: CGFloat(150.0))
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 5)
                    )
                
                Text("Maks Drzezdzon")
                    .bold()
                    .italic()
                    .font(.system(size: 50))
                
                Text("Grad SWE")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                Divider()
                InfoView(number: "123 - 123 123 1234" , imageName: "phone.fill")
                InfoView(number: "maks@email.com", imageName: "phone.fill")
                
                
                
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
