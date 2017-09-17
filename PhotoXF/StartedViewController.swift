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
        var blinkLabelTimer = Timer()
    
    
    
    
    @IBAction func Startedvier() {
        let storyboard: UIStoryboard = self.storyboard!
        let Kbs = storyboard.instantiateViewController(withIdentifier: "Kbs")
        present(Kbs, animated: true, completion: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        blinkLabelTimer = Timer.scheduledTimer(
            timeInterval: 4.0,
            target: self,
            selector: #selector(getter: StartedViewController.label),
            userInfo: nil,
            repeats: true
        )
    }
    
    func blinkLabel()
    {
        self.label.isHidden = !self.label.isHidden
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
