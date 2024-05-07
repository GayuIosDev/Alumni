//
//  ZoomableImageView.swift
//  VsAlumni
//
//  Created by admin on 15/02/24.
//

import Foundation
import UIKit

class ZoomableImageView: UIScrollView, UIScrollViewDelegate {
    
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Set up the scroll view
        self.delegate = self
        self.minimumZoomScale = 1.0
        self.maximumZoomScale = 6.0
        
        // Set up the image view
        imageView = UIImageView(frame: CGRect(origin: CGPoint.zero, size: frame.size))
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
        
        // Add pinch gesture recognizer
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinchGesture(_:)))
        self.addGestureRecognizer(pinchGesture)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handlePinchGesture(_ gestureRecognizer: UIPinchGestureRecognizer) {
        if gestureRecognizer.state == .changed {
            let scale = gestureRecognizer.scale
            self.zoomScale *= scale
            gestureRecognizer.scale = 1.0
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func setImage(_ image: UIImage) {
        imageView.image = image
    }
}

// Usag
