//
//  MyFilmsListing.swift
//  SchoolProjectV2
//
//  Created by Ziemowit Korzeniewski on 16/10/2023.
//

import Foundation

struct MyFilmsListing: Codable, Hashable, Identifiable{
    let id = UUID().uuidString
    let produced_by: String?
    let directed_by: String?
    let title: String?
    let year: String?
    let url_en: String?
    let url_poster: String?
    
}
