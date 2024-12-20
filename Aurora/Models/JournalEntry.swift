//
//  JournalEntry.swift
//  Aurora
//
//  Created by Elvis Rexha on 20/12/2024.
//

import Foundation
import SwiftUI

struct JournalEntry: Identifiable, Hashable, Codable {
    var id: UUID = .init()
    let entryText: String
    let entryDate: Date
    let entryImageData: Data?
    let entryRecordingData: Data?
    
    var entryImage: Image? {
            guard let imageData = entryImageData, let uiImage = UIImage(data: imageData) else {
                return nil
            }
            return Image(uiImage: uiImage)
        }
    
    init(entryText: String, entryDate: Date, entryImageData: Data?, entryRecordingData: Data?) {
        self.entryText = entryText
        self.entryDate = entryDate
        self.entryImageData = entryImageData
        self.entryRecordingData = entryRecordingData
    }
    
}
