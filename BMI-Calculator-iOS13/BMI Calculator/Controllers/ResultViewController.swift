
import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiValue
    }
    
    @IBAction func reCalculateButton(_ sender: UIButton) {
        //this will layer the screen ontop of the other viewController
        self.dismiss(animated: true, completion: nil)
    }
    
}
