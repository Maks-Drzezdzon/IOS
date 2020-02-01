import SwiftUI

struct TetrisGameView: View{
    @ObservedObject var tetrisGame = TetrisGameViewModel()
    
    var body: some View{
        GeometryReader{(geometry: GeometryProxy) in
            self.drawBoard(boundingReact: geometry.size)
        }
    }
    
    func drawBoard(boundingReact: CGSize) -> some View {
        let columns = self.tetrisGame.numColumns
        let rows = self.tetrisGame.numRows
        // scaling to screen size
        let blockSize = min(boundingReact.width/CGFloat(columns), boundingReact.height/CGFloat(rows))
        let yoffset = (boundingReact.width - blockSize*CGFloat(columns))/2
        let xoffset = (boundingReact.height - blockSize*CGFloat(rows))/2
        
        return ForEach(0...columns-1, id:\.self){ (column: Int) in
            ForEach(0...rows-1, id:\.self){ (row: Int) in
                let x = xoffset + blockSize * CGFloat(column)
                let y = boundingReact.height - yoffset - blockSize*CGFloat(rows - 1)
            }
            
        }
        
    }
}

struct TetrisGameView_Previews: PreviewProvider {
    static var previews: some View{
        TetrisGameView()
    }
}
