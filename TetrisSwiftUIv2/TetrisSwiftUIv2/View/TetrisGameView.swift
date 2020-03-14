import SwiftUI

struct TetrisGameView: View{
    @ObservedObject var tetrisGame = TetrisGameViewModel()
    
    var body: some View{
        GeometryReader{(geometry: GeometryProxy) in
            self.drawBoard(boundingReact: geometry.size)
        }
        .gesture(tetrisGame.getMoveGesture())
    }
    
    func drawBoard(boundingReact: CGSize) -> some View {
        let columns = self.tetrisGame.numColumns
        let rows = self.tetrisGame.numRows
        // scaling to screen size
        let blockSize = min(boundingReact.width/CGFloat(columns), boundingReact.height/CGFloat(rows))
        let xoffset = (boundingReact.width - blockSize*CGFloat(columns))/2
        let yoffset = (boundingReact.height - blockSize*CGFloat(rows))/2
        let gameBoard = self.tetrisGame.gameBoard
        
        return ForEach(0...columns-1, id:\.self){ (column: Int) in
            ForEach(0...rows-1, id:\.self){ (row: Int) in
                Path{ path in
                    let x = xoffset + blockSize * CGFloat(column)
                    let y = boundingReact.height - yoffset - blockSize*CGFloat(row+1)
                    
                    let rect = CGRect(x: x, y: y, width: blockSize, height: blockSize)
                    path.addRect(rect)
                }
                .fill(gameBoard[column][row].color)
                .onTapGesture {
                    self.tetrisGame.squareClicked(row: row, column: column)
                }
            }
            
        }
        
    }
}

struct TetrisGameView_Previews: PreviewProvider {
    static var previews: some View{
        TetrisGameView()
    }
}
