//
//  MenuView.swift
//  TestApp
//
//  Created by Елена Воронцова on 13.12.2023.
//

import UIKit

final class MenuView: UIView {
    public lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public lazy var userImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "profileImage")
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 28
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public lazy var userNameLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        view.textColor = .black
        view.textAlignment = .left
        view.text = "Иван Иванов"
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public lazy var phoneNumberLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        view.textColor = .black
        view.textAlignment = .left
        view.text = "+7 912 011-11-33"
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public lazy var lineView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(red: 0.754, green: 0.745, blue: 0.745, alpha: 1)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public lazy var paymentLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        view.textColor = .black
        view.textAlignment = .left
        view.text = "Оплата"
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public lazy var cardLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        view.textColor = UIColor(red: 0.443, green: 0.443, blue: 0.443, alpha: 1)
        view.textAlignment = .left
        view.text = "Карта *4567"
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public lazy var menuTableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.separatorStyle = .none
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .clear
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(cell: MenuTableViewCell.self)
        return view
    }()
    public lazy var messageImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "messageImage")
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public lazy var supportLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        view.textColor = UIColor(red: 0.443, green: 0.443, blue: 0.443, alpha: 1)
        view.textAlignment = .left
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.text = "Связаться\nс нами"
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    weak var delegate: MenuDelegate?
    
    init(subscriber: MenuDelegate?) {
        super.init(frame: .zero)
        
        self.delegate = subscriber
        self.addSubviews()
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addSubview(self.containerView)
        self.containerView.addSubview(self.userImage)
        self.containerView.addSubview(self.userNameLabel)
        self.containerView.addSubview(self.phoneNumberLabel)
        self.containerView.addSubview(self.lineView)
        self.containerView.addSubview(self.paymentLabel)
        self.containerView.addSubview(self.cardLabel)
        self.containerView.addSubview(self.menuTableView)
        self.containerView.addSubview(self.messageImage)
        self.containerView.addSubview(self.supportLabel)
        
        self.backgroundColor = .clear.withAlphaComponent(0.5)
    }
    
    private func setupLayout() {
        self.containerView.snp.makeConstraints({
            $0.top.leading.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().inset(30)
        })
        self.userImage.snp.makeConstraints({
            $0.top.equalTo(self.containerView.safeAreaLayoutGuide.snp.top).offset(10)
            $0.leading.equalTo(self.containerView.safeAreaLayoutGuide.snp.leading).offset(15)
            $0.height.width.equalTo(56)
        })
        self.userNameLabel.snp.makeConstraints({
            $0.top.equalTo(self.containerView.safeAreaLayoutGuide.snp.top).offset(12)
            $0.leading.equalTo(self.userImage.safeAreaLayoutGuide.snp.trailing).offset(30)
        })
        self.phoneNumberLabel.snp.makeConstraints({
            $0.top.equalTo(self.userNameLabel.safeAreaLayoutGuide.snp.bottom)
            $0.leading.equalTo(self.userImage.safeAreaLayoutGuide.snp.trailing).offset(30)
        })
        self.lineView.snp.makeConstraints({
            $0.top.equalTo(self.phoneNumberLabel.safeAreaLayoutGuide.snp.bottom).offset(26)
            $0.leading.equalTo(self.containerView.safeAreaLayoutGuide.snp.leading)
            $0.trailing.equalTo(self.containerView.safeAreaLayoutGuide.snp.trailing)
            $0.height.equalTo(2)
        })
        self.paymentLabel.snp.makeConstraints({
            $0.top.equalTo(self.lineView.safeAreaLayoutGuide.snp.top).offset(24)
            $0.leading.equalTo(self.containerView.safeAreaLayoutGuide.snp.leading).offset(15)
        })
        self.cardLabel.snp.makeConstraints({
            $0.top.equalTo(self.paymentLabel.safeAreaLayoutGuide.snp.bottom)
            $0.leading.equalTo(self.containerView.safeAreaLayoutGuide.snp.leading).offset(15)
        })
        self.menuTableView.snp.makeConstraints({
            $0.top.equalTo(self.cardLabel.safeAreaLayoutGuide.snp.bottom).offset(12.5)
            $0.leading.equalTo(self.containerView.safeAreaLayoutGuide.snp.leading)
            $0.trailing.equalTo(self.containerView.safeAreaLayoutGuide.snp.trailing)
            $0.bottom.equalTo(self.containerView.snp.bottom).offset(-262.5)
        })
        self.messageImage.snp.makeConstraints({
            $0.bottom.equalTo(self.containerView.snp.bottom).offset(-50)
            $0.leading.equalTo(self.containerView.safeAreaLayoutGuide.snp.leading).offset(40)
            $0.height.width.equalTo(52)
        })
        self.supportLabel.snp.makeConstraints({
            $0.centerY.equalTo(self.messageImage.snp.centerY)
            $0.leading.equalTo(self.messageImage.safeAreaLayoutGuide.snp.trailing).offset(15)
        })
    }
}
