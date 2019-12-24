import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // implementing camre
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        //imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        
    }
    
    // picked image and do something with it
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // info is a dict
        // you dont know what data type the data is so you optional bind it to uiimage
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageView.image = userPickedImage
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true, completion: nil)
    }
    
}

