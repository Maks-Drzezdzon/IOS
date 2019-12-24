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
            guard let ciimage = CIImage(image: userPickedImage) else{
                fatalError("could not convert to ci image")
            }
            detect(image: ciimage)
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    func detect(image: CIImage){
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else{
            fatalError("loading core ml model failed")
        }
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else{
                fatalError("model failed to proccess image")
            }
        print(results)
            
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do{
            try handler.perform([request])
        }catch{
            print(error)
        }
        
    }
    
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true, completion: nil)
    }
    
}

