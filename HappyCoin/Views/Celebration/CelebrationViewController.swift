//
//  CelebrationViewController.swift
//  HappyCoin
//
//  Created by Stefano on 28.03.21.
//

import AudioToolbox
import UIKit

final class CelebrationViewController: UIViewController {
    
    private let happyImages = ["🌝".image(), "🎉".image(), "🚀".image()]
    private let sadImages = ["😱".image(), "🥵".image(), "😱".image()]
    private let emitter = CAEmitterLayer()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func celebrate(happy: Bool) {
        setupViews(happy: happy)
    }
    
    private func setupViews(happy: Bool) {
        UIView.animate(withDuration: 0.7, delay: 1.0) {
            let rect = CGRect(x: 0.0, y: -150, width: self.view.bounds.width, height: 50.0)
            self.emitter.frame = rect
            self.emitter.emitterShape = CAEmitterLayerEmitterShape.point
            self.emitter.emitterPosition = CGPoint(x: rect.width/2, y: rect.height / 2)
            self.emitter.emitterSize = rect.size
            self.view.layer.addSublayer(self.emitter)
            
            let image = happy ? self.happyImages.randomElement() : self.sadImages.randomElement()
            self.emitter.emitterCells = [CAEmitterCell]()
            
            let emitterCell = CAEmitterCell()
            emitterCell.contents = image??.cgImage
            emitterCell.birthRate = 65
            emitterCell.lifetime = 5
            emitterCell.yAcceleration = 100.0
            emitterCell.xAcceleration = 10.0
            emitterCell.zAcceleration = 10.0
            emitterCell.spin = 5.0
            emitterCell.velocity = 350.0
            //emitterCell.velocityRange = 200.0
            emitterCell.emissionLongitude = .pi * 0.5
            emitterCell.emissionRange = .pi * 0.5
            emitterCell.scale = 0.5
            //emitterCell.scaleRange = 0.5
            
            self.emitter.emitterCells?.append(emitterCell)
            
            Timer.scheduledTimer(
                timeInterval: 5.0,
                target: self,
                selector: #selector(self.stopEmitter),
                userInfo: nil,
                repeats: false
            )
        }
    }
    
    @objc func stopEmitter() {
        emitter.birthRate = 0
    }
}

extension String {
    
    func image() -> UIImage? {
        let size = CGSize(width: 30, height: 30)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.clear.set()
        let rect = CGRect(origin: .zero, size: size)
        UIRectFill(CGRect(origin: .zero, size: size))
        (self as AnyObject).draw(in: rect, withAttributes: [.font: UIFont.systemFont(ofSize: 30)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
