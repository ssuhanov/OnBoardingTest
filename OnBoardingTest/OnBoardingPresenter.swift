//
//  OnBoardingPresenter.swift
//  OnBoardingTest
//
//  Created by Serge Sukhanov on 8/19/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

import Foundation

class OnBoardingPresenter {
    
    var imageQueue: [String]
    
    init(imageQueue: [String] = OnBoardingImageManager().getImageQueue()) {
        self.imageQueue = imageQueue
    }
    
    func showNextImage(view: OnBoardingViewProtocol,
                       localManager: OnBoardingLocalManager = OnBoardingLocalManager()) {
        
        
    }
    
}
