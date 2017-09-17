import UIKit

class Stamp: UIImageView, UIGestureRecognizerDelegate {
    
    var currentTransform:CGAffineTransform!
    var scale: CGFloat = 1.0
    var angle: CGFloat = 0
    var isMoving: Bool = false
    
    override func didMoveToSuperview() {
        let rotationRecognizer: UIRotationGestureRecognizer = UIRotationGestureRecognizer(target:self, action:#selector(Stamp.rotationGesture(_:)))
        rotationRecognizer.delegate = self
        self.addGestureRecognizer(rotationRecognizer)
        
        let pinchRecognizer: UIPinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(Stamp.pinchGesture(_:)))
        pinchRecognizer.delegate = self
        self.addGestureRecognizer(pinchRecognizer)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func rotationGesture(_ gesture: UIRotationGestureRecognizer){
        print("Rotation detected!", terminator: "")
        
        if !isMoving && gesture.state == UIGestureRecognizerState.began {
            isMoving = true
            currentTransform = self.transform
        }else if isMoving && gesture.state == UIGestureRecognizerState.ended {
            isMoving = false
            scale = 1.0
            angle = 0.0
        }
        
        angle = gesture.rotation
        
        let transform = currentTransform.concatenating(CGAffineTransform(rotationAngle: angle)).concatenating(CGAffineTransform(scaleX: scale, y: scale))
        
        self.transform = transform
        
    }
    
    func pinchGesture(_ gesture: UIPinchGestureRecognizer){
        print("Pinch detected!", terminator: "")
        
        if !isMoving && gesture.state == UIGestureRecognizerState.began {
            isMoving = true
            currentTransform = self.transform
        }else if isMoving && gesture.state == UIGestureRecognizerState.ended {
            isMoving = false
            scale = 1.0
            angle = 0.0
        }
        
        scale = gesture.scale
        
        let transform = currentTransform.concatenating(CGAffineTransform(rotationAngle: angle)).concatenating(CGAffineTransform(scaleX: scale, y: scale))
        
        self.transform = transform;
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.superview?.bringSubview(toFront: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self.superview)
        let preLocation = touch?.previousLocation(in: self.superview)
        let dx = location!.x - preLocation!.x
        let dy = location!.y - preLocation!.y
        self.center = CGPoint(x: self.center.x + dx, y: self.center.y + dy)
    }
    
}
