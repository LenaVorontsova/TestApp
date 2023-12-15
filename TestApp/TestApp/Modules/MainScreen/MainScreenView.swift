//
//  MainScreenView.swift
//  TestApp
//
//  Created by Елена Воронцова on 12.12.2023.
//

import UIKit
import SnapKit

final class MainScreenView: UIView {
    public lazy var scrollView: UIScrollView = {
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
    public lazy var addressView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(searchAddressTapped))
        view.addGestureRecognizer(tap)
        
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
        view.isUserInteractionEnabled = false
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public lazy var searchView: UISearchBar = {
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
    public lazy var promoSectionsCollectionView: ContentSizedCollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        let collectionView = ContentSizedCollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        
        collectionView.register(cell: PromoSectionsCollectionViewCell.self)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    public lazy var promoBannersCollectionView: ContentSizedCollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        let collectionView = ContentSizedCollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        
        collectionView.register(cell: PromoBannersCollectionViewCell.self)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    public lazy var stocksLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont(name: "SFProDisplay-Regular", size: 25)
        view.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        view.textAlignment = .left
        view.text = "Акции"
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var showAllButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "showAllButtonImage"), for: .normal)
        
        view.addTarget(self, action: #selector(showAllButtonTapped), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public lazy var stocksCollectionView: ContentSizedCollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        let collectionView = ContentSizedCollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        
        collectionView.register(cell: StocksCollectionViewCell.self)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    public lazy var catalogLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont(name: "SFProDisplay-Regular", size: 25)
        view.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        view.textAlignment = .left
        view.text = "Каталог"
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public lazy var catalogCollectionView: ContentSizedCollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .vertical
        let collectionView = ContentSizedCollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(cell: CatalogCollectionViewCell.self)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
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
        self.containerView.addSubview(self.addressView)
        self.addressView.addSubview(self.deliveryLabel)
        self.addressView.addSubview(self.addressLabel)
        self.addressView.addSubview(self.moreButton)
        self.containerView.addSubview(self.searchView)
        self.containerView.addSubview(self.heartButton)
        self.containerView.addSubview(self.promoSectionsCollectionView)
        self.containerView.addSubview(self.promoBannersCollectionView)
        self.containerView.addSubview(self.stocksLabel)
        self.containerView.addSubview(self.showAllButton)
        self.containerView.addSubview(self.stocksCollectionView)
        self.containerView.addSubview(self.catalogLabel)
        self.containerView.addSubview(self.catalogCollectionView)
        
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
        self.addressView.snp.makeConstraints({
            $0.top.equalTo(self.containerView.snp.top).inset(27)
            $0.leading.equalTo(self.menuButton.snp.trailing).offset(25)
            $0.trailing.equalTo(self.containerView.snp.trailing).offset(-15)
            $0.bottom.equalTo(self.addressLabel.safeAreaLayoutGuide.snp.bottom)
        })
        self.deliveryLabel.snp.makeConstraints({
            $0.top.equalTo(self.addressView.snp.top)
            $0.leading.equalTo(self.addressView.snp.leading)
            $0.trailing.equalTo(self.addressView.snp.trailing)
        })
        self.addressLabel.snp.makeConstraints({
            $0.top.equalTo(self.deliveryLabel.snp.bottom)
            $0.leading.equalTo(self.addressView.snp.leading)
        })
        self.moreButton.snp.makeConstraints({
            $0.centerY.equalTo(self.addressLabel.snp.centerY)
            $0.leading.equalTo(self.addressLabel.snp.trailing).offset(5)
            $0.width.height.equalTo(12)
        })
        self.searchView.snp.makeConstraints({
            $0.top.equalTo(self.addressView.snp.bottom).offset(16)
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
        self.promoSectionsCollectionView.snp.makeConstraints({
            $0.top.equalTo(self.searchView.snp.bottom).offset(22)
            $0.leading.equalTo(self.containerView.snp.leading)
            $0.trailing.equalTo(self.containerView.snp.trailing)
            $0.height.equalTo(88)
        })
        self.promoBannersCollectionView.snp.makeConstraints({
            $0.top.equalTo(self.promoSectionsCollectionView.snp.bottom).offset(30)
            $0.leading.equalTo(self.containerView.snp.leading)
            $0.trailing.equalTo(self.containerView.snp.trailing)
            $0.height.equalTo(115)
        })
        self.stocksLabel.snp.makeConstraints({
            $0.top.equalTo(self.promoBannersCollectionView.snp.bottom).offset(30)
            $0.leading.equalTo(self.containerView.snp.leading).offset(15)
        })
        self.showAllButton.snp.makeConstraints({
            $0.top.equalTo(self.promoBannersCollectionView.snp.bottom).offset(30)
            $0.trailing.equalTo(self.containerView.snp.trailing).offset(-15)
        })
        self.stocksCollectionView.snp.makeConstraints({
            $0.top.equalTo(self.stocksLabel.snp.bottom).offset(20)
            $0.leading.equalTo(self.containerView.snp.leading)
            $0.trailing.equalTo(self.containerView.snp.trailing)
            $0.height.equalTo(208)
        })
        self.catalogLabel.snp.makeConstraints({
            $0.top.equalTo(self.stocksCollectionView.snp.bottom).offset(30)
            $0.leading.equalTo(self.containerView.snp.leading).offset(15)
        })
        self.catalogCollectionView.snp.makeConstraints({
            $0.top.equalTo(self.catalogLabel.snp.bottom).offset(20)
            $0.leading.equalTo(self.containerView.snp.leading).offset(15)
            $0.trailing.equalTo(self.containerView.snp.trailing).offset(-15)
            $0.bottom.equalTo(self.containerView.snp.bottom).offset(-30)
        })
    }
    
    @objc
    func menuButtonTapped(_ sender: UIButton) {
        self.delegate?.menuButtonTapped(sender)
    }
    
    @objc
    func searchAddressTapped(_ tapGesture: UITapGestureRecognizer) {
        self.delegate?.searchAddressTapped(tapGesture)
    }
    
    @objc
    func heartButtonTapped(_ sender: UIButton) {
        self.delegate?.heartButtonTapped(sender)
    }
    
    @objc
    func showAllButtonTapped(_ sender: UIButton) {
        self.delegate?.showAllButtonTapped(sender)
    }
}
