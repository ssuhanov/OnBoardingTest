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
        
        if let nextImageName = self.imageQueue.first {
            view.showImage(imageName: nextImageName)
            self.imageQueue = Array(self.imageQueue.dropFirst())
            let buttonTitle = self.imageQueue.isEmpty ? "Старт" : "Продолжить"
            view.updateButton(title: buttonTitle)
        } else {
            view.startApplication()
            localManager.setFlagOnBoardingCompleted()
        }
    }
    
}
