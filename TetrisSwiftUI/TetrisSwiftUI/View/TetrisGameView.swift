import SwiftUI

struct TetrisGameView: View{
    @ObservedObject var tetrisGame = TetrisGameViewModel()
    
    var body: some View{
        Text("Test")
    }
}

struct TetrisGameView_Previews: PreviewProvider {
    static var previews: some View{
        TetrisGameView()
    }
}
