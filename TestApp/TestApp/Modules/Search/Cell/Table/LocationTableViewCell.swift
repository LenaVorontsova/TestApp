//
//  LocationTableViewCell.swift
//  TestApp
//
//  Created by Елена Воронцова on 13.12.2023.
//

import UIKit

final class LocationTableViewCell: UITableViewCell {
    public func configure(_ streetLabel: String, _ fullAddressLabel: String) {
        self.streetLabel.text = streetLabel
        self.fullAddressLabel.text = fullAddressLabel
    }
    
    public lazy var locationImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "currentLocationImage")
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public lazy var streetLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        view.textColor = .black
        view.textAlignment = .left
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public lazy var fullAddressLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        view.textColor = UIColor(red: 0.443, green: 0.443, blue: 0.443, alpha: 1)
        view.textAlignment = .left
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        self.addSubviews()
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
    }
    
    private func addSubviews() {
        self.contentView.addSubview(self.locationImage)
        self.contentView.addSubview(self.streetLabel)
        self.contentView.addSubview(self.fullAddressLabel)
    }
    
    private func setupLayout() {
        self.locationImage.snp.makeConstraints({
            $0.top.bottom.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(17)
            $0.width.height.equalTo(20)
        })
        self.streetLabel.snp.makeConstraints({
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalTo(self.locationImage.safeAreaLayoutGuide.snp.trailing).offset(18)
            $0.trailing.equalToSuperview().inset(17)
        })
        self.fullAddressLabel.snp.makeConstraints({
            $0.top.equalTo(self.streetLabel.safeAreaLayoutGuide.snp.bottom)
            $0.leading.equalTo(self.locationImage.safeAreaLayoutGuide.snp.trailing).offset(18)
            $0.trailing.equalToSuperview().inset(17)
            $0.bottom.equalToSuperview().inset(10)
        })
    }
}

