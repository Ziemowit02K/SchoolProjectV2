//
//  MyFilmsSavedFilmsView.swift
//  SchoolProjectV2
//
//  Created by Ziemowit Korzeniewski on 13/11/2023.
//

import SwiftUI

struct MyFilmsSavedFilmsView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var showPopup = false
    
    var body: some View {
        NavigationView{
            
            List(dataManager.Film, id: \.id){
                SavedFilm in Text(SavedFilm.Title)
            }
            .navigationTitle("Zapisane Filmy")
            .navigationBarItems(trailing: Button(action:{
                showPopup.toggle()
                
            },label:{
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showPopup){
                NewSavedFilmView()
            }
            
        }
        
    }
}

struct ListView_Previews: PreviewProvider{
    static var previews: some View
    {
        MyFilmsSavedFilmsView()
            .environmentObject(DataManager())
    }
}
