//
//  HomeView.swift
//  Aurora
//
//  Created by Elvis Rexha on 19/12/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var showEntryCreationSheet = false
    var body: some View {
        NavigationStack {
            ZStack {
                
                AppBackgroundView()
                
                VStack(alignment: .leading) {
                    
                    Text("Welcome, Elvis")
                        .font(.headline)
                        .fontWeight(.regular)
                        .padding([.leading])
                   
                    ScrollView {
                        LazyVStack {
                            ForEach(0...2, id: \.self) { _ in
                                JournalRow()
                            }
                        }
                        .padding(.bottom, 80)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Aurora")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Circle()
                        .frame(width: 50, height: 50)
                        .shadow(color: .white, radius: 10)
                        .overlay {
                            Circle()
                                .stroke(lineWidth: 3)
                                .fill(.white)
                                .shadow(radius: 2)
                        }
                }
            }
            .safeAreaInset(edge: .bottom) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 70)
                        .foregroundStyle(.white.opacity(0.5))
                        .blur(radius: 20)
                     
                    Group {
                        Capsule()
                            .fill(.ultraThinMaterial)
                            .frame(width:(UIScreen.main.bounds.width / 3) , height: 70)
                           
                        
                        HStack(spacing: 5) {
                            Button(action: {
                                // Add your action here
                                showEntryCreationSheet.toggle()
                            }) {
                                ZStack {
                                    Circle()
                                        .fill(.black)
                                        .frame(width: 55, height: 55)
                                    
                                    Image(systemName: "plus")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                }
                            }
                            
                            Button(action: {
                                // Add your action here
                            }) {
                                ZStack {
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 55, height: 55)
                                    
                                    Image(systemName: "mic.fill")
                                        .font(.title2)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                    .padding(.bottom, 30)
                }
            }
            .ignoresSafeArea(edges: .bottom)
            .sheet(isPresented: $showEntryCreationSheet) {
                EntryCreationView()
            }
        }
    }
}

#Preview {
    HomeView()
}
