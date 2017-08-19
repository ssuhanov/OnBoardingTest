//
//  OnBoardingViewController.swift
//  OnBoardingTest
//
//  Created by Serge Sukhanov on 8/19/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

import UIKit

class OnBoardingViewController: ViewController {
    
    var presenter: OnBoardingPresenter!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var continueButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.presenter = OnBoardingPresenter()
    }
    
    @IBAction func continueAction(_ sender: UIButton) {
        
    }
    
}
