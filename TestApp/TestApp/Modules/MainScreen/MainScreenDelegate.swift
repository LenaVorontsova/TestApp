//
//  MainScreenDelegate.swift
//  TestApp
//
//  Created by Елена Воронцова on 12.12.2023.
//

import UIKit

protocol MainScreenDelegate: AnyObject {
    func menuButtonTapped(_ sender: UIButton)
    func searchAddressTapped(_ tapGesture: UITapGestureRecognizer)
    func heartButtonTapped(_ sender: UIButton)
    func showAllButtonTapped(_ sender: UIButton)
    func changeLocation(location: String)
}
