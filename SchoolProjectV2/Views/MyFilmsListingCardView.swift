//
//  MyFilmsListingCardView.swift
//  SchoolProjectV2
//
//  Created by Ziemowit Korzeniewski on 16/10/2023.
//

import SwiftUI

struct MyFilmsListingCardView: View {
    let model: MyFilmsListing
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string:model.url_poster ?? ""))
                .aspectRatio(contentMode: .fill)
                .frame(width:100, height: 100)
                .clipped()
            VStack{
                Text(model.title ?? "Listing")
                    .padding(.trailing,3)
                    .font(.title3)
                    .bold()
                
                Text(model.directed_by ?? "Listing")
                    .font(.body)
                    .foregroundColor(Color(.secondaryLabel))
                Text(model.year ?? "Listing")
                    .font(.footnote)
            }
        }
    }
}


