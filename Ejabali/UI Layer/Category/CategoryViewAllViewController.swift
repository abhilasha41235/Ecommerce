//
//  CategoryViewAllViewController.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 16/08/22.
//

import UIKit

class CategoryViewAllViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var subCategoryModel = [MainCategoryModel]()

    var interactor: MainCategoryInteractorLogic?
    
    let group = DispatchGroup()
    var selectedItem = ""
    
    let baseUrlString = "http://ejabali.com/service.asmx"
    let endPoint1 = "/Get_Sub_Cat_Search_Detailst?SearchKey="
    
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
        self.navigationController?.navigationBar.isHidden = false
        setUpNavigation()
    }
    
    func setUpNavigation() {
        let view = UIView()
            let button = UIButton(type: .system)
            button.setImage(UIImage(named: "Back"), for: .normal)
            button.addTarget(self, action: #selector(onBackButton), for: .touchUpInside)
            button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: -10)
            button.sizeToFit()
            view.addSubview(button)
            view.frame = button.bounds
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: view)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.title = selectedItem.capitalizingFirstLetter()

    }
    
    @objc func onBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func getCategoryDetails() {
        self.interactor?.getMainCategory(baseUrl: baseUrlString, endPoint: "\(endPoint1)\(selectedItem)", completionHandler: { [weak self] success, categoryData, error in
            self?.subCategoryModel = categoryData!
            self?.group.leave()
        })
//        self.interactor?.getCategory(baseUrl: baseUrlString, endPoint:endPoint1, completionHandler: { [weak self] success, categoryData, error in
//            self?.categoryTop = categoryData?.maincategory ?? [MainCategory]()
//            self?.group.leave()
//        })
    }
    
    private func configure() {
        let interactor = MainCategoryInteractor()
        interactor.display = self
        self.interactor = interactor
    }
    
    func registerCell() {
        categoryCollectionView.register(ItemCollectionCell.nib, forCellWithReuseIdentifier: ItemCollectionCell.identifier)
        
    }
}
extension CategoryViewAllViewController: MainCategoryInteractorLogic {
//    func getCategory(baseUrl: String, endPoint: String, completionHandler: @escaping (Bool, CategoryModel?, String?) -> Void) {
//        debugPrint("CategoryModel called")
//    }
    
    func getMainCategory(baseUrl: String, endPoint: String, completionHandler: @escaping (Bool, [MainCategoryModel]?, String?) -> Void) {
        debugPrint("Sub CategoryModel called")
    }
}
