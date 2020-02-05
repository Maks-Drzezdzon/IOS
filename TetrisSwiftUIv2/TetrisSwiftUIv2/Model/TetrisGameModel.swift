import SwiftUI


class TetrisGameModel: ObservableObject {
    // observe changes so view will update automatically
    var numRows: Int
    var numColumns: Int
    @Published var gameBoard: [[TetrisGameBlock?]]
    @Published var tetremino: Tetremino?
    
    var timer: Timer?
    var speed: Double
    
    
    init(numRows: Int = 23, numColumns: Int = 10) {
        // board construction 
        self.numRows = numRows
        self.numColumns = numColumns
        
        gameBoard = Array(repeating: Array(repeating: nil, count: numRows), count: numColumns)
        tetremino = Tetremino(origin: BlockLocation(row: 22, column: 4), blockType: .i)
        speed = 0.1
    }
    
    func blockClicked(row: Int, column: Int){
        if gameBoard[column][row] == nil {
            gameBoard[column][row] = TetrisGameBlock(blockType: BlockType.allCases.randomElement()!)
        }else{
            gameBoard[column][row] = nil
        }
    }
    
    func resumeGame(){
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: speed, repeats: true, block: runEngine)
    }

    func pauseGame(){
        timer?.invalidate()
    }

    func runEngine(timer: Timer){
        // spawn new block
        guard let currentTetrimino = tetremino else{
            tetremino = Tetremino(origin: BlockLocation(row: 22, column: 4), blockType: .i)
            return
        }
        
        // move block
    }
}

struct Tetremino {
    var origin: BlockLocation
    var blockType: BlockType
    
    var blocks:[BlockLocation] {
        [
            BlockLocation(row: 0, column: -1),
            BlockLocation(row: 0, column: 0),
            BlockLocation(row: 0, column: 1),
            BlockLocation(row: 0, column: 2)
        ]
    }
    
    func moveBy(row: Int, column: Int) -> Tetremino{
        let newOrigin = BlockLocation(row: origin.row + row, column: origin.column + column)
        return Tetremino(origin: newOrigin, blockType: blockType)
    }
}

struct BlockLocation {
    var row: Int
    var column: Int
    
}

struct TetrisGameBlock {
    var blockType: BlockType
}

enum BlockType: CaseIterable {
    case i, t, o, j, l, s, z
}
