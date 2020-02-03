import SwiftUI


class TetrisGameModel: ObservableObject {
    // observe changes so view will update automatically
    var numRows: Int
    var numColumns: Int
    @Published var gameBoard: [[TetrisGmaeBlock?]]
    
    init(numRows: Int = 23, numColumns: Int = 10) {
        // board construction 
        self.numRows = numRows
        self.numColumns = numColumns
        
        gameBoard = Array(repeating: Array(repeating: TetrisGameSquare(color: Color.tetrisBlack), count: numRows), count: numColumns)
    }
}

struct TetrisGmaeBlock {
    var blockType: BlockType
}

enum BlockType{
    case i, t, o, j, l, s, z
}
