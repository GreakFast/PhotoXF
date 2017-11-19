
import UIKit

class NewViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
        var data = NSData()
    @IBOutlet var imageView:UIImageView!
    override func viewWillAppear(_ animated: Bool) {
        let delegate =  UIApplication.shared.delegate as! AppDelegate
        if delegate.isStampAdded {
            delegate.isStampAdded = false
            
            let stamp = Stamp()
            let stampSize:CGFloat = 200
            stamp.frame = CGRect(x: 0, y: 0, width: stampSize, height: stampSize)
            stamp.center = self.view.center
            stamp.contentMode = .scaleAspectFit
            stamp.image = delegate.image
            stamp.isUserInteractionEnabled = true
            self.view.addSubview(stamp)
        }
    }

    @IBAction func camera() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            picker.allowsEditing = true
            present(picker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:
        
        [String : AnyObject]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.imageView.image = image
        self.imageView.image = image
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func Back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sns() {
        UIGraphicsBeginImageContextWithOptions(self.imageView.frame.size, self.view.isOpaque, 0.0)
        self.view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let savedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        UIImageWriteToSavedPhotosAlbum(savedImage!, self, nil, nil)
        
        let alert: UIAlertController = UIAlertController(title: "保存", message: "保存が完了しました。", preferredStyle:  UIAlertControllerStyle.alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
            (action: UIAlertAction!) -> Void in
            print("OK")
        })
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func deleteTapped(_ sender:AnyObject) {
        let subView = self.view.subviews.last!
        if subView.isKind(of: Stamp.self) {
            subView.removeFromSuperview()
        }
    }
    
    @IBAction func das() {
        UIGraphicsBeginImageContextWithOptions(self.imageView.frame.size, self.view.isOpaque, 0.0)
        self.view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let savedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        UIImageWriteToSavedPhotosAlbum(savedImage!, self, nil, nil)
        
        let alert: UIAlertController = UIAlertController(title: "保存", message: "保存が完了しました。", preferredStyle:  UIAlertControllerStyle.alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
            (action: UIAlertAction!) -> Void in
            print("OK")
        })
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func StampBack(segue: UIStoryboardSegue) {}

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
}
