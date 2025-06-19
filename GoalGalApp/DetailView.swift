//
//  DetailView.swift
//  WomensFootballApp
//
//  Created by Claire Lister on 09/07/2024.
//
import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: SkillDetailViewModel

    var body: some View {
        VStack {
            Text(viewModel.title)
                .font(.custom("Digital Arcade Regular", size: 24))
                .foregroundColor(.purple)
                .padding(.top, 40)

            Spacer().frame(height: 50)

            VStack(spacing: 20) {
                Button(action: {
                    // Toggle mastery logic if needed
                }) {
                    Text(viewModel.isMastered ? "💪" : "💪🏻")
                        .font(.largeTitle)
                }
                .buttonStyle(PlainButtonStyle())

                Spacer().frame(height: 50)

                Image(viewModel.skill.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 5)
                    .padding()

                Text(viewModel.skill.description)
                    .font(.system(.body, design: .monospaced))
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
                    .shadow(color: .black, radius: 2, x: 1, y: 1)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.purple.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 8.0))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8.0)
                            .stroke(Color.black, lineWidth: 2)
                    )
                    .padding(.horizontal)
            }
        }
        .padding()
    }
}
