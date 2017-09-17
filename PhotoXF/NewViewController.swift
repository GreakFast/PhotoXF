
import UIKit

class NewViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
        var data = NSData()
    @IBOutlet var imageView:UIImageView!
    override func viewWillAppear(_ animated: Bool) {
        let delegate =  UIApplication.shared.delegate as! AppDelegate
        if delegate.isStampAdded {
            delegate.isStampAdded = false
            
            let stamp = Stamp()
            let stampSize:CGFloat = 140
            stamp.frame = CGRect(x: 0, y: 0, width: stampSize, height: stampSize)
            stamp.center = self.view.center
            stamp.contentMode = .scaleAspectFit
            stamp.image = delegate.image
            stamp.isUserInteractionEnabled = true
            self.view.addSubview(stamp)
        }
    }

    
    @IBAction func camera() {
        let imagePickController: UIImagePickerController = UIImagePickerController()
        
        imagePickController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePickController.delegate = self
        imagePickController.allowsEditing = true
        
        self.present(imagePickController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:
        
        [String : AnyObject]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.imageView.image = image
        self.imageView.image = image
        self.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func sns() {
        UIGraphicsBeginImageContextWithOptions(self.view.frame.size, self.view.isOpaque, 0.0)
        self.view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let savedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        UIImageWriteToSavedPhotosAlbum(savedImage!, self, nil, nil)
    }
    @IBAction func deleteTapped(_ sender:AnyObject) {
        let subView = self.view.subviews.last!
        if subView.isKind(of: Stamp.self) {
            subView.removeFromSuperview()
        }
    }



    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}