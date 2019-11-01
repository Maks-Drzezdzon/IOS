import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftDiceView: UIImageView!
    @IBOutlet weak var rightDiceView: UIImageView!
    
    let diceImagesArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    
    @IBAction func rollButton(_ sender: UIButton) {
        let  randomRoll = Int.random(in: 0...5)
        leftDiceView.image = diceImagesArray.randomElement()
        rightDiceView.image = diceImagesArray [randomRoll]

    }
    
}

