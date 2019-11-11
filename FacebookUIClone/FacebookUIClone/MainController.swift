//
//  MainController.swift
//  FacebookUIClone
//
//  Created by Maks Drzezdzon on 11/11/2019.
//  Copyright © 2019 Maks Drzezdzon. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
    }

}

import SwiftUI
struct MainPreview: PreviewProvider {
    // this is now overriding the other view
    static var previews: some View{
        Text("main preview")
    }
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) -> UIViewController {
            return MainController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) {
        }
    }
}
