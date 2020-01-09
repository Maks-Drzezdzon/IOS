import SwiftUI

enum CalculatorButtons: String {
    
    case zero, one, two, three, four, five, six, seven, eight, nine
    case equals, plus, minus, multiply, divide
    case decimal
    case ac, plusMinus, percent
    
    var title: String {
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .plus: return "+"
        case .minus: return "-"
        case .multiply: return "*"
        case .plusMinus: return "+/-"
        case .percent: return "%"
        case .equals: return "="
        case .decimal: return "."
        default:
            return "AC"
        }
    }
    
    var backgroundColor: Color {
        switch  self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .decimal:
            return Color(.darkGray)
        case .ac, .plusMinus, .percent:
            return Color(.lightGray)
        default:
            return .orange
        }
    }
    
}

// Env Object
class GlobalEnviroment: ObservableObject {
    @Published var display = ""
}


struct ContentView: View {
    
    @EnvironmentObject var env: GlobalEnviroment
    
    let buttons: [[CalculatorButtons]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equals]
    ]
    
    var body: some View {
        ZStack(alignment: .bottom){
            // to handle safe area
            // .edgesIgnoringSafeArea grabs safearea
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack (spacing: 12){
                HStack{
                    Spacer()
                    Text(env.display).foregroundColor(.white).font(.system(size: 64))
                }
                
                ForEach(buttons, id : \.self){ row in
                    
                    HStack(spacing: 12){
                        ForEach(row, id: \.self){ button in
                            // ToDo if val is not an int change to a different color
                            
                            Button(action: {
                                // adding button functionality
                                self.env.display = button.title
                            }) {
                                Text(button.title)
                                .font(.system(size: 32))
                                .frame(width:
                                    self.buttonWidth(button: button),
                                       height: (UIScreen.main.bounds.width - 5 * 12) / 4)
                                .foregroundColor(.white)
                                .background(button.backgroundColor)
                                .cornerRadius(self.buttonWidth(button: button))
                            }
                            
                        }
                    }
                }
                
            }.padding(.bottom)
        }
    }
    func buttonWidth(button : CalculatorButtons) -> CGFloat{
        
        if button == .zero {
            // button is twice the len of other buttons
            // and has no gap
            let zeroGap = CGFloat(4 * 12)
            return (UIScreen.main.bounds.width - zeroGap) / 4 * 2
        }
        
        // this prevents buttons fit the screen
        let gaps = CGFloat(5 * 12)
        return (UIScreen.main.bounds.width - gaps) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // env obj needs to be setup in sceneDelegate too
        // on the ContentView()
        ContentView().environmentObject(GlobalEnviroment())
    }
}
