//
//  DataManager.swift
//  SchoolProjectV2
//
//  Created by Ziemowit Korzeniewski on 13/11/2023.
//

import SwiftUI
import Firebase

class DataManager: ObservableObject {
    @Published var Film: [SavedFilms] = []
    
    init(){
            fetchMyFilms()
    }
    
    
    func fetchMyFilms()
    {
        Film.removeAll()
        let db = Firestore.firestore()
        let ref  = db.collection("MyFilms")
        ref.getDocuments{ snapshot, error in guard error == nil else{
            print(error!.localizedDescription)
            return
            }
            if let snapshot = snapshot {
                for document in snapshot.documents{
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let Title = data["Title"] as? String ?? ""
                    let Description = data["Description"] as? String ?? ""
                    let Year = data["Year"] as? String ?? ""
                    let Time = data["Time"] as? String ?? ""
                    let Grade = data["Grade"] as? String ?? ""
                    
                    let SavedFilm = SavedFilms(id: id, Title: Title, Description: Description,Year: Year, Time: Time, Grade: Grade)
                    self.Film.append(SavedFilm)
                }
            }
        }
       
        
        
    }
    
    func addFilm(Title: String)
    {
        let db = Firestore.firestore()
        let ref = db.collection("MyFilms").document(Title)
        ref.setData(["Title": Title, "id": UUID().uuidString]) {error in
            if let error = error
            {
                print(error.localizedDescription)
            }}
    }
}
