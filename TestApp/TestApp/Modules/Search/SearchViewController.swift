//
//  SearchViewController.swift
//  TestApp
//
//  Created by Елена Воронцова on 13.12.2023.
//

import UIKit

final class SearchViewController: UIViewController {
    private lazy var mainView = SearchView(subscriber: self)
    weak var delegate: MainScreenDelegate?
    
    private var queries = [AddressData.Response]()
    private var selectedAddress = ""
    private var searchTimer: Timer?
    
    override func loadView() {
        super.loadView()
        
        self.view = self.mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainView.searchView.delegate = self
        self.mainView.searchView.searchTextField.addDoneButton(title: "Готово", target: self, selector: #selector(tapDone))
        
        self.mainView.locationTableView.delegate = self
        self.mainView.locationTableView.dataSource = self
    }
    
    private func getLocations(query: String) {
        NetworkManager.shared.fetchAPIData(query: query) { result in
            switch result {
            case .failure(let error):
                AlertService().showAlert(style: .alert, title: "red", message: error.message)
            case .success(let result):
                self.queries = result
                self.mainView.locationTableView.reloadData()
            }
        }
    }
    
    @objc
    func swipedLeft(gesture: UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 0.8) {
            self.dismiss(animated: false)
        }
    }
    
    @objc
    private func tapDone(sender: Any) {
        self.mainView.endEditing(true)
    }
}

extension SearchViewController: SearchDelegate {
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.queries.first?.suggestions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.queries.first?.suggestions![indexPath.row].data?.streetWithType != nil && self.queries.first?.suggestions![indexPath.row].data?.house != nil {
            self.selectedAddress = "\(self.queries.first?.suggestions![indexPath.row].data?.streetWithType ?? ""), \(self.queries.first?.suggestions![indexPath.row].data?.house ?? "")"
            
            self.dismiss(animated: true, completion: {
                self.delegate?.changeLocation(location: self.selectedAddress)
            })
        } else {
            let alertController = UIAlertController(title: "Внимание!", message: "Необходимо выбрать адрес с указанием улицы и № дома", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: LocationTableViewCell = tableView.dequeueCell(for: indexPath)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if !self.queries.isEmpty {
            if self.queries.first?.suggestions![indexPath.row].data?.streetWithType != nil {
                let text = "\(self.queries.first?.suggestions![indexPath.row].data?.streetWithType ?? ""), \(self.queries.first?.suggestions![indexPath.row].data?.house ?? "")"
                let text2 = "\(self.queries.first?.suggestions![indexPath.row].data?.city ?? self.queries.first?.suggestions![indexPath.row].data?.settlement ?? ""), \(self.queries.first?.suggestions![indexPath.row].data?.regionWithType ?? ""), \(self.queries.first?.suggestions![indexPath.row].data?.country ?? "")"
                (cell as? LocationTableViewCell)?.configure(text, text2)
            } else {
                let text = "\(self.queries.first?.suggestions![indexPath.row].data?.city ?? self.queries.first?.suggestions![indexPath.row].data?.settlement ?? "")"
                let text2 = "\(self.queries.first?.suggestions![indexPath.row].data?.regionWithType ?? ""), \(self.queries.first?.suggestions![indexPath.row].data?.country ?? "")"
                (cell as? LocationTableViewCell)?.configure(text, text2)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchTimer?.invalidate()
        
        self.searchTimer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { _ in
            if searchText.count != 1  {
                self.getLocations(query: searchText)
            }
        }
    }
}
