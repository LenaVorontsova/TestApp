//
//  CatalogCollectionViewCell.swift
//  TestApp
//
//  Created by Елена Воронцова on 13.12.2023.
//

import UIKit

final class CatalogCollectionViewCell: UICollectionViewCell {
    public func configure(_ image: String, _ title: String) {
        self.catalogImage.image = UIImage(named: image)
        self.catalogTitle.text = title
    }
    
    private lazy var catalogImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var catalogTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont(name: "SFProDisplay-Semibold", size: 14)
        view.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        view.textAlignment = .center
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        
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
        
        self.contentView.layer.masksToBounds = true
        
        self.layer.cornerRadius = 12
        self.contentView.layer.cornerRadius = 12
        
        self.backgroundColor = .clear
    }
    
    private func addSubviews() {
        self.contentView.addSubview(self.catalogImage)
        self.contentView.addSubview(self.catalogTitle)
    }
    
    private func setupLayout() {
        self.catalogImage.snp.makeConstraints({
            $0.top.leading.trailing.bottom.equalToSuperview()
        })
        self.catalogTitle.snp.makeConstraints({
            $0.leading.trailing.bottom.equalToSuperview().inset(10)
        })
    }
}
