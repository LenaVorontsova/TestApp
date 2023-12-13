//
//  PromoSectionsCollectionViewCell.swift
//  TestApp
//
//  Created by Елена Воронцова on 12.12.2023.
//

import UIKit

final class PromoSectionsCollectionViewCell: UICollectionViewCell {
    public func configure(_ image: String, _ title: String) {
        self.sectionImage.image = UIImage(named: image)
        self.sectionTitle.text = title
    }
    
    private lazy var sectionImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var sectionTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont(name: "SFProDisplay-Regular", size: 12)
        view.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        view.textAlignment = .center
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
        self.contentView.addSubview(self.sectionImage)
        self.contentView.addSubview(self.sectionTitle)
    }
    
    private func setupLayout() {
        self.sectionImage.snp.makeConstraints({
            $0.top.equalTo(self.contentView.snp.top).offset(8)
            $0.leading.equalTo(self.contentView.snp.leading).offset(8)
            $0.trailing.equalTo(self.contentView.snp.trailing).offset(8)
            $0.height.equalTo(60)
        })
        self.sectionTitle.snp.makeConstraints({
            $0.top.equalTo(self.sectionImage.snp.bottom).offset(5)
            $0.bottom.equalTo(self.contentView.snp.bottom)
            $0.centerX.centerX.equalTo(self.sectionImage.snp.centerX)
        })
    }
}
