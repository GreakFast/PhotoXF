//
//  CityViewController.swift
//  PhotoXF
//
//  Created by KOTARO on 2017/06/25.
//  Copyright © 2017年 KOTARO. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {
    
    @IBOutlet var DiffelentImageView: UIImageView!
    let saveData: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        let animation = CABasicAnimation(keyPath: "transform")
        animation.fromValue = 0
        animation.toValue = 2 * M_PI
        animation.valueFunction = CAValueFunction(name: kCAValueFunctionRotateZ)
        animation.duration = 0.5
        animation.repeatCount = Float.infinity
        DiffelentImageView.layer.add(animation, forKey: nil)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
