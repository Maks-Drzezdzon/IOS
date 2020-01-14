import UIKit

class ConcversionViewController: UIViewController {
    
    @IBOutlet weak var celsiousLabel: UITextField!
    @IBOutlet weak var textField: UILabel!
    
    @IBAction func fahrenheitFieldEditingChnaged(_ textField: UITextField) {
        // connected this method to controller via sent events
        // to update dynamically without sending like angular
        
        if let text = textField.text, !text.isEmpty{
            celsiousLabel.text = text
        }else{
            celsiousLabel.text = "???"
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer){
        textField.resignFirstResponder()
    }
    
}
