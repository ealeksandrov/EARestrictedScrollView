//
//  ViewController.swift
//
//  Copyright (c) 2015-2016 Evgeny Aleksandrov. License: MIT.

import UIKit
import EARestrictedScrollView

class ViewController: UIViewController {
    
    var restrictedScrollView: EARestrictedScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        restrictedScrollView = EARestrictedScrollView(frame: view.bounds)
        restrictedScrollView.alwaysBounceVertical = true
        restrictedScrollView.alwaysBounceHorizontal = true
        view.addSubview(restrictedScrollView)
        
        let imageView = UIImageView(image: UIImage(named: "milky-way"))
        restrictedScrollView.addSubview(imageView)
        restrictedScrollView.contentSize = imageView.frame.size
        
        addViewWithControls(CGRect(x: 20, y: 50, width: view.frame.width, height: view.frame.height))
        addViewWithControls(CGRect(x: 50 + view.frame.width, y: 50, width: view.frame.width * 1.5, height: view.frame.height * 1.5))
    }
    
    func addViewWithControls(frame: CGRect) {
        let restrictionArea = UIView(frame: frame)
        restrictionArea.layer.cornerRadius = 10
        restrictionArea.layer.borderColor = UIColor.whiteColor().CGColor
        restrictionArea.layer.borderWidth = 2
        
        let areaSwitch = UISwitch(frame: CGRectZero)
        areaSwitch.frame = CGRect(origin: CGPoint(x: (restrictionArea.frame.width - areaSwitch.frame.width)/2, y: (restrictionArea.frame.height - areaSwitch.frame.height)/2), size: CGSizeZero)
        areaSwitch.addTarget(self, action: #selector(ViewController.flipSwitch(_:)), forControlEvents: .ValueChanged)
        
        restrictionArea.addSubview(areaSwitch)
        restrictedScrollView.addSubview(restrictionArea)
    }
    
    func flipSwitch(sender: UISwitch) {
        if sender.on {
            restrictedScrollView.restrictionArea = sender.superview!.frame
        } else {
            restrictedScrollView.restrictionArea = CGRectZero
        }
    }
}

