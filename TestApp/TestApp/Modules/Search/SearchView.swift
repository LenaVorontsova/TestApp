//
//  SearchView.swift
//  TestApp
//
//  Created by Елена Воронцова on 13.12.2023.
//

import UIKit

final class SearchView: UIView {
    public lazy var searchView: UISearchBar = {
        let view = UISearchBar(frame: .zero)
        view.placeholder = "Введите адрес"
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.clear.cgColor
        view.searchBarStyle = .minimal
        
        view.layer.cornerRadius = 5
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public lazy var locationTableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.separatorStyle = .none
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .clear
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(cell: LocationTableViewCell.self)
        return view
    }()
    
    weak var delegate: SearchDelegate?
    
    init(subscriber: SearchDelegate?) {
        super.init(frame: .zero)
        
        self.delegate = subscriber
        self.addSubviews()
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addSubview(self.searchView)
        self.addSubview(self.locationTableView)
        
        self.backgroundColor = .white
    }
    
    private func setupLayout() {
        self.searchView.snp.makeConstraints({
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            $0.leading.trailing.equalToSuperview().inset(15)
        })
        self.locationTableView.snp.makeConstraints({
            $0.top.equalTo(self.searchView.safeAreaLayoutGuide.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        })
    }
}
