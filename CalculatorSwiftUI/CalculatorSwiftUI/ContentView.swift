import SwiftUI

enum CalculatorButtons: String {
    
    case zero, one, two, three, four, five, six
    case equals, plus, minus, multiply, divide
    case ac, plusMinus, percent
    
    var title:
    // do things in the morning :D
    
    var backgroundColor: Color {
        switch  self {
        case .zero, .one, .two, .three, .four, .five, .six:
            return Color(.darkGray)
        case .ac, .plusMinus, .percent:
            return Color(.lightGray)
        default:
            return .orange
        }
    }
    
}

struct ContentView: View {
    
    let buttons: [[CalculatorButtons]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
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
                            Text(button.rawValue)
                                .font(.system(size: 32))
                                .frame(width: self.buttonWidth(), height: self.buttonWidth())
                                .foregroundColor(.white)
                                .background(button.backgroundColor)
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
