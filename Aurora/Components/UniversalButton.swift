//
//  UniversalButton.swift
//  Aurora
//
//  Created by Elvis Rexha on 19/12/2024.
//

import SwiftUI

struct UniversalButton: View {
    let systemImageName: String
    let action: () -> Void
    
    var body: some View {
        
        Circle()
            .fill(.white)
            .overlay {
                Image(systemName: systemImageName)
                    .imageScale(.medium)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        withAnimation(.smooth) {
                            action()
                        }
                    }
            }
    }
}

#Preview {
    UniversalButton(systemImageName: "chevron.right") {
        //
    }
}
