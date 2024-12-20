//
//  View Extension.swift
//  Aurora
//
//  Created by Elvis Rexha on 20/12/2024.
//

import Foundation
import SwiftUI


extension View {
    
    //MARK: Get Safe Area Insets For All Devices
    func safeAreaInsets() -> EdgeInsets {
        guard let windowScene = UIApplication.shared.connectedScenes
                .first as? UIWindowScene,
              let safeArea = windowScene.windows.first?.safeAreaInsets else {
            return EdgeInsets()
        }
        return EdgeInsets(
            top: safeArea.top,
            leading: safeArea.left,
            bottom: safeArea.bottom,
            trailing: safeArea.right
        )
    }
}
