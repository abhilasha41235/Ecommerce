import Foundation

protocol CategoryInteractorLogic: AnyObject {
     func getCategory(baseUrl: String, endPoint: String, completionHandler: @escaping (_ success: Bool, _ categoryData: CategoryModel?, _ error: String?) -> Void)
}

class CategoryInteractor: CategoryInteractorLogic {
    
    unowned var display: CategoryInteractorLogic?
    
    public func getCategory(baseUrl: String, endPoint: String, completionHandler: @escaping (_ success: Bool, _ categoryData: CategoryModel?, _ error: String?) -> Void) {
        GatewayService().apiGet(baseURL: baseUrl + endPoint) { (response: ServiceResponse<CategoryModel>) in
            completionHandler(true, response.data, nil)
        }
    }
}


protocol MainCategoryInteractorLogic: AnyObject {
     func getMainCategory(baseUrl: String, endPoint: String, completionHandler: @escaping (_ success: Bool, _ categoryData: [MainCategoryModel]?, _ error: String?) -> Void)
}

class MainCategoryInteractor: MainCategoryInteractorLogic {
    
    unowned var display: MainCategoryInteractorLogic?
    
    public func getMainCategory(baseUrl: String, endPoint: String, completionHandler: @escaping (_ success: Bool, _ categoryData: [MainCategoryModel]?, _ error: String?) -> Void) {
        GatewayService().apiGet(baseURL: baseUrl + endPoint) { (response: ServiceResponse<[MainCategoryModel]>) in
            completionHandler(true, response.data, nil)
        }
    }
}

protocol BannerInteractorLogic: AnyObject {
     func getBanner(baseUrl: String, endPoint: String, completionHandler: @escaping (_ success: Bool, _ bannerData: BannerModel?, _ error: String?) -> Void)
}

class BannerInteractor: BannerInteractorLogic {
    
    unowned var display: BannerInteractorLogic?
    
    public func getBanner(baseUrl: String, endPoint: String, completionHandler: @escaping (_ success: Bool, _ bannerData: BannerModel?, _ error: String?) -> Void) {
        GatewayService().apiGet(baseURL: baseUrl + endPoint) { (response: ServiceResponse<BannerModel>) in
            completionHandler(true, response.data, nil)
        }
    }
}
