//
//  MyFilmsListingView.swift
//  SchoolProjectV2
//
//  Created by Ziemowit Korzeniewski on 16/10/2023.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

struct MyFilmsListingView: View {
    @StateObject var viewModel = MyFilmsLitingViewViewModel()
    @StateObject var dataManager = DataManager()
    public var body: some View {
        //        if MyFilmsLoginScreenView().userIsLoggedIn
        //        {
        //            MyFilmsListingContent
        //        }
        //        else
        //        {
        //            MyFilmsLoginScreenView()
        //        }
        NavigationView{
            ZStack {
                VStack{
                    Text("MyFilms")
                        
                        .bold()
                        .foregroundColor(.black)
                        .font(.system(size: 55, weight: .bold,design: .serif))
                        .offset(y: 100)
                        .background(RoundedRectangle(cornerRadius: 30, style: .continuous).foregroundStyle(.linearGradient(colors: [.cyan,.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .frame(width: 450, height: 350))
                    
                    
                        VStack {
                            Button(action: {
                                if Auth.auth().currentUser != nil {
                                    do {
                                        try Auth.auth().signOut()
                                    }
                                    catch {
                                    }
                                }
                            }, label: {
                                NavigationLink{
                                    MyFilmsLoginScreenView()
                                    
                                }label:{
                                    Text("Wyloguj")
                                        .bold()
                                        .frame(width:200, height: 40)
                                        .foregroundColor(.black)
                                        .foregroundColor(.black)
                                    .font(.system(size: 20))}
                                
                                
                        })
                        }
                    .padding(.top)
                    .offset( x: 150,y: -85)
                    NavigationLink
                    {
                        MyFilmsSavedFilmsView()
                            .environmentObject(dataManager)
                    } label: {
                        Text("Moje Filmy")
                            .bold()
                            .frame(width:200, height: 40)
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                    }
                    .padding(.top)
                    .offset( x: -140,y: -150)
                    .bold()
                    
                    if viewModel.listings.isEmpty{
                        ProgressView().progressViewStyle(CircularProgressViewStyle())
                    }else{
                        List(viewModel.listings){listing in
                            NavigationLink(destination: MyFilmsDeatilView(model: listing), label: {MyFilmsListingCardView(model: listing)
                            })
                        }
                        
                        
                    }
                }
                
                
                
            }}.navigationBarBackButtonHidden(true)
        
        
        
        
        
        .onAppear()
        {
            viewModel.fetchLisitings()
        }
        
        
        
        
        
    }}

#Preview {
        MyFilmsListingView()
        }
        
            
