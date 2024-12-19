//
//  HomeView.swift
//  Aurora
//
//  Created by Elvis Rexha on 19/12/2024.
//

import SwiftUI

struct HomeView: View {
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
            
        }
    }
    
   
}

#Preview {
    HomeView()
}

