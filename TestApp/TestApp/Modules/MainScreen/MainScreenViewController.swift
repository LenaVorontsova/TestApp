//
//  MainScreenViewController.swift
//  TestApp
//
//  Created by Елена Воронцова on 12.12.2023.
//

import UIKit

final class MainScreenViewController: UIViewController {
    private lazy var mainView = MainScreenView(subscriber: self)
    
    override func loadView() {
        super.loadView()
        
        self.view = self.mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MainScreenViewController: MainScreenDelegate {
    func menuButtonTapped(_ sender: UIButton) {
        
    }
    
    func moreButtonTapped(_ sender: UIButton) {
        
    }
    
    func heartButtonTapped(_ sender: UIButton) {
        
    }
}
