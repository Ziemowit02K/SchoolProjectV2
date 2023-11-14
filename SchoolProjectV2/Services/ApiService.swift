//
//  ApiService.swift
//  SchoolProjectV2
//
//  Created by Ziemowit Korzeniewski on 16/10/2023.
//

import Foundation

final class ApiService
{
    init() {}
    
    struct Constants
    {
        static let apiURL = URL(string: "https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/cats-in-movies/records?limit=100")
    }
    public func getListings(completion: @escaping (Result<[MyFilmsListing], Error>) -> Void){
        guard let url = Constants.apiURL else {
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) {data ,_, error in
            guard let data, error == nil else{
                if let error {
                    completion(.failure(error))
                }
                return
            }
            
            do
            {
                let response = try JSONDecoder().decode(MyFilmsListingResponse.self, from: data)
                completion(.success(response.results))
            }catch
            {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
