//
//  MainCategoryModel.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 08/08/22.
//

import Foundation


struct MainCategoryModel: Codable {
    var sub_type_id: Int?
    var type: String?
    var type1: String?
    var u: [SubCategoryOfMainCategory]?
    
    private enum CodingKeys : String, CodingKey {
            case sub_type_id, type = "Type", type1, u
    }
}

struct SubCategoryOfMainCategory: Codable {
    var Sub_cat_name: String?
    var Description: String?
    var image1: String?
    var sub_cat_id: Int?
}

