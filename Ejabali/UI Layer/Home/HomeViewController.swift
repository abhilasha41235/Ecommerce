//
//  HomeViewController.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 04/08/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var dataTableView: UITableView!
    @IBOutlet weak var searchTextFields: UITextField!
    
    var interactor: CategoryInteractorLogic?
    var interactorMainCategory: MainCategoryInteractorLogic?
    var interactorBanner: BannerInteractorLogic?
    
    var categoryTop = [MainCategory]()
    var banner: [BannerDetail]?
    var mainCategoryModel: [MainCategoryModel]?
    
    
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
        
        group.enter()
        self.getBanner()
        
        group.enter()
        self.getMainCategoryDetails()
        
        group.notify(queue: DispatchQueue.main, execute: { [weak self] in
            LoadingIndicator.shared.hide()
            self?.dataTableView.reloadData()
        })
     }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    private func configure() {
        let interactor = CategoryInteractor()
        
        interactor.display = self
        self.interactor = interactor
        
        let mainCategoryInteractor = MainCategoryInteractor()
        
        mainCategoryInteractor.display = self
        self.interactorMainCategory = mainCategoryInteractor
        
        let bannerInteractor = BannerInteractor()
        
        bannerInteractor.display = self
        self.interactorBanner = bannerInteractor
    }
    
    func getCategoryDetails() {
        self.interactor?.getCategory(baseUrl: baseUrlString, endPoint:endPoint1, completionHandler: { [weak self] success, categoryData, error in
            if let mainCategory = categoryData?.maincategory {
                for item in mainCategory {
                    let widthOfTitle = item.cat_name?.getWidthOfString(font: UIFont.systemFont(ofSize: 14)).width
                    let mainCat = MainCategory(cat_id: item.cat_id, cat_name: item.cat_name, Description: item.Description, img: item.img, widthOfTitle: widthOfTitle)
                    self?.categoryTop.append(mainCat)
                }
            } else{
                LoadingIndicator.shared.hide()
            }
            self?.group.leave()
        })
    }
    
    func getBanner() {
        self.interactorBanner?.getBanner(baseUrl: baseUrlString, endPoint:endPoint2, completionHandler: { [weak self] success, bannerData, error in
            self?.banner = bannerData?.mainBanner
            self?.group.leave()
        })
    }
    
    func getMainCategoryDetails() {
        self.interactorMainCategory?.getMainCategory(baseUrl: baseUrlString, endPoint:endPoint3, completionHandler: { [weak self] success, categoryData, error in
            self?.mainCategoryModel = categoryData
            self?.group.leave()
        })
    }
    
    func registerCell() {
        dataTableView.register(TopHorizontalTableViewCell.nib, forCellReuseIdentifier: TopHorizontalTableViewCell.identifier)
        dataTableView.register(BannerTableViewCell.nib, forCellReuseIdentifier: BannerTableViewCell.identifier)
        dataTableView.register(ItemTableViewCell.nib, forCellReuseIdentifier: ItemTableViewCell.identifier)
    }
}

extension HomeViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
}

extension HomeViewController: CategoryInteractorLogic {
    func getCategory(baseUrl: String, endPoint: String, completionHandler: @escaping (Bool, CategoryModel?, String?) -> Void) {
        debugPrint("CategoryModel called")

    }
}

extension HomeViewController: BannerInteractorLogic {
    func getBanner(baseUrl: String, endPoint: String, completionHandler: @escaping (_ success: Bool, _ bannerData: BannerModel?, _ error: String?) -> Void) {
        debugPrint("Banner called")

    }
}

extension HomeViewController: MainCategoryInteractorLogic {
    func getMainCategory(baseUrl: String, endPoint: String, completionHandler: @escaping (Bool, [MainCategoryModel]?, String?) -> Void) {
        debugPrint("Banner called")
    }
}
