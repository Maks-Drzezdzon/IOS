import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imgView: UIImageView!
    
    let iamgePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iamgePicker.delegate = self
    }

    
    
    @IBAction func cameraButton(_ sender: UIBarButtonItem) {
    }
    
}

