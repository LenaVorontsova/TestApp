//
//  MenuTableViewCell.swift
//  TestApp
//
//  Created by Елена Воронцова on 13.12.2023.
//

import UIKit

final class MenuTableViewCell: UITableViewCell {
    public func configure(_ menuLabel: String) {
        self.menuLabel.text = menuLabel
    }
    
    public lazy var menuLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        view.textColor = .black
        view.textAlignment = .left
        
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
        self.contentView.addSubview(self.menuLabel)
    }
    
    private func setupLayout() {
        self.menuLabel.snp.makeConstraints({
            $0.top.bottom.equalToSuperview().inset(12.5)
            $0.leading.trailing.equalToSuperview().inset(15)
        })
    }
}

