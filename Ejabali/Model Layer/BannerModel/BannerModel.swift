//
//  BannerModel.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 08/08/22.
//

import Foundation

struct BannerModel: Codable {
    var status: String?
    var mainBanner: [BannerDetail]?
}

struct BannerDetail: Codable {
    var Banner_Name: String?
    var Banner_image: String?
    var cat_id: String?
}
