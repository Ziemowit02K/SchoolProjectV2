//
//  MyFilmsLitingViewViewModel.swift
//  SchoolProjectV2
//
//  Created by Ziemowit Korzeniewski on 16/10/2023.
//

import Foundation

final class MyFilmsLitingViewViewModel: ObservableObject {
    private let service = ApiService()
    
    @Published var listings: [MyFilmsListing] = []
    
    public func fetchLisitings(){
        service.getListings{[weak self] result in
            switch result {
            case .success(let models):
                self?.listings = models;
            case .failure:
                break
                
                
            }
        }
    }
}

