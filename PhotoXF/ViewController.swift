import UIKit

import Accounts

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var cameraImageView: UIImageView!
    var data = NSData()
    var originalImage: UIImage!
    var filter: CIFilter!
    let saveData: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        let imageDate:NSData = UserDefaults.standard.object(forKey: "AS") as! NSData
        originalImage = UIImage(data:imageDate as Data)
        cameraImageView.image = originalImage
        print("original\(originalImage)")

    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        cameraImageView.image = info[UIImagePickerControllerEditedImage] as? UIImage
        originalImage = cameraImageView.image
        saveData.set(UIImagePNGRepresentation(originalImage!), forKey: "AS")
        dismiss(animated: true, completion: nil)
    }
    @IBAction func homes() {
 self.dismiss(animated: true, completion: nil)
    }
    @IBAction func savePhoto() {
        UIImageWriteToSavedPhotosAlbum(cameraImageView.image!, nil, nil, nil)
        let alert: UIAlertController = UIAlertController(title: "保存", message: "保存が完了しました。", preferredStyle:  UIAlertControllerStyle.alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
            (action: UIAlertAction!) -> Void in
            print("OK")
        })
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }

    @IBAction func colorIncrease() {
        let filterImage: CIImage = CIImage(image: originalImage)!
        filter = CIFilter(name: "CIColorControls")!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        filter.setValue(1.0, forKey: "inputSaturation")
        filter.setValue(0.5, forKey: "inputBrightness")
        filter.setValue(2.5, forKey: "inputContrast")
        
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)
    }

    @IBAction func snsPhoto() {
        let shareText = "#PhotoXF"
        let shareImage = cameraImageView.image!
        let activityItems: [Any] = [shareText, shareImage]
        let activityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        let excludedActivityTypes = [UIActivityType.postToWeibo, .saveToCameraRoll, .print]
        activityViewController.excludedActivityTypes = excludedActivityTypes
        present(activityViewController, animated: true, completion: nil)
    }

    @IBAction func darker() {
        let filterImage: CIImage = CIImage(image: originalImage)!
        filter = CIFilter(name: "CIColorControls")!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        filter.setValue(1.0, forKey: "inputSaturation")
        filter.setValue(0.0, forKey: "inputBrightness")
        filter.setValue(2.5, forKey: "inputContrast")
        
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)
        }
    
    @IBAction func brighter() {
        let filterImage: CIImage = CIImage(image: originalImage)!
        filter = CIFilter(name: "CIColorControls")!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        filter.setValue(1.0, forKey: "inputSaturation")
        filter.setValue(0.5, forKey: "inputBrightness")
        filter.setValue(2.0, forKey: "inputContrast")
        
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)
        }

    @IBAction func sawayaka() {
        let filterImage: CIImage = CIImage(image: originalImage)!
        filter = CIFilter(name: "CIColorControls")!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        filter.setValue(8.0, forKey: "inputSaturation")
        filter.setValue(0.5, forKey: "inputBrightness")
        filter.setValue(2.5, forKey: "inputContrast")
        
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)
        }
    
    @IBAction func whiteAndBlack() {
        let filterImage: CIImage = CIImage(image: originalImage)!
        filter = CIFilter(name: "CIColorControls")!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        filter.setValue(0.0, forKey: "inputSaturation")
        filter.setValue(0.5, forKey: "inputBrightness")
        filter.setValue(2.5, forKey: "inputContrast")
        
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)
        }
    
    @IBAction func falseColor() {
        let filterImage: CIImage = CIImage(image: originalImage)!
        filter = CIFilter(name: "CISepiaTone")!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        filter.setValue(0.8, forKey: "inputIntensity")
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)
        }

    @IBAction func purpleKyouchou() {
        let filterImage: CIImage = CIImage(image: originalImage)!
        filter = CIFilter(name: "CIHueAdjust" )!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        filter.setValue(3.14, forKey: "inputAngle")
        
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)
        }
    
    @IBAction func flaseColor() {
        let filterImage: CIImage = CIImage(image: originalImage)!
        filter = CIFilter(name: "CIFalseColor" )!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        filter.setValue(CIColor(red: 0.44, green: 0.5, blue: 0.2), forKey: "inputColor0")
        filter.setValue(CIColor(red: 1, green: 0.92, blue: 0.50), forKey: "inputColor1")
        
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)
        }
    
    @IBAction func size() {
        let filterImage: CIImage = CIImage(image: originalImage)!
        filter = CIFilter(name: "CILanczosScaleTransform")!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        filter.setValue(NSNumber(value: 0.1), forKey: kCIInputScaleKey)
        filter.setValue(NSNumber(value: 1.0), forKey: kCIInputAspectRatioKey)
        
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)
        }
    
    @IBAction func screenBreaker() {
        let filterImage: CIImage = CIImage(image: originalImage)!
        let filter = CIFilter(name: "CICMYKHalftone")!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        filter.setValue(25, forKey: kCIInputWidthKey)
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)
        }
    
    @IBAction func enogu() {
        let filterImage: CIImage = CIImage(image: originalImage)!
        filter = CIFilter(name: "CIColorControls")!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        filter.setValue(20.0, forKey: "inputSaturation")
        filter.setValue(0.9, forKey: "inputBrightness")
        filter.setValue(6.5, forKey: "inputContrast")
        
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)
        }
    
    @IBAction func pink() {
            let filterImage: CIImage = CIImage(image: originalImage)!
            filter = CIFilter(name: "CIFalseColor" )!
            filter.setValue(filterImage, forKey: kCIInputImageKey)
            filter.setValue(CIColor(red: 0.90, green: 0.20, blue: 0.70), forKey: "inputColor0")
            filter.setValue(CIColor(red: 1, green: 0.92, blue: 0.50), forKey: "inputColor1")
            
            let ctx = CIContext(options: nil)
            let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
            cameraImageView.image = UIImage(cgImage: cgImage!)
        }
    
    @IBAction func orange() {
            let filterImage: CIImage = CIImage(image: originalImage)!
            filter = CIFilter(name: "CIFalseColor" )!
            filter.setValue(filterImage, forKey: kCIInputImageKey)
            filter.setValue(CIColor(red: 0.10, green: 0.58, blue: 0.42), forKey: "inputColor0")
            filter.setValue(CIColor(red: 1, green: 0.62, blue: 0.50), forKey: "inputColor1")
            
            let ctx = CIContext(options: nil)
            let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
            cameraImageView.image = UIImage(cgImage: cgImage!)
        }
    
    @IBAction func yellowPurple() {
            let filterImage: CIImage = CIImage(image: originalImage)!
            filter = CIFilter(name: "CIFalseColor" )!
            filter.setValue(filterImage, forKey: kCIInputImageKey)
            filter.setValue(CIColor(red: 0.3, green: 0.3, blue: 0.6), forKey: "inputColor0")
            filter.setValue(CIColor(red: 1, green: 0.92, blue: 0.50), forKey: "inputColor1")
            
            let ctx = CIContext(options: nil)
            let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
            cameraImageView.image = UIImage(cgImage: cgImage!)
        }
    
    @IBAction func purple() {
            let filterImage: CIImage = CIImage(image: originalImage)!
            filter = CIFilter(name: "CIFalseColor" )!
            filter.setValue(filterImage, forKey: kCIInputImageKey)
            filter.setValue(CIColor(red: 0.1, green: 0.1, blue: 0.1), forKey: "inputColor0")
            filter.setValue(CIColor(red: 1, green: 0.1, blue: 0.8), forKey: "inputColor1")
            
            let ctx = CIContext(options: nil)
            let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
            cameraImageView.image = UIImage(cgImage: cgImage!)
        }
    
    @IBAction func blur() {
        let filterImage: CIImage = CIImage(image: originalImage)!
        filter = CIFilter(name: "CIGaussianBlur" )!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        filter.setValue(8, forKey: kCIInputRadiusKey)
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)
    }

    @IBAction func greenKyouchou() {
            let filterImage: CIImage = CIImage(image: originalImage)!
            filter = CIFilter(name: "CIHueAdjust" )!
            filter.setValue(filterImage, forKey: kCIInputImageKey)
            filter.setValue(7.14, forKey: "inputAngle")
            
            let ctx = CIContext(options: nil)
            let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
            cameraImageView.image = UIImage(cgImage: cgImage!)
        }
    
    @IBAction func red() {
            let filterImage: CIImage = CIImage(image: originalImage)!
            filter = CIFilter(name: "CISepiaTone")!
            filter.setValue(filterImage, forKey: kCIInputImageKey)
            filter.setValue(6.0, forKey: "inputIntensity")
            let ctx = CIContext(options: nil)
            let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
            cameraImageView.image = UIImage(cgImage: cgImage!)
        }
    
    @IBAction func gold() {
            let filterImage: CIImage = CIImage(image: originalImage)!
            filter = CIFilter(name: "CIColorMonochrome")!
            filter.setValue(filterImage, forKey: kCIInputImageKey)
            filter.setValue(CIColor(red: 453, green: 777777777.75, blue: 0.75), forKey: "inputColor")
            filter.setValue(1.0, forKey: "inputIntensity")
            
            let ctx = CIContext(options: nil)
            let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
            cameraImageView.image = UIImage(cgImage: cgImage!)
    }
    
    @IBAction func contrast() {
            let filterImage: CIImage = CIImage(image: originalImage)!
            filter = CIFilter(name: "CIColorControls")!
            filter.setValue(filterImage, forKey: kCIInputImageKey)
            filter.setValue(0.3, forKey: "inputSaturation")
            filter.setValue(0.7, forKey: "inputBrightness")
            filter.setValue(3.0, forKey: "inputContrast")
            
            let ctx = CIContext(options: nil)
            let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
            cameraImageView.image = UIImage(cgImage: cgImage!)
        }
    @IBAction func pinch() {
        let filterImage: CIImage = CIImage(image: originalImage)!
        filter = CIFilter(name: "CIPinchDistortion")!
        filter.setValue(CIVector(cgPoint: CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)), forKey: "inputCenter")
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)
    }
    
    @IBAction func mozaiku() {
        let filterImage: CIImage = CIImage(image: originalImage)!
        filter = CIFilter(name: "CIPixellate")!
        
 
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)
    }
    @IBAction func dfault() {
        let filterImage: CIImage = CIImage(image: originalImage)!
       filter = CIFilter(name:"CIUnsharpMask")!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)
    }
    
        @IBAction func slider(_ sender: UISlider) {
                self.view.backgroundColor = UIColor(red: CGFloat(sender.value), green: CGFloat(sender.value), blue: CGFloat(sender.value), alpha: CGFloat(sender.value))
                
                    let filterImage: CIImage = CIImage(image: originalImage)!
                    filter = CIFilter(name: "CIColorCrossPolynomial")!
                    filter.setValue(filterImage, forKey: kCIInputImageKey)
                    let r: [CGFloat] = [25.5, CGFloat(sender.value), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
                    let g: [CGFloat] = [3.5, CGFloat(sender.value), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
                    let b: [CGFloat] = [0.0, CGFloat(sender.value), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
                filter.setValue(CIVector(values: r, count: 10), forKey: "inputRedCoefficients")
                filter.setValue(CIVector(values: g, count: 10), forKey: "inputGreenCoefficients")
                filter.setValue(CIVector(values: b, count: 10), forKey: "inputBlueCoefficients")
                    let ctx = CIContext(options: nil)
                    let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
                    cameraImageView.image = UIImage(cgImage: cgImage!)
                            cameraImageView.setNeedsDisplay()
            }
    
    @IBAction func nega() {
            let filterImage: CIImage = CIImage(image: originalImage)!
            filter = CIFilter(name: "CIColorInvert" )!
            filter.setValue(filterImage, forKey: kCIInputImageKey)
            let ctx = CIContext(options: nil)
            let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
            cameraImageView.image = UIImage(cgImage: cgImage!)
        }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

