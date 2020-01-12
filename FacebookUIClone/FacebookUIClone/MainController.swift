import UIKit
import LBTATools

class PostCell: LBTAListCell<String>{
    let imageView = UIImageView(backgroundColor: .systemTeal)
    let nameLabel = UILabel(text: "Name")
    let dateLabel = UILabel(text: "Friday at 11:11pm")
    let postTextLabel = UILabel(text: "Here is my post")
    // let imageViewGrid = UIView(backgroundColor: .purple)
    
    let  photosGridController = PhotosGridController()
    
    
    
    override func setupViews() {
        backgroundColor = .white
        // display in stackView
        stack(hstack(imageView.withHeight(40).withWidth(40),
            stack(nameLabel, dateLabel),
            spacing: 8).padLeft(12).padRight(12).padTop(12),
            postTextLabel,
            photosGridController.view,
            spacing: 8)
        
    }
}

class StoryHeader: UICollectionReusableView{
    let storiesController = StoriesController( scrollDirection: .horizontal)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemTeal
        stack(storiesController.view)
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

class StoryPhotoCell: LBTAListCell<String> {
    
    override var item: String! {
        didSet{
            imageView.image = UIImage(named: item)
        }
    }
    
    
    let imageView = UIImageView(image: nil, contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "User name", font: .boldSystemFont(ofSize: 14), textColor: .white)
    
    override func setupViews() {
        imageView.layer.cornerRadius = 10
        
        
        stack(imageView)
        
        setupGradientLayer()
        
        // UIview wil push it down by taking up the space
        stack(UIView(), nameLabel).withMargins(.allSides(8))
    }
    
    let gradientLayer = CAGradientLayer()
    
    fileprivate func setupGradientLayer(){
        
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        // color range
        gradientLayer.locations = [0.5 ,1]
        layer.cornerRadius = 10
        clipsToBounds = true
        layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // sets bounds for color frame to the [0.5 , 1]
        gradientLayer.frame = bounds
    }
    
}

class StoriesController: LBTAListController<StoryPhotoCell ,String>, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 100, height: view.frame.height - 24)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.items = ["Image", "face","Image", "face","Image", "face"]
    }
}


class MainController: LBTAListHeaderController<PostCell, String, StoryHeader>, UICollectionViewDelegateFlowLayout{
    // item to render and type
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: 0, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top:12, left: 0, bottom: 0, right: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .init(white: 0.9, alpha: 1)
        
        self.items = ["test", "backgroud", "2", "3"]
        
        setupNavBar()
    }
    
    let logoImageView = UIImageView(image: UIImage(named: "logo"), contentMode: .scaleAspectFill)
    
    fileprivate func setupNavBar(){
        // 120 or the width and 8 + 8 for edges = 16, 60 for each button
        let width = view.frame.width - 120 - 16 - 60
        let height = view.frame.height
        
        let titleView = UIView(backgroundColor: .clear)
        titleView.frame = .init(x: 0, y: 0, width: width, height: height)
        
        let searchButton = UIButton(title: "Search", titleColor: .black)
        // let messageButton = UIButton(title: "Message", titleColor: .black)
        
        titleView.hstack(logoImageView.withWidth(120), UIView(backgroundColor: .clear).withWidth(width), searchButton.withWidth(60)) // messageButton.withWidth(60))
        
        navigationItem.titleView = titleView
        
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let safeAreaTop: CGFloat = 88
        // offset is -88 with 88 its 0
        let offset = scrollView.contentOffset.y + safeAreaTop
        
        let alpha: CGFloat = 1 - ((scrollView.contentOffset.y + safeAreaTop) / safeAreaTop)
        logoImageView.alpha = alpha
        
        // print(scrollView.contentOffset.y)
        // reverse offset to -offset so it scrolls up and not down
        // min sets it to 0 - -offset so it stays ontop
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //cell size
        return .init(width: view.frame.width, height: 400)
    }

}

import SwiftUI
struct MainPreview: PreviewProvider {
    // this is now overriding the other view
    static var previews: some View{
        //Text("main preview")
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) -> UIViewController {
            return UINavigationController(rootViewController: MainController())
        }
        
        func updateUIViewController(_ uiViewController: MainPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) {
        }
    }
}
