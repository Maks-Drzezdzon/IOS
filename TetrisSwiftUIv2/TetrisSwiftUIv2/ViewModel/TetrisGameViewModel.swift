import SwiftUI


class TetrisGameViewModel: ObservableObject {
    @Published var tetrisGameModel = TetrisGameModel()
    
    
    var numRows: Int { tetrisGameModel.numRows }
    var numColumns: Int { tetrisGameModel.numColumns }
    var gameBoard: [[TetrisGameSquare]]{
        tetrisGameModel.gameBoard.map { $0.map(convertToSquare) }
    }
    
    func convertToSquare(block: TetrisGmaeBlock?) -> TetrisGameSquare {
        return TetrisGameSquare(color: getColor(blockType: block?.blockType))
    }
    
    func getColor(blockType: BlockType?) -> Color {
        switch blockType {
        case .i:
            return .tetrisLightBlue
        case .j:
            return .tetrisDarkBlue
        case .l:
            return .tetrisOrange
        case .o:
            return .tetrisYellow
        case .s:
            return .tetrisGreen
        case .t:
            return .tetrisPurple
        case .z:
            return .tetrisRed
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
