//
//  CategoryViewController.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 04/08/22.
//

import UIKit

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var searchTextFields: UITextField!
    
    var interactor: CategoryInteractorLogic?
    
    var categoryTop = [MainCategory]()
    
    
    let baseUrlString = "http://ejabali.com/service.asmx"
    let endPoint1 = "/maincategory"
    let endPoint2 = "/mainBanner"
    let endPoint3 = "/maincHomePage"
    
    let group = DispatchGroup()
    
    private static let jsonDecoder: JSONDecoder = {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(Utils.iso8601Formatter)
            return decoder
        }()

     override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        
        self.configure()
        
        LoadingIndicator.shared.show()

        group.enter()
        self.getCategoryDetails()
        
        group.notify(queue: DispatchQueue.main, execute: { [weak self] in
            LoadingIndicator.shared.hide()
            self?.categoryCollectionView.reloadData()
        })
     }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func getCategoryDetails() {
        self.interactor?.getCategory(baseUrl: baseUrlString, endPoint:endPoint1, completionHandler: { [weak self] success, categoryData, error in
            self?.categoryTop = categoryData?.maincategory ?? [MainCategory]()
            self?.group.leave()
        })
    }
    
    private func configure() {
        let interactor = CategoryInteractor()
        interactor.display = self
        self.interactor = interactor
    }
    
    func registerCell() {
        categoryCollectionView.register(ItemCollectionCell.nib, forCellWithReuseIdentifier: ItemCollectionCell.identifier)
        
    }
}

extension CategoryViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

extension CategoryViewController: CategoryInteractorLogic {
    func getCategory(baseUrl: String, endPoint: String, completionHandler: @escaping (Bool, CategoryModel?, String?) -> Void) {
        debugPrint("CategoryModel called")
    }
}
