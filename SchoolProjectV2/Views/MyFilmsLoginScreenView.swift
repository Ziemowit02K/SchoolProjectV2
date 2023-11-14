//
//  MyFilmsLoginScreenView.swift
//  SchoolProjectV2
//
//  Created by Ziemowit Korzeniewski on 16/10/2023.
//

import SwiftUI
import Firebase

struct  MyFilmsLoginScreenView: View{
    @State private var email = ""
    @State private var password=""
    @State public var userIsLoggedIn = false
    var body : some View{
        //        if userIsLoggedIn
        //        {
        //            NavigationLink
        //            {
        //
        //            }
        //        }
        //        else
        //        {
        //            content
        //        }
        //
        //    }
        //    var content: some View{
        
        NavigationView {
            ZStack
            {
                Color.black
                
                RoundedRectangle(cornerRadius: 30, style: .continuous).foregroundStyle(.linearGradient(colors: [.cyan,.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 1000, height: 400)
                    .rotationEffect(.degrees(220))
                    .offset(y: -330)
                
                VStack(spacing: 20)
                {
                    Text("MyFilms")
                    
                        .foregroundColor(.white)
                        .font(.system(size: 50, weight: .bold,design: .serif))
                        .offset(y: -110)
                    
                    TextField("Email", text: $email)
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                    //                    .frame(height: 55)
                    //                        .textFieldStyle(PlainTextFieldStyle())
                    //                        .padding([.horizontal], 4)
                    //                        .cornerRadius(16)
                    //                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white))
                    //                        .padding([.horizontal], 22)
                    //                        .offset(x:-26)
                        .placeholder(when: email.isEmpty){
                            Text("Email")
                                .foregroundColor(.white)
                                .bold()
                            //                                .frame(height: 55)
                            //                                    .textFieldStyle(PlainTextFieldStyle())
                            //                                    .padding([.horizontal], 4)
                            //                                    .cornerRadius(16)
                            //                                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white))
                            //                                    .padding([.horizontal], 22)
                            //                                    .offset(x:-26)
                            
                        }
                    Rectangle()
                        .frame(width:350, height: 1)
                        .foregroundColor(.white)
                    
                    SecureField("Hasło", text: $password)
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                    //                    .frame(height: 55)
                    //                        .textFieldStyle(PlainTextFieldStyle())
                    //                        .padding([.horizontal], 4)
                    //                        .cornerRadius(16)
                    //                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white))
                    //                        .padding([.horizontal], 22)
                    //                        .offset(x:-26)
                        .placeholder(when: password.isEmpty){
                            Text("Hasło")
                                .foregroundColor(.white)
                                .bold()
                            
                        }
                    Rectangle()
                        .frame(width:350, height: 1)
                        .foregroundColor(.white)
                    
                    Button(action: {
                        register()
                        //userIsLoggedIn.toggle()
                    }, label: {
                        if userIsLoggedIn{
                            NavigationLink{
                                MyFilmsListingView()
                            }label: {
                                VStack {
                                    Text("Zarejestrowano pomyślnie")
                                        .bold()
                                        .foregroundColor(.white)
                                    Text("Naciśnij aby przejść dalej")
                                        .bold()
                                        .frame(width:200, height: 40)
                                        .background(RoundedRectangle(cornerRadius: 12, style: .continuous).fill(.linearGradient(colors: [.blue, .cyan], startPoint: .topLeading, endPoint: .bottom)))
                                        .foregroundColor(.black)
                                }
                                
                            }}else
                        {
                                Text("Zarejestruj")
                                    .bold()
                                    .frame(width:200, height: 40)
                                    .background(RoundedRectangle(cornerRadius: 12, style: .continuous).fill(.linearGradient(colors: [.blue, .cyan], startPoint: .topLeading, endPoint: .bottom)))
                                    .foregroundColor(.black)
                            }
                        
                    })
                    .padding(.top)
                    .offset(y: 100)
                    
                    Button(action: {
                        login()
                    }, label: {
                        if userIsLoggedIn == true{
                            NavigationLink
                            {
                                MyFilmsListingView()
                            }label:
                            {
                                VStack {
                                    Text("Zalogowano pomyślnie")
                                        .bold()
                                        .foregroundColor(.white)
                                    Text("Naciśnij aby przejść dalej")
                                        .bold()
                                        .frame(width:200, height: 40)
                                        .background(RoundedRectangle(cornerRadius: 12, style: .continuous).fill(.linearGradient(colors: [.blue, .cyan], startPoint: .topLeading, endPoint: .bottom)))
                                        .foregroundColor(.black)
                                }
                            }}else{
                                
                                Text("Już posiadasz konto? Zaloguj się")
                                    .bold()
                                    .foregroundColor(.white)
                            }}
                    )
                    .padding(.top)
                    .offset(y: 105)
                    
                    
                }.frame(width:350)
                //                    .onAppear
                //                        {
                //                            let user = Auth.auth().currentUser;
                //                                    if (user == nil)
                //                            {
                //                                        userIsLoggedIn.toggle()
                //                                    }
                //
                //
                //                        }
                //                        .onAppear{
                //                            Auth.auth().addStateDidChangeListener { auth, user in
                //                                if user != nil
                //                                {
                //                                    userIsLoggedIn.toggle()
                //                                }
                //                            }
                //                        }
                
            }
            .ignoresSafeArea()
        }.navigationBarBackButtonHidden(true)
    }
    func login()
    {
        Auth.auth().signIn(withEmail: email, password: password){result, error in if error != nil
            {
            print(error!.localizedDescription)
        }else{
            userIsLoggedIn = true
        }
        }
        
        
        
    }
    func register()
    {
        Auth.auth().createUser(withEmail: email, password: password) {result, error in
            if error != nil
            {
                print(error!.localizedDescription)
            }else{
                userIsLoggedIn = true
            }
        }
    }}

struct ContentView_Previewis: PreviewProvider{
    static var previews: some View{
        MyFilmsLoginScreenView()
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}


