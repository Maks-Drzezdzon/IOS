//
//  PhotosGridController.swift
//  FacebookUIClone
//
//  Created by Maks Drzezdzon on 17/12/2019.
//  Copyright © 2019 Maks Drzezdzon. All rights reserved.
//

import UIKit
import SwiftUI
import LBTATools

class PhotoGridCell: LBTAListCell<String>{
    
    override var item: String!{
        didSet{
            imageView.image = UIImage(named: item)
        }
    }
    
    let imageView = UIImageView(image: UIImage(named: "face"), contentMode: .scaleAspectFill)
    
    override func setupViews(){
        backgroundColor = .gray
        
        addSubview(imageView)
        imageView.fillSuperview()
        // stack(imageView)
    }
}

class PhotosGridController: LBTAListController<PhotoGridCell,String>, UICollectionViewDelegateFlowLayout{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .lightGray
        self.items = ["face", "tie-wrap-dress" , "dress_PNG18","dress_PNG18", "dress_PNG18"]
    }
    let cellSpacing: CGFloat = 4
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if self.items.count == 4{
            
        }
        
        if indexPath.item == 0 || indexPath.item == 1{
            let width = (view.frame.width - 3 * cellSpacing) / 2
            return .init(width: width, height: width)
        }
        
        let width = (view.frame.width - 4.1 * cellSpacing) / 3
        return .init(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: cellSpacing, bottom: cellSpacing, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
}

struct PhotoGridPreview: PreviewProvider {
    static var previews: some View{
        ContainerView()
    }
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<PhotoGridPreview.ContainerView>) -> UIViewController {
            return PhotosGridController()
        }
        func updateUIViewController(_ uiViewController: PhotoGridPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<PhotoGridPreview.ContainerView>) {
            
        }
    }
}
