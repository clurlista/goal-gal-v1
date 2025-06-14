//
//  SkillsProgressView.swift
//  WomensFootballApp
//
//  Created by Claire Lister on 28/10/2024.
//
import Foundation
import SwiftUI

struct MasteredSkillView: View {
    var skill: SkillDetails

    var body: some View {
        VStack {
            Text(skill.name)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
                .font(.custom("Digital Arcade Regular", size: 18))
                .foregroundColor(.purple)
                .padding([.top, .horizontal])
            
            Text(skill.mastered ? "💪" : "💪🏻")
                .foregroundColor(skill.mastered ? .green : .red)
                .padding(.bottom)

            if let uiImage = UIImage(named: skill.image) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 200, maxHeight: 200)
                    .padding()
            } else {
                Text("Image not found")
                    .foregroundColor(.gray)
                    .font(.custom("Digital Arcade Regular", size: 12))
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                
            }
        }
        .padding()
        .frame(minWidth: 200, minHeight: 200)
        .cornerRadius(10)
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.purple, lineWidth: 1)
        )
        .frame(maxWidth: .infinity)
    }
}
