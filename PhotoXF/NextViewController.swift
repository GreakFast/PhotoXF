//
//  NextViewController.swift
//  PhotoFF
//
//  Created by KOTARO on 2017/05/21.
//  Copyright © 2017年 KOTARO. All rights reserved.
//

import UIKit

class NextViewController: UIViewController , UIImagePickerControllerDelegate ,UINavigationControllerDelegate{
    var imageNameArray: [String] = ["キラキラ", "hatena", "KIS", "kemuri", "honou", "電球", "ビックリマーク", "hibi", "雷", "頭悪い"]
    var imageIndex: Int = 0
    var imageView: UIImageView!
    
    var number: Int!
    @IBOutlet var hyouziView: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func selectBackground() {
        let imagePickController: UIImagePickerController = UIImagePickerController()
        
        imagePickController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePickController.delegate = self
        imagePickController.allowsEditing = true
        
        self.present(imagePickController, animated: true, completion: nil)
    }
    @IBAction func save() {
        let rect:CGRect = CGRect(x: 0, y:  30, width: 375, height: 535)
        UIGraphicsBeginImageContext(rect.size)
        self.view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let capture = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(capture!, nil, nil, nil)

    }
    @IBAction func torikesi() {
        self.imageView.removeFromSuperview()
    }
    

    @IBAction func backhome() {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func star() {
        imageIndex = 1
    }
    @IBAction func hatena() {
        imageIndex = 2
    }
    @IBAction func KIS() {
        imageIndex = 3
    }
    @IBAction func kemuri() {
        imageIndex = 4
    }
    @IBAction func honou() {
        imageIndex = 5
    }
    @IBAction func bikkuri() {
        imageIndex = 6
    }
    @IBAction func dennki() {
        imageIndex = 7
    }
    @IBAction func hibi() {
        imageIndex = 8
    }
    @IBAction func kaminari() {
        imageIndex = 9
    }
    @IBAction func atamawarui() {
        imageIndex = 10
    }
    @IBAction func saves() {
        sleep(2);
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

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //位置
        let touch:UITouch = touches.first!
        let location: CGPoint = touch.location(in: self.view)
        if imageIndex != 0 {
            //正方形
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
            
            //画像設定
            let image: UIImage = UIImage(named: imageNameArray[imageIndex - 1])!
            imageView.image = image
            
            //画像配置
            imageView.center = CGPoint(x: location.x ,y : location.y)
            //表示
            self.view.addSubview(imageView)
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchEvent = touches.first!
        

        let preDx = touchEvent.previousLocation(in: self.view).x
        let preDy = touchEvent.previousLocation(in: self.view).y
        
        let newDx = touchEvent.location(in: self.view).x
        let newDy = touchEvent.location(in: self.view).y
        
    
        let dx = newDx - preDx
        
        
        let dy = newDy - preDy
        
        
        var viewFrame: CGRect = imageView.frame
        
        
        viewFrame.origin.x += dx
        viewFrame.origin.y += dy
        
        imageView.frame = viewFrame
        
        self.view.addSubview(imageView)
        
    }



    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:
        
        [String : AnyObject]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.hyouziView.image = image
        self.hyouziView.image = image
        self.dismiss(animated: true, completion: nil)
        
    }
    


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
