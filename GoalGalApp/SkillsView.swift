    //
    //  SkillsView.swift
    //  WomensFootballApp
    //
    //  Created by Claire Lister on 09/07/2024.
    //
import SwiftUI

struct SkillsView: View {
    @ObservedObject var viewModel: SkillsViewModel
    
    var body: some View {
        NavigationView {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(viewModel.skills, id: \.self) { skill in
                    NavigationLink {
                        DetailView(skill: skill, viewModel: viewModel)
                    } label: {
                        SkillSummaryView(skill: skill, viewModel: viewModel)
                    }
                    .padding(.horizontal)
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Skills")
                        .font(.custom("Digital Arcade Regular", size: 30))
                        .foregroundColor(.purple)
                        .shadow(color: .green, radius: 5, x: 4, y: 4)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Navigation bar button pressed")
                    }) {
                        Image(systemName: "house")
                            .foregroundColor(.purple)
                    }
                }
            }
        }
        }
        .onAppear {
            viewModel.fetchSkills()
        }
    }
}
