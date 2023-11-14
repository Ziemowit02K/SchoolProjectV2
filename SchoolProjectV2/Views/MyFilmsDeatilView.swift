//
//  MyFilmsDeatilView.swift
//  SchoolProjectV2
//
//  Created by Ziemowit Korzeniewski on 16/10/2023.
//

import SwiftUI

struct MyFilmsDeatilView: View {
    let model: MyFilmsListing
    var body: some View {
        ScrollView(.vertical)
        {
            //picture
            AsyncImage(url: URL(string: model.url_poster ?? ""))
                .aspectRatio(contentMode: .fill)
                .clipped()
            //info
            Text(model.title ?? "")
                .bold()
                .font(.largeTitle)
            Text("Rok produkcji: \(model.year ?? "")")
                .font(.callout)
            Text("O filmie: ")
                .bold()
                .font(.title2)
            Text("Reżyseria: \(model.directed_by ?? "")")
            Text("Wyprodukowany przez: \(model.produced_by ?? "")")
            Text("Więcej informacji: \(model.url_en ?? "")")
                .font(.caption)
            
        }.navigationTitle(model.title ?? "Listing")
    }
}

