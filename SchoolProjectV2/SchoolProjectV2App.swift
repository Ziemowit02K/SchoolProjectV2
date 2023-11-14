//
//  SchoolProjectV2App.swift
//  SchoolProjectV2
//
//  Created by Ziemowit Korzeniewski on 16/10/2023.
//

import SwiftUI
import Firebase
@main
struct SchoolProjectV2App: App {
   @StateObject var dataManager = DataManager()
    init()
    {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MyFilmsLoginScreenView()
        }
    }
}
