//
//  StocksCollectionViewCell.swift
//  TestApp
//
//  Created by Елена Воронцова on 13.12.2023.
//

import UIKit

final class StocksCollectionViewCell: UICollectionViewCell {
    public func configure(_ image: String, _ dishName: String, _ weight: Int, _ oldPrice: Int, _ newPrice: Int, _ percent: Int, _ isNew: Bool) {
        self.dishImage.image = UIImage(named: image)
        self.dishLabel.text = dishName
        self.weightLabel.text = "\(weight) г"
        self.oldPriceLabel.attributedText = NSAttributedString(string: "\(oldPrice) ₽", attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue])
        self.newPriceLabel.text = "\(newPrice) ₽"
        self.sumLabel.text = "\(newPrice) ₽"
        self.discountLabel.text = "-\(percent)%"
        if !isNew {
            self.newView.isHidden = true
        }
    }
    
    private lazy var discountView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(red: 1, green: 0.259, blue: 0.192, alpha: 1)
        view.layer.cornerRadius = 7.5
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var discountLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont(name: "SFProDisplay-Regular", size: 10)
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.textAlignment = .center
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var newView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(red: 1, green: 0.626, blue: 0.199, alpha: 1)
        view.layer.cornerRadius = 7.5
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var newLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont(name: "SFProDisplay-Regular", size: 10)
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.textAlignment = .center
        view.text = "Новинка"
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var dishImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.sizeToFit()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var dishLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont(name: "SFProDisplay-Regular", size: 12)
        view.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        view.textAlignment = .left
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var weightLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont(name: "SFProDisplay-Regular", size: 12)
        view.textColor = UIColor(red: 0.443, green: 0.443, blue: 0.443, alpha: 1)
        view.textAlignment = .left
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public lazy var sumLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont(name: "SFProDisplay-Regular", size: 12)
        view.textColor = UIColor(red: 0.443, green: 0.443, blue: 0.443, alpha: 1)
        view.textAlignment = .center
        view.isHidden = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var oldPriceLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont(name: "SFProDisplay-Regular", size: 12)
        view.textColor = UIColor(red: 1, green: 0.259, blue: 0.192, alpha: 1)
        view.textAlignment = .left
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var newPriceLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        view.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        view.textAlignment = .left
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public lazy var addButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "addButtonImage"), for: .normal)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public lazy var weightStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [self.weightLabel, self.sumLabel])
        view.axis = .horizontal
        view.distribution = .fillProportionally
        view.alignment = .leading
        view.spacing = 2
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public lazy var priceStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [self.oldPriceLabel, self.newPriceLabel])
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .top
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public lazy var countView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(red: 1, green: 0.827, blue: 0.204, alpha: 1)
        view.layer.cornerRadius = 14.5
        
        view.isHidden = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public lazy var countLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont(name: "SFProDisplay-Medium", size: 14)
        view.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        view.textAlignment = .center
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public lazy var plusButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(systemName: "plus"), for: .normal)
        view.imageView?.tintColor = .black
        
        view.isHidden = true
        view.tag = 2
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public lazy var minusButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(systemName: "minus"), for: .normal)
        view.imageView?.tintColor = .black
        
        view.isHidden = true
        view.tag = 1
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public var count = 0
    
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
        self.contentView.backgroundColor = UIColor(red: 0.957, green: 0.957, blue: 0.957, alpha: 1)
    }
    
    private func addSubviews() {
        self.dishImage.addSubview(self.discountView)
        self.discountView.addSubview(self.discountLabel)
        self.dishImage.addSubview(self.newView)
        self.newView.addSubview(self.newLabel)
        
        self.contentView.addSubview(self.dishImage)
        self.contentView.addSubview(self.dishLabel)
        self.contentView.addSubview(self.weightStackView)
        
        self.contentView.addSubview(self.priceStackView)
        self.contentView.addSubview(self.addButton)
        
        self.contentView.addSubview(self.countView)
        self.contentView.addSubview(self.minusButton)
        self.countView.addSubview(self.countLabel)
        self.contentView.addSubview(self.plusButton)
    }
    
    private func setupLayout() {
        self.dishImage.snp.makeConstraints({
            $0.top.equalTo(self.contentView.snp.top)
            $0.leading.equalTo(self.contentView.snp.leading)
            $0.trailing.equalTo(self.contentView.snp.trailing)
            $0.height.equalTo(100)
        })
        self.discountView.snp.makeConstraints({
            $0.top.equalTo(self.dishImage.safeAreaLayoutGuide.snp.top).offset(5)
            $0.leading.equalTo(self.dishImage.safeAreaLayoutGuide.snp.leading).offset(5)
            $0.height.equalTo(15)
        })
        self.discountLabel.snp.makeConstraints({
            $0.top.equalTo(self.discountView.snp.top)
            $0.bottom.equalTo(self.discountView.snp.bottom)
            $0.leading.equalTo(self.discountView.snp.leading).offset(5)
            $0.trailing.equalTo(self.discountView.snp.trailing).offset(-5)
        })
        self.newView.snp.makeConstraints({
            $0.top.equalTo(self.dishImage.safeAreaLayoutGuide.snp.top).offset(5)
            $0.trailing.equalTo(self.dishImage.safeAreaLayoutGuide.snp.trailing).offset(-5)
            $0.height.equalTo(15)
        })
        self.newLabel.snp.makeConstraints({
            $0.top.equalTo(self.newView.snp.top)
            $0.bottom.equalTo(self.newView.snp.bottom)
            $0.leading.equalTo(self.newView.snp.leading).offset(5)
            $0.trailing.equalTo(self.newView.snp.trailing).offset(-5)
        })
        self.dishLabel.snp.makeConstraints({
            $0.top.equalTo(self.dishImage.snp.bottom).offset(2)
            $0.leading.equalTo(self.contentView.snp.leading).offset(2)
            $0.trailing.equalTo(self.contentView.snp.trailing).offset(-2)
        })
        self.weightStackView.snp.makeConstraints({
            $0.top.equalTo(self.dishLabel.snp.bottom)
            $0.leading.equalTo(self.contentView.snp.leading).offset(5)
            $0.trailing.equalTo(self.contentView.snp.trailing).offset(-5)
        })
        self.priceStackView.snp.makeConstraints({
            $0.leading.equalTo(self.contentView.snp.leading).offset(5)
            $0.bottom.equalTo(self.contentView.snp.bottom).offset(-5)
        })
        self.addButton.snp.makeConstraints({
            $0.trailing.equalTo(self.contentView.snp.trailing).offset(-5)
            $0.bottom.equalTo(self.contentView.snp.bottom).offset(-5)
            $0.width.height.equalTo(30)
        })
        self.countView.snp.makeConstraints({
            $0.bottom.leading.trailing.equalToSuperview().inset(5)
            $0.height.equalTo(29)
        })
        self.minusButton.snp.makeConstraints({
            $0.top.equalTo(self.countView.snp.top).offset(7.5)
            $0.leading.equalTo(self.countView.snp.leading).offset(8)
            $0.bottom.equalTo(self.countView.snp.bottom).offset(-7.5)
            $0.height.width.equalTo(14)
        })
        self.countLabel.snp.makeConstraints({
            $0.top.equalTo(self.countView.snp.top).offset(7.5)
            $0.centerX.equalTo(self.countView.snp.centerX)
            $0.bottom.equalTo(self.countView.snp.bottom).offset(-7.5)
            $0.height.width.equalTo(14)
        })
        self.plusButton.snp.makeConstraints({
            $0.top.equalTo(self.countView.snp.top).offset(7.5)
            $0.trailing.equalTo(self.countView.snp.trailing).offset(-8)
            $0.bottom.equalTo(self.countView.snp.bottom).offset(-7.5)
            $0.height.width.equalTo(14)
        })
    }
}
