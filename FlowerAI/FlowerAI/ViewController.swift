import UIKit
import CoreML
import Vision
import SwiftyJSON
import Alamofire


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imgView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    let wikipediaURL = "https://en.wikipedia.org/w/api.php"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .camera
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imgView.image = userPickedImage
            guard let ciimage = CIImage(image: userPickedImage) else{
                fatalError("could not convert to ci image")
            }
            detect(image: ciimage)
        }
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    func requestInfo(flowerName: String){
        
        let parameters : [String:String] = [
            "format" : "json",
            "action" : "query",
            "prop" : "extracts",
            "exintro" : "",
            "explaintext" : "",
            "title" : flowerName,
            "indexpageids" : "",
            "redirects" : "1"
            
            
        ]
        
        
        Alamofire.request(wikipediaURL, method: .get, parameters: parameters).responseJSON { (response) in
            if response.result.isSuccess{
                print("Got info")
                print(response)
            }
        }
    }
    
    @IBAction func cameraButton(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func detect(image: CIImage){
        guard let model = try? VNCoreMLModel(for: FlowerClassifier().model) else{
            fatalError("loading core ml model failed")
        }
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let classification = request.results?.first as? VNClassificationObservation else {
                fatalError("classification failed")
            }
            self.navigationItem.title = classification.identifier.capitalized
            self.requestInfo(flowerName: classification.identifier)
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do{
            try handler.perform([request])
        }catch{
            print(error)
        }
        
    }
    
}

