import SwiftUI


class TetrisGameViewModel: ObservableObject {
    @Published var tetrisGameModel = TetrisGameModel()
    
    
    var numRows: Int { tetrisGameModel.numRows }
    var numColumns: Int { tetrisGameModel.numColumns }
    @Published var gameBoard: [[TetrisGameSquare]]{
        
    }
    
    func convertToSquare(block: TetrisGmaeBlock) -> TetrisGameSquare {
        
    }
    
    func getColor(blockType: BlockType?) -> Color {
        switch blockType {
        case .i:
            return .tetrisLightBlue
        case .j:
            return .tetrisLightBlue
        case .l:
            return .tetrisLightBlue
        case .o:
            return .tetrisLightBlue
        case .s:
            return .tetrisLightBlue
        case .t:
            return .tetrisLightBlue
        case .z:
            return .tetrisLightBlue
        default:
            return .tetrisBlack
        }
    }
    
    func squareClicked(row: Int, column: Int){
        if gameBoard[column][row].color == Color.tetrisBlack {
            gameBoard[column][row].color = Color.tetrisRed
        }else{
            gameBoard[column][row].color = Color.tetrisBlack
        }
    }
    
}

struct TetrisGameSquare {
    var color: Color
}
