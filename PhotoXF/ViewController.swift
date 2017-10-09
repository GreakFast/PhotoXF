import UIKit

import Accounts

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet var kurukuruImageView: UIImageView!
    
    @IBOutlet var cameraImageView: UIImageView!
    @IBOutlet var Defo: UIImageView!
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
    @IBAction func takePhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
    } else {
            let alert: UIAlertController = UIAlertController(title: "エラー", message: "エラー：カメラにアクセスができませんでした。", preferredStyle:  UIAlertControllerStyle.alert)
            
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
    @IBAction func serect () {
        let imageDate:NSData = UserDefaults.standard.object(forKey: "AS") as! NSData
        originalImage = UIImage(data:imageDate as Data)
        
    }
    @IBAction func Homes() {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func colorFilter() {
        if (originalImage == nil){
            let alert: UIAlertController = UIAlertController(title: "エラー", message: "画像が選択されていません。「撮影」か「ライブラリ」から選択できます。", preferredStyle:  UIAlertControllerStyle.alert)
            
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
            
            
        } else {
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
        let shareText = "#PhotoXF"
        let shareImage = cameraImageView.image!
        let activityItems: [Any] = [shareText, shareImage]
        let activityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        let excludedActivityTypes = [UIActivityType.postToWeibo, .saveToCameraRoll, .print]
        activityViewController.excludedActivityTypes = excludedActivityTypes
        present(activityViewController, animated: true, completion: nil)
    }
    @IBAction func ImageBack() {
        if (originalImage == nil){
            let alert: UIAlertController = UIAlertController(title: "エラー", message: "画像が選択されていません。「撮影」か「ライブラリ」から選択できます。", preferredStyle:  UIAlertControllerStyle.alert)
            
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
            
            
        } else {

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
    }
    @IBAction func LiteDown() {
        if (originalImage == nil){
            let alert: UIAlertController = UIAlertController(title: "エラー", message: "画像が選択されていません。「撮影」か「ライブラリ」から選択できます。", preferredStyle:  UIAlertControllerStyle.alert)
            
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
            
            
        } else {

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
        

    }
    @IBAction func LiteUp() {
        if (originalImage == nil){
            let alert: UIAlertController = UIAlertController(title: "エラー", message: "画像が選択されていません。「撮影」か「ライブラリ」から選択できます。", preferredStyle:  UIAlertControllerStyle.alert)
            
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
            
            
        } else {

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
        

    }
    @IBAction func NextView() {
            let storyboard: UIStoryboard = self.storyboard!
            let Kbs = storyboard.instantiateViewController(withIdentifier: "Kbs")
            present(Kbs, animated: true, completion: nil)
    }
    @IBAction func sikisaituyoi() {
        if (originalImage == nil){
            let alert: UIAlertController = UIAlertController(title: "エラー", message: "画像が選択されていません。「撮影」か「ライブラリ」から選択できます。", preferredStyle:  UIAlertControllerStyle.alert)
            
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
            
            
        } else {

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
        

    }
    @IBAction func makkurokurosuke() {
        if (originalImage == nil){
            let alert: UIAlertController = UIAlertController(title: "エラー", message: "画像が選択されていません。「撮影」か「ライブラリ」から選択できます。", preferredStyle:  UIAlertControllerStyle.alert)
            
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
            
            
        } else {

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

    }
    @IBAction func sekand() {
        if (originalImage == nil){
            let alert: UIAlertController = UIAlertController(title: "エラー", message: "画像が選択されていません。「撮影」か「ライブラリ」から選択できます。", preferredStyle:  UIAlertControllerStyle.alert)
            
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
            
            
        } else {

        let filterImage: CIImage = CIImage(image: originalImage)!
        filter = CIFilter(name: "CISepiaTone")!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        filter.setValue(0.8, forKey: "inputIntensity")
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)
        }
        

    }
    @IBAction func GXRkaikei() {
        if (originalImage == nil){
            let alert: UIAlertController = UIAlertController(title: "エラー", message: "画像が選択されていません。「撮影」か「ライブラリ」から選択できます。", preferredStyle:  UIAlertControllerStyle.alert)
            
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
            
            
        } else {

        let filterImage: CIImage = CIImage(image: originalImage)!
        filter = CIFilter(name: "CIColorMonochrome")!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        filter.setValue(CIColor(red: 0.75, green: 0.75, blue: 0.75), forKey: "inputColor")
        filter.setValue(1.0, forKey: "inputIntensity")
        
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)
        }
        

    }
    @IBAction func msgbox() {
        if (originalImage == nil){
            let alert: UIAlertController = UIAlertController(title: "エラー", message: "画像が選択されていません。「撮影」か「ライブラリ」から選択できます。", preferredStyle:  UIAlertControllerStyle.alert)
            
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
            
            
        } else {

        let filterImage: CIImage = CIImage(image: originalImage)!
        filter = CIFilter(name: "CIHueAdjust" )!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        filter.setValue(3.14, forKey: "inputAngle")
        
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)
        }
        

    }
    @IBAction func inputbox() {
        if (originalImage == nil){
            let alert: UIAlertController = UIAlertController(title: "エラー", message: "画像が選択されていません。「撮影」か「ライブラリ」から選択できます。", preferredStyle:  UIAlertControllerStyle.alert)
            
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
            
            
        } else {

        let filterImage: CIImage = CIImage(image: originalImage)!
        filter = CIFilter(name: "CIFalseColor" )!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        filter.setValue(CIColor(red: 0.44, green: 0.5, blue: 0.2), forKey: "inputColor0")
        filter.setValue(CIColor(red: 1, green: 0.92, blue: 0.50), forKey: "inputColor1")
        
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)
        }
        

    }
    @IBAction func exz() {
        if (originalImage == nil){
            let alert: UIAlertController = UIAlertController(title: "エラー", message: "画像が選択されていません。「撮影」か「ライブラリ」から選択できます。", preferredStyle:  UIAlertControllerStyle.alert)
            
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
            
            
        } else {

        let filterImage: CIImage = CIImage(image: originalImage)!
        filter = CIFilter(name: "CILanczosScaleTransform")!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        filter.setValue(NSNumber(value: 0.1), forKey: kCIInputScaleKey)
        filter.setValue(NSNumber(value: 1.0), forKey: kCIInputAspectRatioKey)
        
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)
        }

    }
    @IBAction func ddda() {
        if (originalImage == nil){
            let alert: UIAlertController = UIAlertController(title: "エラー", message: "画像が選択されていません。「撮影」か「ライブラリ」から選択できます。", preferredStyle:  UIAlertControllerStyle.alert)
            
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
            
            
        } else {

        let filterImage: CIImage = CIImage(image: originalImage)!
        let filter = CIFilter(name: "CICMYKHalftone")!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        filter.setValue(25, forKey: kCIInputWidthKey)
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)
        }
        

    }
    @IBAction func cvb() {
        if (originalImage == nil){
            let alert: UIAlertController = UIAlertController(title: "エラー", message: "画像が選択されていません。「撮影」か「ライブラリ」から選択できます。", preferredStyle:  UIAlertControllerStyle.alert)
            
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
            
            
        } else {

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
        

    }
    @IBAction func gis() {
        if (originalImage == nil){
            let alert: UIAlertController = UIAlertController(title: "エラー", message: "画像が選択されていません。「撮影」か「ライブラリ」から選択できます。", preferredStyle:  UIAlertControllerStyle.alert)
            
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
            
            
        } else {
            
            let filterImage: CIImage = CIImage(image: originalImage)!
            filter = CIFilter(name: "CIFalseColor" )!
            filter.setValue(filterImage, forKey: kCIInputImageKey)
            filter.setValue(CIColor(red: 0.90, green: 0.20, blue: 0.70), forKey: "inputColor0")
            filter.setValue(CIColor(red: 1, green: 0.92, blue: 0.50), forKey: "inputColor1")
            
            let ctx = CIContext(options: nil)
            let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
            cameraImageView.image = UIImage(cgImage: cgImage!)
        }
        
        

    }
    @IBAction func gsrgsr() {
        if (originalImage == nil){
            let alert: UIAlertController = UIAlertController(title: "エラー", message: "画像が選択されていません。「撮影」か「ライブラリ」から選択できます。", preferredStyle:  UIAlertControllerStyle.alert)
            
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
            
            
        } else {
            
            let filterImage: CIImage = CIImage(image: originalImage)!
            filter = CIFilter(name: "CIFalseColor" )!
            filter.setValue(filterImage, forKey: kCIInputImageKey)
            filter.setValue(CIColor(red: 0.10, green: 0.58, blue: 0.42), forKey: "inputColor0")
            filter.setValue(CIColor(red: 1, green: 0.62, blue: 0.50), forKey: "inputColor1")
            
            let ctx = CIContext(options: nil)
            let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
            cameraImageView.image = UIImage(cgImage: cgImage!)
        }
        
        

    }
    @IBAction func hahhahhaha() {
        if (originalImage == nil){
            let alert: UIAlertController = UIAlertController(title: "エラー", message: "画像が選択されていません。「撮影」か「ライブラリ」から選択できます。", preferredStyle:  UIAlertControllerStyle.alert)
            
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
            
            
        } else {
            
            let filterImage: CIImage = CIImage(image: originalImage)!
            filter = CIFilter(name: "CIFalseColor" )!
            filter.setValue(filterImage, forKey: kCIInputImageKey)
            filter.setValue(CIColor(red: 0.3, green: 0.3, blue: 0.6), forKey: "inputColor0")
            filter.setValue(CIColor(red: 1, green: 0.92, blue: 0.50), forKey: "inputColor1")
            
            let ctx = CIContext(options: nil)
            let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
            cameraImageView.image = UIImage(cgImage: cgImage!)
        }
        
        

    }
    @IBAction func kaosssss() {
        if (originalImage == nil){
            let alert: UIAlertController = UIAlertController(title: "エラー", message: "画像が選択されていません。「撮影」か「ライブラリ」から選択できます。", preferredStyle:  UIAlertControllerStyle.alert)
            
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                (action: UIAlertAction!) -> Void in
                print("OK")
            })
            alert.addAction(defaultAction)
            
            present(alert, animated: true, completion: nil)
            
            
        } else {
            
            let filterImage: CIImage = CIImage(image: originalImage)!
            filter = CIFilter(name: "CIFalseColor" )!
            filter.setValue(filterImage, forKey: kCIInputImageKey)
            filter.setValue(CIColor(red: 0.1, green: 0.1, blue: 0.1), forKey: "inputColor0")
            filter.setValue(CIColor(red: 1, green: 0.1, blue: 0.8), forKey: "inputColor1")
            
            let ctx = CIContext(options: nil)
            let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
            cameraImageView.image = UIImage(cgImage: cgImage!)
        }
        
        

    }
    @IBAction func hahhhhhhahhhahhahahahah() {
        if (originalImage == nil){
            let alert: UIAlertController = UIAlertController(title: "エラー", message: "画像が選択されていません。「撮影」か「ライブラリ」から選択できます。", preferredStyle:  UIAlertControllerStyle.alert)
            
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                (action: UIAlertAction!) -> Void in
                print("OK")
            })
            alert.addAction(defaultAction)
            
            present(alert, animated: true, completion: nil)
            
            
        } else {

        
        let filterImage: CIImage = CIImage(image: originalImage)!
        filter = CIFilter(name: "CIGaussianBlur" )!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        filter.setValue(8, forKey: kCIInputRadiusKey)
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)

    }
    }
    @IBAction func jaaajet() {
        if (originalImage == nil){
            let alert: UIAlertController = UIAlertController(title: "エラー", message: "画像が選択されていません。「撮影」か「ライブラリ」から選択できます。", preferredStyle:  UIAlertControllerStyle.alert)
            
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                (action: UIAlertAction!) -> Void in
                print("OK")
            })
            alert.addAction(defaultAction)
            
            present(alert, animated: true, completion: nil)
            
            
        } else {
            let filterImage: CIImage = CIImage(image: originalImage)!
            filter = CIFilter(name: "CIColorInvert" )!
            filter.setValue(filterImage, forKey: kCIInputImageKey)
            let ctx = CIContext(options: nil)
            let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
            cameraImageView.image = UIImage(cgImage: cgImage!)


    }
    }
    @IBAction func yyayayyayayayyayayayayayayahahhahhahhahhahahhaahhahahahahahhahahahahhahah() {
        if (originalImage == nil){
            let alert: UIAlertController = UIAlertController(title: "エラー", message: "画像が選択されていません。「撮影」か「ライブラリ」から選択できます。", preferredStyle:  UIAlertControllerStyle.alert)
            
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                (action: UIAlertAction!) -> Void in
                print("OK")
            })
            alert.addAction(defaultAction)
            
            present(alert, animated: true, completion: nil)
            
            
        } else {
            
            
            let filterImage: CIImage = CIImage(image: originalImage)!
            filter = CIFilter(name: "CIHueAdjust" )!
            filter.setValue(filterImage, forKey: kCIInputImageKey)
            filter.setValue(7.14, forKey: "inputAngle")
            
            let ctx = CIContext(options: nil)
            let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
            cameraImageView.image = UIImage(cgImage: cgImage!)
        }

    }
    @IBAction func JetStaraaaaaaaaa() {
        if (originalImage == nil){
            let alert: UIAlertController = UIAlertController(title: "エラー", message: "画像が選択されていません。「撮影」か「ライブラリ」から選択できます。", preferredStyle:  UIAlertControllerStyle.alert)
            
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                (action: UIAlertAction!) -> Void in
                print("OK")
            })
            alert.addAction(defaultAction)
            
            present(alert, animated: true, completion: nil)
            
            
        } else {
            let filterImage: CIImage = CIImage(image: originalImage)!
            filter = CIFilter(name: "CISepiaTone")!
            filter.setValue(filterImage, forKey: kCIInputImageKey)
            filter.setValue(6.0, forKey: "inputIntensity")
            let ctx = CIContext(options: nil)
            let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
            cameraImageView.image = UIImage(cgImage: cgImage!)

        }
        

    }
    @IBAction func NSLogFille() {
        if (originalImage == nil){
            let alert: UIAlertController = UIAlertController(title: "エラー", message: "画像が選択されていません。「撮影」か「ライブラリ」から選択できます。", preferredStyle:  UIAlertControllerStyle.alert)
            
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                (action: UIAlertAction!) -> Void in
                print("OK")
            })
            alert.addAction(defaultAction)
            
            present(alert, animated: true, completion: nil)
            
            
        } else {
            let filterImage: CIImage = CIImage(image: originalImage)!
            filter = CIFilter(name: "CIColorMonochrome")!
            filter.setValue(filterImage, forKey: kCIInputImageKey)
            filter.setValue(CIColor(red: 453, green: 777777777.75, blue: 0.75), forKey: "inputColor")
            filter.setValue(1.0, forKey: "inputIntensity")
            
            let ctx = CIContext(options: nil)
            let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
            cameraImageView.image = UIImage(cgImage: cgImage!)

        }
        
        

    }
    @IBAction func jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj() {
        if (originalImage == nil){
            let alert: UIAlertController = UIAlertController(title: "エラー", message: "画像が選択されていません。「撮影」か「ライブラリ」から選択できます。", preferredStyle:  UIAlertControllerStyle.alert)
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                (action: UIAlertAction!) -> Void in
                print("OK")
            })
            alert.addAction(defaultAction)
            
            present(alert, animated: true, completion: nil)
            
            
        } else {
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

    }
        @IBAction func SK(_ sender: UISlider) {
            if (originalImage == nil){
                let alert: UIAlertController = UIAlertController(title: "エラー", message: "画像が選択されていません。「撮影」か「ライブラリ」から選択できます。", preferredStyle:  UIAlertControllerStyle.alert)
                
                let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                    (action: UIAlertAction!) -> Void in
                    print("OK")
                })
                alert.addAction(defaultAction)
                
                present(alert, animated: true, completion: nil)
                
                
            } else {
                

            
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
            }
    @IBAction func Kaaa() {
        //次の画面に行く
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "nextView")
        present(nextView, animated: true, completion: nil)
        //三秒枌
        RunLoop.main.run(until: Date(timeIntervalSinceNow: 3.0))
        //帰らない家に帰ろう
        nextView.performSegue(withIdentifier: "ahiru", sender: nil)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

