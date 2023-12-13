//
//  PromoBannersCollectionViewCell.swift
//  TestApp
//
//  Created by Елена Воронцова on 12.12.2023.
//

import UIKit

final class PromoBannersCollectionViewCell: UICollectionViewCell {
    public func configure(_ image: String) {
        self.backImage.image = UIImage(named: image)
    }
    private lazy var backImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.sizeToFit()
        
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
        
        self.layer.cornerRadius = 16
        self.contentView.layer.cornerRadius = 16
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
    }
    
    private func addSubviews() {
        self.contentView.addSubview(self.backImage)
    }
    
    private func setupLayout() {
        self.backImage.snp.makeConstraints({
            $0.top.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(115)
        })
    }
}
