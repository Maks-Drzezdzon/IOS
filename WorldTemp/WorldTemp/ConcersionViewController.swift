import UIKit

class ConcversionViewController: UIViewController {
    
    @IBOutlet weak var celsiousLabel: UITextField!
    
    
    @IBAction func fahrenheitFieldEditingChnaged(_ textField: UITextField) {
        // connected this method to controller via sent events
        // to update dynamically without sending like angular 
        
        if let text = textField.text, !text.isEmpty{
            celsiousLabel.text = text
        }else{
            celsiousLabel.text = "???"
        }
    }
    
}
