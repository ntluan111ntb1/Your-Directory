//
//  ContentView.swift
//  Your Directory
//
//  Created by LuanNT29 on 17/09/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: HomeViewModel
    @Binding var vocabularies: [Vocabulary]
    @Binding var folders: [Folder]
    
    var body: some View {
        TabView {
            HomeView(
                viewModel: viewModel,
                vocabularies: $vocabularies,
                folders: $folders
            )
            .tabItem {    // 2
                Image(systemName: "house.fill")
                Text("Home")
            }
            FavoriteVocabulariesView(vocabularies: $vocabularies)
                .tabItem {
                    Image(systemName: "gamecontroller.fill")
                    Text("Favorite")
                }
            StudiedVocabulariesView(vocabularies: $vocabularies)
                .tabItem {
                    Image(systemName: "video.circle.fill")
                    Text("Video")
                }
        }
    }
}
