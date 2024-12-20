//
//  EntryCreationView.swift
//  Aurora
//
//  Created by Elvis Rexha on 20/12/2024.
//

import SwiftUI

struct EntryCreationView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var entryText: String = ""
    var body: some View {
        NavigationStack {
            ZStack {
                AppBackgroundView()
                
                VStack {
                    GeometryReader {
                        let size = $0.size
                        
                        TextField(text: $entryText, axis: .vertical) {
                            Text("Type here...")
                        }
                        .padding()
                    }
                    .frame(height: 300)
                    .background(Color.white, in: .rect(cornerRadius: 20))
                    .padding(.horizontal)
                }
                .overlay(alignment: .bottom) {
                    HStack {
                        UniversalButton(systemImageName: "photo") {
                            // show photo picker here (toggle)
                        }
                        
                        .frame(width: 50, height: 50)
                        .shadow(radius: 1)
                        UniversalButton(systemImageName: "camera") {
                            // take a picture... (toggle camera)
                        }
                        .shadow(radius: 1)
                        .frame(width: 50, height: 50)
                        UniversalButton(systemImageName: "waveform") {
                            // record something
                        }
                        .shadow(radius: 1)
                        .frame(width: 50, height: 50)
                        UniversalButton(systemImageName: "") {
                            //
                        }
                        .shadow(radius: 1)
                        .frame(width: 50, height: 50)
                        
                        Capsule()
                            .frame(height: 50)
                            .foregroundStyle(.ultraThinMaterial)
                            .shadow(radius: 1)
                            .overlay {
                                Text("Save")
                                    .fontWeight(.semibold)
                            }
                    }
                    .padding(.bottom)
                    .padding(.horizontal, 30)
                }
               
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
               
               
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        UniversalButton(systemImageName: "chevron.left") {
                            // dismiss the view
                            dismiss()
                        }
                        .frame(width: 50, height: 50)
                        .padding(.top)
                    }
                    ToolbarItem(placement: .principal) {
                        Text("New Journal")
                            .fontWeight(.semibold)
                            .font(.title)
                            .padding(.top)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        UniversalButton(systemImageName: "bookmark") {
                            ///
                        }
                        .frame(width: 50, height: 50)
                        .padding(.top)
                    }
                }
            }
        }
    }
}

#Preview {
    EntryCreationView()
}
