//
//  ProfileView.swift
//  WomensFootballApp
//
//  Created by Claire Lister on 10/01/2025.
//
import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = SkillsViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    HStack {
                        Text("Home")
                            .font(.custom("Digital Arcade Regular", size: 24))
                            .foregroundColor(.black)
                            .padding([.top, .leading], 20)
                        Spacer()
                    }
                    
                    HStack {
                        ProfilePicIcon(imageName: "profile_picture", size: 50)
                            .padding(10)
                        VStack(alignment: .leading) {
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
                    .padding([.leading, .top], 20)
                    
                    
                    Text("Mastered Skills")
                        .font(.custom("Digital Arcade Regular", size: 18))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                    
                    GeometryReader { geometry in
                        ScrollView(.horizontal) {
                            HStack(spacing: 10) {
                                ForEach(viewModel.masteredSkills, id: \.self) { item in
                                    NavigationLink {
                                        DetailView(skill: item, viewModel: viewModel)
                                    } label: {
                                        MasteredSkillView(skill: item)
                                            .frame(width: min(geometry.size.width / 2, 90), height: min(geometry.size.width / 2, 150))
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
                            .frame(height: 180)
                            .background(Color.white)
                            .onAppear {
                                viewModel.fetchSkills()
                            }
                        }
                    }
                    .frame(height: 200)
                }
                .navigationBarHidden(true)
            }
        }
    }
}
