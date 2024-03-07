//
//  SettingScreenViewModel.swift
//  Little Lemon
//
//  Created by Tam Hac on 04/03/2024.
//

import Foundation
import PhotosUI
import SwiftUI

@Observable
class SettingScreenViewModel {
    private let getUserUseCase: GetUserUseCase
    private let saveUserUseCase: SaveUserUseCase
    private let deleteUserUseCase: DeleteUserUseCase
    private let getSettingUseCase: GetSettingUseCase
    private let saveSettingUseCase: SaveSettingUseCase
    private let deleteSettingUseCase: DeleteSettingUseCase
    
    private var initialUiState: SettingScreenUiState
    var uiState: SettingScreenUiState
    
    init(getUserUseCase: GetUserUseCase, saveUserUseCase: SaveUserUseCase, deleteUserUseCase: DeleteUserUseCase, getSettingUseCase: GetSettingUseCase, saveSettingUseCase: SaveSettingUseCase, deleteSettingUseCase: DeleteSettingUseCase) {
        self.getUserUseCase = getUserUseCase
        self.saveUserUseCase = saveUserUseCase
        self.deleteUserUseCase = deleteUserUseCase
        self.getSettingUseCase = getSettingUseCase
        self.saveSettingUseCase = saveSettingUseCase
        self.deleteSettingUseCase = deleteSettingUseCase
        self.initialUiState = SettingScreenUiState()
        self.uiState = SettingScreenUiState()
    }
    
    func onPhotoPicked(pickedPhoto: PhotosPickerItem?) {
        Task {
            if let data = try await pickedPhoto?.loadTransferable(type: Data.self) {
                uiState.user.avatar = data
            }
        }
    }
    
    func updateUi() {
        updateUser()
        updateSetting()
    }
    
    func uiStateModified() -> Bool {
        return uiState != initialUiState
    }
    
    func discardChanges() {
        uiState = initialUiState
    }
    
    func saveChanges() {
        saveUserUseCase.invoke(uiState.user)
        saveSettingUseCase.invoke(uiState.setting)
        updateUi()
    }
    
    func logout() {
        deleteUserUseCase.invoke()
        deleteSettingUseCase.invoke()
    }
    
    private func updateUser() {
        let userResult = getUserUseCase.invoke()
        switch userResult {
        case .success(let user):
            initialUiState.user = user
            uiState.user = user
        case .failure(let failure):
            debugPrint(failure)
        }
    }
    
    private func updateSetting() {
        let settingResult = getSettingUseCase.invoke()
        switch settingResult {
        case .success(let setting):
            initialUiState.setting = setting
            uiState.setting = setting
        case .failure(let failure):
            print(failure)
        }
    }
    
    private func getUiImageFromLocalIdentifier(_ localIdentifier: String) -> UIImage? {
        guard let imageAsset = PHAsset.fetchAssets(withLocalIdentifiers: [localIdentifier], options: nil).firstObject else {
            return nil
        }
        let phImageManager = PHImageManager.default()
        var uiImage: UIImage?
        phImageManager.requestImage(for: imageAsset, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFit, options: nil) { image, _ in
            uiImage = image
        }
        return uiImage
    }
}
