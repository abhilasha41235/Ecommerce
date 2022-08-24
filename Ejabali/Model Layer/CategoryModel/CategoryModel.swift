//
//  CategoryModel.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 08/08/22.
//

import Foundation
import UIKit

struct CategoryModel: Codable {
    var status: String?
    var maincategory: [MainCategory]?
}

struct MainCategory: Codable {
    var cat_id: String?
    var cat_name: String?
    var Description: String?
    var img: String?
    var widthOfTitle: CGFloat?
}
