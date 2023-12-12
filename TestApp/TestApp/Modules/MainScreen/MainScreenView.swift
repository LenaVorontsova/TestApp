//
//  MainScreenView.swift
//  TestApp
//
//  Created by Елена Воронцова on 12.12.2023.
//

import UIKit
import SnapKit

final class MainScreenView: UIView {
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.backgroundColor = .clear
        view.contentInsetAdjustmentBehavior = .automatic
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        view.alwaysBounceVertical = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delaysContentTouches = false
        return view
    }()
    public lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    private lazy var menuButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "menuButtonImage"), for: .normal)
        
        view.addTarget(self, action: #selector(menuButtonTapped), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public lazy var deliveryLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont(name: "SFProDisplay-Regular", size: 12)
        view.textColor = UIColor(red: 0.443, green: 0.443, blue: 0.443, alpha: 1)
        view.textAlignment = .left
        view.text = "Доставка"
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public lazy var addressLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        view.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        view.textAlignment = .left
        view.text = "Пискунова, 24"
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var moreButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "moreButtonImage"), for: .normal)
        
        view.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var searchView: UISearchBar = {
        let view = UISearchBar(frame: .zero)
        view.placeholder = "Поиск товаров"
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.clear.cgColor
        view.searchBarStyle = .minimal
        
        view.layer.cornerRadius = 5
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var heartButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "heartButtonImage"), for: .normal)
        
        view.addTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    weak var delegate: MainScreenDelegate?
    
    init(subscriber: MainScreenDelegate?) {
        super.init(frame: .zero)
        
        self.delegate = subscriber
        self.addSubviews()
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.containerView)
        self.containerView.addSubview(self.menuButton)
        self.containerView.addSubview(self.deliveryLabel)
        self.containerView.addSubview(self.addressLabel)
        self.containerView.addSubview(self.moreButton)
        self.containerView.addSubview(self.searchView)
        self.containerView.addSubview(self.heartButton)
        
        self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func setupLayout() {
        self.scrollView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        self.containerView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.top.bottom.leading.trailing.equalTo(self.scrollView)
        }
        self.menuButton.snp.makeConstraints({
            $0.top.equalTo(self.containerView.snp.top).offset(32)
            $0.leading.equalTo(self.containerView.snp.leading).offset(16)
            $0.width.height.equalTo(25)
        })
        self.deliveryLabel.snp.makeConstraints({
            $0.top.equalTo(self.containerView.snp.top).inset(27)
            $0.leading.equalTo(self.menuButton.snp.trailing).offset(25)
        })
        self.addressLabel.snp.makeConstraints({
            $0.top.equalTo(self.deliveryLabel.snp.bottom)
            $0.leading.equalTo(self.menuButton.snp.trailing).offset(25)
        })
        self.moreButton.snp.makeConstraints({
            $0.centerY.equalTo(self.addressLabel.snp.centerY)
            $0.leading.equalTo(self.addressLabel.snp.trailing).offset(5)
            $0.width.height.equalTo(12)
        })
        self.searchView.snp.makeConstraints({
            $0.top.equalTo(self.addressLabel.snp.bottom).offset(16)
            $0.leading.equalTo(self.containerView.snp.leading).offset(15)
            $0.height.equalTo(35)
        })
        self.heartButton.snp.makeConstraints({
            $0.top.equalTo(self.searchView.snp.top).offset(3)
            $0.leading.equalTo(self.searchView.snp.trailing).offset(10)
            $0.trailing.equalTo(self.containerView.snp.trailing).offset(-15)
            $0.bottom.equalTo(self.searchView.snp.bottom).offset(-2)
            $0.height.width.equalTo(30)
        })

    }
    
    @objc
    func menuButtonTapped(_ sender: UIButton) {
        self.delegate?.menuButtonTapped(sender)
    }
    
    @objc
    func moreButtonTapped(_ sender: UIButton) {
        self.delegate?.moreButtonTapped(sender)
    }
    
    @objc
    func heartButtonTapped(_ sender: UIButton) {
        self.delegate?.heartButtonTapped(sender)
    }
}
