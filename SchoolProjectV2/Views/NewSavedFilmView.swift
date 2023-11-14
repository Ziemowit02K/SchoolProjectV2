//
//  NewSavedFilmView.swift
//  SchoolProjectV2
//
//  Created by Ziemowit Korzeniewski on 13/11/2023.
//

import SwiftUI

struct NewSavedFilmView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var newFilm=""
    var body: some View {
        NavigationView{
            
       
        VStack{
            TextField("Film: ", text: $newFilm)
            
            Button(action: {
                dataManager.addFilm(Title: newFilm)
            }, label: {
                Text("Zapisz")
            })
        }}
        .padding()
        
        
    }
}

#Preview {
    NewSavedFilmView()
}
