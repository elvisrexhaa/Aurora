//
//  HomeView.swift
//  Aurora
//
//  Created by Elvis Rexha on 19/12/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var showEntryCreationSheet = false
    @StateObject private var homeViewModel = HomeViewModel()
    @State private var animateHomeView: Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                
                AppBackgroundView()
                
                VStack(alignment: .leading) {
//                    
//                    Text("Welcome, Elvis")
//                        .font(.headline)
//                        .fontWeight(.regular)
//                        .padding([.leading])
                   
                    if homeViewModel.entries.isEmpty {
                        ContentUnavailableView("No Entries", systemImage: "rectangle.on.rectangle.slash", description: Text("Click the plus button below\nto add new entries"))

                    } else {
                        ScrollView {
                            LazyVStack {
                                ForEach(homeViewModel.entries) { entry in
                                    JournalRow(entry: entry)
                                }
                            }
//                            .padding(.bottom, 80)
                            
                        }
                        .padding(.top, 50)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
//                .padding(.top, 50)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Aurora")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(.top, safeAreaInsets().top)
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
                        .padding(.top, safeAreaInsets().top)
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
            .onAppear {
                withAnimation(.smooth) {
                    animateHomeView = true
                }
            }
            .ignoresSafeArea(edges: .bottom)
            .sheet(isPresented: $showEntryCreationSheet) {
                EntryCreationView(homeViewModel: homeViewModel)
            }
            
        }
        
    }
}

#Preview {
    HomeView()
}



