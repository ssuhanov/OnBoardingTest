//
//  OnBoardingPresenterTests.swift
//  OnBoardingTest
//
//  Created by Serge Sukhanov on 8/19/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

import XCTest
import Cuckoo
@testable import OnBoardingTest

class OnBoardingPresenterTests: XCTestCase {
    
    var instance: OnBoardingPresenter!
    
    var view: MockOnBoardingViewProtocol!
    var localManager: MockOnBoardingLocalManager!
    
    let correctNexImageName = "correctNextImageName"
    var fullImageQueue: [String]!
    let lastImageQueue: [String] = ["something"]
    let emptyImageQueue: [String] = []
    
    override func setUp() {
        super.setUp()
        
        self.view = MockOnBoardingViewProtocol()
        stub(self.view) {
            when($0.showImage(imageName: anyString())).thenDoNothing()
            when($0.updateButton(title: anyString())).thenDoNothing()
            when($0.startApplication()).thenDoNothing()
        }
        
        self.localManager = MockOnBoardingLocalManager()
        stub(self.localManager) {
            when($0.setFlagOnBoardingCompleted()).thenDoNothing()
        }
        
        self.fullImageQueue = [correctNexImageName, "something", "something else"]
    }
    
    func testNextImageExtractsCorrectly() {
        self.instance = OnBoardingPresenter(imageQueue: self.fullImageQueue)
        self.instance.showNextImage(view: self.view)
        verify(self.view).showImage(imageName: self.correctNexImageName)
    }
    
    func testImageQueueReducesCorrectly() {
        self.instance = OnBoardingPresenter(imageQueue: self.fullImageQueue)
        self.instance.showNextImage(view: self.view)
        XCTAssertEqual(self.instance.imageQueue.count, self.fullImageQueue.count - 1, "image queue should be reduced by one")
    }
    
    func testButtonTitleUpdatesCorrectly() {
        self.instance = OnBoardingPresenter(imageQueue: self.fullImageQueue)
        self.instance.showNextImage(view: self.view)
        verify(self.view).updateButton(title: "Продолжить")
    }
    
    func testPrepareForApplicationStartCorrectly() {
        self.instance = OnBoardingPresenter(imageQueue: self.lastImageQueue)
        self.instance.showNextImage(view: self.view)
        verify(self.view).updateButton(title: "Старт")
    }
    
    func testApplicationStartsCorrectly() {
        self.instance = OnBoardingPresenter(imageQueue: self.emptyImageQueue)
        self.instance.showNextImage(view: self.view, localManager: self.localManager)
        verify(self.view).startApplication()
    }
    
    func testLocalManagerSetsOnBoardingFlagCorrectly() {
        self.instance = OnBoardingPresenter(imageQueue: self.emptyImageQueue)
        self.instance.showNextImage(view: self.view, localManager: self.localManager)
        verify(self.localManager).setFlagOnBoardingCompleted()
    }
    
}
