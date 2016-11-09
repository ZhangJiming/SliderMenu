//
//  MainViewController.swift
//  SliderMenu
//
//  Created by 张继明 on 2016/11/5.
//  Copyright © 2016年 张继明. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    public var sliderMenuManager:ViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func ShowOrHideMenu(_ sender: UIBarButtonItem) {
        self.sliderMenuManager?.ShowOrHideMenu()
    }
    

}
