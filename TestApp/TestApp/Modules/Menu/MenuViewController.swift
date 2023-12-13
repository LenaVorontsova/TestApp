//
//  MenuViewController.swift
//  TestApp
//
//  Created by Елена Воронцова on 13.12.2023.
//

import UIKit

final class MenuViewController: UIViewController {
    private lazy var mainView = MenuView(subscriber: self)
    
    private let menuText = [
        "Мои адреса",
        "Мои заказы",
        "Избранное",
        "Новости",
        "Купоны",
        "О нас",
        "Пригласить друзей",
        "Настройки"
    ]
    
    override func loadView() {
        super.loadView()
        
        self.view = self.mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainView.menuTableView.delegate = self
        self.mainView.menuTableView.dataSource = self
        
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipedLeft))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.mainView.addGestureRecognizer(swipeLeft)
    }
    
    @objc 
    func swipedLeft(gesture: UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 0.8) {
            self.dismiss(animated: false)
        }
    }
}

extension MenuViewController: MenuDelegate {
    
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.menuText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MenuTableViewCell = tableView.dequeueCell(for: indexPath)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let text = self.menuText[indexPath.row]
        (cell as? MenuTableViewCell)?.configure(text)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        45
    }
}
