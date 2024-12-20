//
//  JournalRow.swift
//  Aurora
//
//  Created by Elvis Rexha on 19/12/2024.
//

import SwiftUI

struct JournalRow: View {
    @State private var animateView: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(.stock)
                    .resizable()
                    .aspectRatio(1.3, contentMode: .fit)
                    .clipShape(.rect(cornerRadius: 30))
                    .blur(radius: animateView ? 0 : 10)
                    .scaleEffect(animateView ? 1 : 0.4)
                
                VStack(spacing: 4) {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(height: 70)
                        .foregroundStyle(.appCapsule)
                        .overlay(alignment: .leading) {
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 30)
                                        .padding(3)
                                        .foregroundStyle(.white)
                                    Image(systemName: "figure.walk")
                                        .imageScale(.large)
                                        .foregroundStyle(.black)
                                }
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Walk")
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                        Text("1820 steps")
                                        .font(.caption2)
                                        .foregroundStyle(.gray)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Spacer()
                            }
                        }
                    
                    RoundedRectangle(cornerRadius: 30)
                        .frame(height: 70)
                        .foregroundStyle(.appCapsule)
                        .overlay(alignment: .leading) {
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 30)
                                        .padding(3)
                                        .foregroundStyle(.white)
                                    Image(systemName: "waveform")
                                        .imageScale(.large)
                                        .foregroundStyle(.black)
                                    
                                }
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("|||||||||||||||||||||")
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                        Text("00: 15")
                                        .font(.caption2)
                                        .foregroundStyle(.gray)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Spacer()
                            }
                        }
                }
                .padding(.trailing, 3)
            }
            
            Text("Morning Visit, Maui Beach.\nLast night my dream featured surfing.\nWhenever this occurs, I am confident that I will have an excellent day on the water.")
            
            RoundedRectangle(cornerRadius: 30)
                .foregroundStyle(.ultraThinMaterial)
                .frame(height: 55)
                .overlay {
                    HStack(spacing: 0) {
                        Text("Thu, Sep 20")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.gray)
                        Group {
                            UniversalButton(systemImageName: "bookmark") {
                                // add the entry to bookmark array
                            }
                            UniversalButton(systemImageName: "pencil.and.outline") {
                                // edit the journal entry
                            }
                        }
                        .padding(3)
                        
                    }
                    .padding(.leading)
                    
                    
                }
                .padding(4)
            
        }
        .padding(4)
        .background(Color.white)
        .padding(.horizontal, 8)
        .clipShape(.rect(cornerRadius: 50))
        .onAppear {
            withAnimation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.2)) {
                animateView = true
            }
        }
    }
}

#Preview {
    JournalRow()
}



