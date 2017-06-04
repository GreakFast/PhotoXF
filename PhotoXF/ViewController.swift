//
//  ViewController.swift
//  PhotoXF
//
//  Created by KOTARO on 2017/05/26.
//  Copyright © 2017年 KOTARO. All rights reserved.
//

import UIKit

import Accounts

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var kurukuruImageView: UIImageView!
    
    @IBOutlet var cameraImageView: UIImageView!
    var originalImage: UIImage!
    var filter: CIFilter!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func takePhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
    } else {
    print("error")
    }
}
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        cameraImageView.image = info[UIImagePickerControllerEditedImage] as? UIImage
        originalImage = cameraImageView.image
        dismiss(animated: true, completion: nil)
    }
    @IBAction func savePhoto() {
        
        UIImageWriteToSavedPhotosAlbum(cameraImageView.image!, nil, nil, nil)
        let alert: UIAlertController = UIAlertController(title: "保存", message: "保存が完了しました。", preferredStyle:  UIAlertControllerStyle.alert)
        
        // ② Actionの設定
        // Action初期化時にタイトル, スタイル, 押された時に実行されるハンドラを指定する
        // 第3引数のUIAlertActionStyleでボタンのスタイルを指定する
        // OKボタン
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
            // ボタンが押された時の処理を書く（クロージャ実装）
            (action: UIAlertAction!) -> Void in
            print("OK")
        })
        alert.addAction(defaultAction)
        
        // ④ Alertを表示
        present(alert, animated: true, completion: nil)
        

    }
    @IBAction func colorFilter() {
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
    @IBAction func openAlbum() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            picker.allowsEditing = true
            present(picker, animated: true, completion: nil)
            
        }
    }
    @IBAction func snsPhoto() {
        let shareText = "シンプルなフィルター機能アプリ！"
        let shareImage = cameraImageView.image!
        let activityItems: [Any] = [shareText, shareImage]
        let activityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        let excludedActivityTypes = [UIActivityType.postToWeibo, .saveToCameraRoll, .print]
        activityViewController.excludedActivityTypes = excludedActivityTypes
        present(activityViewController, animated: true, completion: nil)
    }
    @IBAction func ImageBack() {
        let filterImage: CIImage = CIImage(image: originalImage)!
        filter = CIFilter(name: "CIColorControls")!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        filter.setValue(1.0, forKey: "inputSaturation")
        filter.setValue(0.0, forKey: "inputBrightness")
        filter.setValue(1.0, forKey: "inputContrast")
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)
    }
    @IBAction func LiteDown() {
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
    @IBAction func LiteUp() {
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
    @IBAction func sikisaituyoi() {
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
    @IBAction func makkurokurosuke() {
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
    @IBAction func sekand() {
        let filterImage: CIImage = CIImage(image: originalImage)!
        filter = CIFilter(name: "CISepiaTone")!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        filter.setValue(0.8, forKey: "inputIntensity")
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)
        

    }
    @IBAction func GXRkaikei() {
        let filterImage: CIImage = CIImage(image: originalImage)!
        filter = CIFilter(name: "CIColorMonochrome")!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        filter.setValue(CIColor(red: 0.75, green: 0.75, blue: 0.75), forKey: "inputColor")
        filter.setValue(1.0, forKey: "inputIntensity")
        
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)
        

    }
    @IBAction func msgbox() {
        let filterImage: CIImage = CIImage(image: originalImage)!
        filter = CIFilter(name: "CIHueAdjust" )!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        filter.setValue(3.14, forKey: "inputAngle")
        
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)
        

    }
    @IBAction func inputbox() {
        let filterImage: CIImage = CIImage(image: originalImage)!
        filter = CIFilter(name: "CIFalseColor" )!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        filter.setValue(CIColor(red: 0.44, green: 0.5, blue: 0.2), forKey: "inputColor0")
        filter.setValue(CIColor(red: 1, green: 0.92, blue: 0.50), forKey: "inputColor1")
        
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)
        

    }
    @IBAction func exz() {
        let filterImage: CIImage = CIImage(image: originalImage)!
        filter = CIFilter(name: "CILanczosScaleTransform")!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        filter.setValue(NSNumber(value: 0.1), forKey: kCIInputScaleKey)
        filter.setValue(NSNumber(value: 1.0), forKey: kCIInputAspectRatioKey)
        
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)

    }
    @IBAction func ddda() {
        let filterImage: CIImage = CIImage(image: originalImage)!
        let filter = CIFilter(name: "CICMYKHalftone")!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        filter.setValue(25, forKey: kCIInputWidthKey)
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)
        

    }
    @IBAction func cvb() {
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
    override func viewDidAppear(_ animated: Bool) {
        let animation = CABasicAnimation(keyPath: "transform")
        animation.fromValue = 0
        animation.toValue = 2 * M_PI
        animation.valueFunction = CAValueFunction(name: kCAValueFunctionRotateZ)
        animation.duration = 0.4
        animation.repeatCount = Float.infinity
        kurukuruImageView.layer.add(animation, forKey: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

