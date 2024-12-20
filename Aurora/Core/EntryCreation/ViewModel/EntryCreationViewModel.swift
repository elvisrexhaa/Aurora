//
//  EntryCreationViewModel.swift
//  Aurora
//
//  Created by Elvis Rexha on 20/12/2024.
//

import Foundation
import SwiftUI
import PhotosUI

class EntryCreationViewModel: ObservableObject {
    @Published var entryText: String = ""
    @Published var entryDate: Date? = Date()
    @Published var entryImageData: Data?
    @Published var entryWalkInSteps: Double?
    
    @Published var selectedItem: PhotosPickerItem? {
        didSet { Task { try await selectPhoto() }}
    }
    @Published var showImagePicker: Bool = false
    
    @Published var errorMessage: String?
    
    weak var homeViewModel: HomeViewModel?
    init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
    }
    
    var entryImage: Image? {
           guard let imageData = entryImageData, let uiImage = UIImage(data: imageData) else {
               return nil
           }
           return Image(uiImage: uiImage)
       }
    
    @MainActor
    func selectPhoto() async throws {
        guard let selectedItem else { return }
        if let imageData = try? await selectedItem.loadTransferable(type: Data.self) {
                self.entryImageData = imageData
        } else {
            throw NSError(domain: "ImagePickerError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to load image data."])
        }
    }
    
    func addNewEntry() {
        // ensure these two fields are not empty else return and do not perform anything
        guard !entryText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, let entryDate else {
            errorMessage = "Entry text or date cannot be empty"
            return
        }
        
        let newEntry = JournalEntry(entryText: entryText, entryDate: entryDate, entryImageData: entryImageData, entryRecordingData: nil)
        homeViewModel?.entries.append(newEntry)
    }
}
