import SwiftUI

struct ContentView: View {
    
    let buttons = [
        ["7", "8", "9" , "x"],
        ["4", "5", "6" , "-"],
        ["1", "2", "3" , "+"],
        ["0", "AC", "." , "="]
    ]
    
    var body: some View {
        ZStack(alignment: .bottom){
            // to handle safe area
            // .edgesIgnoringSafeArea grabs safearea
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack (spacing: 12){
                HStack{
                    Spacer()
                    Text("42").foregroundColor(.white).font(.system(size: 64))
                }
                
                ForEach(buttons, id : \.self){ row in
                    
                    HStack(spacing: 12){
                        ForEach(row, id: \.self){ button in
                            // ToDo if val is not an int change to a different color
                            Text(button)
                                .font(.system(size: 32))
                                .frame(width: self.buttonWidth(), height: self.buttonWidth())
                                .foregroundColor(.white)
                                .background(Color.yellow)
                                .cornerRadius(self.buttonWidth())
                        }
                    }
                }
                
            }.padding(.bottom)
        }
    }
    func buttonWidth() -> CGFloat{
        // this prevents buttons fit the screen
        let gaps = CGFloat(5 * 12)
        return (UIScreen.main.bounds.width - gaps) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
