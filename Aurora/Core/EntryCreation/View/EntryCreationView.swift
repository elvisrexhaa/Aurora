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
    
    var homeViewModel: HomeViewModel
    @StateObject var entryCreationViewModel: EntryCreationViewModel
    init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
        _entryCreationViewModel = StateObject(wrappedValue: EntryCreationViewModel(homeViewModel: homeViewModel))
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                AppBackgroundView()
                
                VStack {
                    GeometryReader {
                        let size = $0.size
                        
                        TextField(text: $entryCreationViewModel.entryText, axis: .vertical) {
                            Text("Type here...")
                        }
                        .padding()
                        .frame(height: size.height, alignment: .top)
                    }
                    .frame(height: 300)
                    .background(Color.white, in: .rect(cornerRadius: 20))
                    .padding(.horizontal)
                    
                    HStack {
                        UniversalButton(systemImageName: "photo") {
                            // show photo picker here (toggle)
                            entryCreationViewModel.showImagePicker.toggle()
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
                        UniversalButton(systemImageName: "photo.fill") {
                            //
                        }
                        .shadow(radius: 1)
                        .frame(width: 50, height: 50)
                        
                        Button {
                            // save the entry and append to entries array
                            entryCreationViewModel.addNewEntry()
                            dismiss()
                        } label: {
                            Capsule()
                                .frame(height: 50)
                                .foregroundStyle(.ultraThinMaterial)
                                .shadow(radius: 1)
                                .overlay {
                                    Text("Save")
                                        .fontWeight(.semibold)
                                }
                                
                        }
                        .buttonStyle(.plain)
                        
                            
                    }
                    .padding(.bottom)
                    .padding(.horizontal, 20)
                    
                    if let entryImage = entryCreationViewModel.entryImage {
                        entryImage
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .padding()
                    }
                
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
            .photosPicker(isPresented: $entryCreationViewModel.showImagePicker, selection: $entryCreationViewModel.selectedItem)
        }
    }
}

#Preview {
    EntryCreationView(homeViewModel: HomeViewModel())
}
