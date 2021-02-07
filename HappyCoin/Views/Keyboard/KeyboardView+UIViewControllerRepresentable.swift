//
//  KeyboardView+UIViewControllerRepresentable.swift
//  HappyCoin
//
//  Created by Stefano on 06.02.21.
//

import SwiftUI

struct KeyboardView: UIViewControllerRepresentable {
        
    let digitHandler: (Int) -> Void
    let decimalHandler: () -> Void
    let deleteHandler: () -> Void
    
    typealias UIViewControllerType = KeyboardViewController
    
    func makeUIViewController(context: Context) -> KeyboardViewController {
        let keyboard = KeyboardViewController()
        keyboard.delegate = context.coordinator
        return keyboard
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIViewController(_ uiViewController: KeyboardViewController, context: Context) { }
}

extension KeyboardView {
    
    class Coordinator: NSObject, KeyboardViewControllerDelegate {
        
        let parent: KeyboardView
        
        init(_ parent: KeyboardView) {
            self.parent = parent
        }
        
        func didTap(digit: Int) {
            parent.digitHandler(digit)
        }
        
        func didTapDot() {
            parent.decimalHandler()
        }
        
        func didTapDelete() {
            parent.deleteHandler()
        }
    }
}
