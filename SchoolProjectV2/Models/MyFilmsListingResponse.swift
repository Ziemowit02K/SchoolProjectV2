//
//  MyFilmsListingResponse.swift
//  SchoolProjectV2
//
//  Created by Ziemowit Korzeniewski on 16/10/2023.
//

import Foundation

struct MyFilmsListingResponse: Codable{
    let total_count: Int
    let results: [MyFilmsListing]
}
