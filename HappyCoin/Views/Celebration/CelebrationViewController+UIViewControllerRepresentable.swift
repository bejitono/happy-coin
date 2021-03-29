//
//  CelebrationViewController+UIViewControllerRepresentable.swift
//  HappyCoin
//
//  Created by Stefano on 28.03.21.
//

import SwiftUI

struct CelebrationView: UIViewControllerRepresentable {
    
    @Binding var happy: Bool?
    private let celebrationViewController = CelebrationViewController()
    
    typealias UIViewControllerType = CelebrationViewController
    
    func makeUIViewController(context: Context) -> CelebrationViewController {
        return celebrationViewController
    }
    
    func updateUIViewController(_ uiViewController: CelebrationViewController, context: Context) {
        guard let happy = happy else { return }
        uiViewController.celebrate(happy: happy)
    }
}
