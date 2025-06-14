//
//  NavBar.swift
//  WomensFootballApp
//
//  Created by Claire Lister on 29/07/2024.
//
import SwiftUI

struct NavBar: View {
    @StateObject var viewModel = SkillsViewModel()
    
    var body: some View {
        NavigationStack {
            TabView {
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
                
                SkillsView(viewModel: viewModel)
                    .tabItem {
                        Label("Skills", systemImage: "magnifyingglass")
                    }
            }
        }
    }
}
