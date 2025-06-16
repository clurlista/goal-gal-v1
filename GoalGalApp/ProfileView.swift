//
//  ProfileView.swift
//  WomensFootballApp
//
//  Created by Claire Lister on 10/01/2025.
//
import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = SkillsViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    header
                    profileSection
                    masteredSkillsSection
                }
                .padding(.top, 20)
                .navigationBarHidden(true)
            }
            .onAppear {
                viewModel.fetchSkills()
            }
        }
    }
}

private extension ProfileView {
    
    var header: some View {
        HStack {
            Text("Home")
                .font(.custom("Digital Arcade Regular", size: 24))
                .foregroundColor(.black)
                .padding(.leading, 20)
            Spacer()
        }
    }
    
    // MARK: Profile Info
    
    var profileSection: some View {
        HStack {
            ProfilePicIcon(imageName: "profile_picture", size: 50)
                .padding(10)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("User Name")
                    .font(.custom("Digital Arcade Regular", size: 20))
                    .foregroundColor(.black)
                Text("User Level")
                    .font(.custom("Digital Arcade Regular", size: 14))
                    .foregroundColor(.gray)
            }
            .padding(.leading, 10)
            
            Spacer()
        }
        .padding(.horizontal, 20)
    }
    
    var masteredSkillsSection: some View {
        VStack(alignment: .leading) {
            Text("Mastered Skills")
                .font(.custom("Digital Arcade Regular", size: 18))
                .foregroundColor(.black)
                .padding(.leading, 20)
            
            GeometryReader { geometry in
                ScrollView(.horizontal, showsIndicators: false) {
                    let itemWidth = min(geometry.size.width / 2, 90)
                    let itemHeight = min(geometry.size.width / 2, 150)
                    
                    HStack(spacing: 10) {
                        ForEach($viewModel.masteredSkills) { $skill in
                            NavigationLink {
                                DetailView(skill: $skill, viewModel: viewModel)
                            } label: {
                                MasteredSkillView(skill: skill)
                                    .frame(width: itemWidth, height: itemHeight)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.purple, lineWidth: 2)
                                    )
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .frame(height: itemHeight + 30)
                }
            }
            .frame(height: 200)
        }
    }
}
