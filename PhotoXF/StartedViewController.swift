//
//  StartedViewController.swift
//  PhotoXF
//
//  Created by KOTARO on 2017/09/17.
//  Copyright © 2017年 KOTARO. All rights reserved.
//

import UIKit


class StartedViewController: UIViewController {
    
    
    @IBOutlet weak var label : UILabel!
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "どちらで編集しますか？"
        label.font = UIFont(name: "HiraMinProN-W3", size: 20)
        label.sizeToFit()
        label.center = self.view.center
        self.view.addSubview(label)
        
    }
    

        // Do any additional setup after loading the view.

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
