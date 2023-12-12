//
//  MainScreenDelegate.swift
//  TestApp
//
//  Created by Елена Воронцова on 12.12.2023.
//

import UIKit

protocol MainScreenDelegate: AnyObject {
    func menuButtonTapped(_ sender: UIButton)
    func moreButtonTapped(_ sender: UIButton)
    func heartButtonTapped(_ sender: UIButton)
}
