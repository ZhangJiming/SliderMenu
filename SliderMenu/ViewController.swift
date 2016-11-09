//
//  ViewController.swift
//  SliderMenu
//
//  Created by 张继明 on 2016/11/5.
//  Copyright © 2016年 张继明. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var menuViewController:MenuViewController!
    private var mainNavigationController:UINavigationController!
    private let screenWidth = UIScreen.main.bounds.size.width
    private let screenHeight = UIScreen.main.bounds.size.height
    private let menuWidth = UIScreen.main.bounds.size.width * 0.7
    private var menuIsShowed = false
    private let animateDuration = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.red
        
        mainNavigationController = UIStoryboard(name:"Main" , bundle: nil).instantiateViewController(withIdentifier: "MainNavigationController") as! UINavigationController
        mainNavigationController.view.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        
        menuViewController = UIStoryboard(name:"Main" , bundle: nil).instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        
        self.view.addSubview(mainNavigationController.view)
        self.view.addSubview(menuViewController.view)
        menuViewController.view.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: screenHeight)
        
        
        let mainVC = mainNavigationController.viewControllers.first as? MainViewController
        mainVC?.sliderMenuManager = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    func ShowOrHideMenu() {
        if menuIsShowed {
            self.menuIsShowed = false
            UIView.animate(withDuration: animateDuration) {
                UIApplication.shared.setStatusBarHidden(false, with: .slide)
                self.menuViewController.view.frame = CGRect(x: -self.menuWidth, y: 0, width: self.menuWidth, height: self.screenHeight)
                self.mainNavigationController.view.transform = CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
            }
        }
        else {
            self.menuIsShowed = true
            UIView.animate(withDuration: animateDuration) {
                UIApplication.shared.setStatusBarHidden(true, with: .slide)
                self.menuViewController.view.frame = CGRect(x: 0, y: 0, width: self.menuWidth, height: self.screenHeight)
                self.mainNavigationController.view.transform = CGAffineTransform(a: 0.8, b: 0, c: 0, d: 0.8, tx: self.screenWidth*0.7, ty: 0)
            }
        }
        
    }
}

