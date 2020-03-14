import SwiftUI
import Combine

class TetrisGameViewModel: ObservableObject {
    @Published var tetrisGameModel = TetrisGameModel()
    
    
    var numRows: Int { tetrisGameModel.numRows }
    var numColumns: Int { tetrisGameModel.numColumns }
    var gameBoard: [[TetrisGameSquare]] {
        var board = tetrisGameModel.gameBoard.map { $0.map(convertToSquare) }
        
        if let shadow = tetrisGameModel.shadow {
            for blockLocation in shadow.blocks {
                board[blockLocation.column + shadow.origin.column][blockLocation.row + shadow.origin.row] = TetrisGameSquare(color: getShadowColor(blockType: shadow.blockType))
            }
        }
    }
    
    var anyCancellable: AnyCancellable?
    var  lastMoveLocation = CGPoint?
    
    
    init() {
        anyCancellable = tetrisGameModel.objectWillChange.sink{
            self.objectWillChange.send()
        }
    }
    
    func convertToSquare(block: TetrisGameBlock?) -> TetrisGameSquare {
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
        case .none:
            return .tetrisBlack
        default:
            return .tetrisBlack
        }
    }
    
    func squareClicked(row: Int, column: Int){
        tetrisGameModel.blockClicked(row: row, column: column)
    }
    
    func getMoveGesture() -> some Gesture {
        return DragGesture()
    }
    
    func onMoveChanged(value: DragGesture.Value) {
        guard let start = lastMoveLocation else {
            lastMoveLocation = value.location
            return
        }
        
        let xDiff = value.location.x - start.x
        if xDiff > 10 {
            let _ = tetrisGameModel.moveTetrominoRight()
            lastMoveLocation = value.location
            return
        }
        
        if xDiff < -10{
            let _ = tetrisGameModel.moveTetrominoLeft()
            lastMoveLocation = value.location
            return
        }
        
        let yDiff = value.location.y - start.y
        if yDiff > 10 {
            let _ = tetrisGameModel.dropTetromino()()
            lastMoveLocation = value.location
            return
        }
        
        if yDiff < -10{
            let _ = tetrisGameModel.moveTetrominoDown()()
            lastMoveLocation = value.location
            return
        }
    }
    
}

struct TetrisGameSquare {
    var color: Color
}
