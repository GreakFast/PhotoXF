//
//  ViewController.swift
//  PhotoXF
//
//  Created by KOTARO on 2017/05/26.
//  Copyright © 2017年 KOTARO. All rights reserved.
//

import UIKit

import Accounts

class SKViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var cameraImageView: UIImageView!
    var originalImage: UIImage!
    var filter: CIFilter!
    let saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
            let alert: UIAlertController = UIAlertController(title: "カメラ", message: "エラー：カメラにアクセスできませんでした", preferredStyle:  UIAlertControllerStyle.alert)
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                (action: UIAlertAction!) -> Void in
                print("OK")
            })
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func Frashed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Tested() {
            if (originalImage == nil){
                print("No")
            }else{
                print("Yes")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        cameraImageView.image = info[UIImagePickerControllerEditedImage] as? UIImage
        originalImage = cameraImageView.image
        saveData.set(UIImagePNGRepresentation(originalImage!), forKey: "AS")
        dismiss(animated: true, completion: nil)
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

