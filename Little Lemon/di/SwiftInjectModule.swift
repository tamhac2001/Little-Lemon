//
//  SwiftInjectModule.swift
//  Little Lemon
//
//  Created by Tam Hac on 01/03/2024.
//

import Foundation
import SwiftData
import Swinject

class SwiftInjectModule {
    static let shared: SwiftInjectModule = {
        let instance = SwiftInjectModule()
        return instance
    }()

    private var container = Container()

    func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }

    func injectModules(modelContext: ModelContext) {
        injectUser(modelContext: modelContext)
        injectHome(modelContext: modelContext)
        injectSetting(modelContext: modelContext)
        injectViewModels()
    }

    private func injectHome(modelContext: ModelContext) {
        container.register(MenuItemApi.self) { _ in
            MenuItemApiImpl()
        }.inObjectScope(.container)

        container.register(MenuItemDataStore.self) { _ in
            MenuItemDataStore(modelContext: modelContext)
        }

        container.register(MenuItemRepository.self) { resolver in
            MenuItemRepositoryImpl(menuItemDataStore: resolver.resolve(MenuItemDataStore.self)!, menuItemApi: resolver.resolve(MenuItemApi.self)!)
        }

        container.register(GetMenuItemUseCase.self) { resolver in
            GetMenuItemUseCase(menuItemRepository: resolver.resolve(MenuItemRepository.self)!)
        }
    }

    private func injectSetting(modelContext: ModelContext) {
        container.register(SettingDatastore.self) { _ in
            SettingDatastore(context: modelContext)
        }
        container.register(SettingRepository.self) { resolver in
            SettingRepositoryImpl(datastore: resolver.resolve(SettingDatastore.self)!)
        }
        container.register(GetSettingUseCase.self) { resolver in
            GetSettingUseCase(settingRepository: resolver.resolve(SettingRepository.self)!)
        }
        container.register(SaveSettingUseCase.self) { resolver in
            SaveSettingUseCase(settingRepositor: resolver.resolve(SettingRepository.self)!)
        }
        container.register(DeleteSettingUseCase.self) { resolver in
            DeleteSettingUseCase(settingRepository: resolver.resolve(SettingRepository.self)!)
        }
    }

    private func injectUser(modelContext: ModelContext) {
        container.register(UserDatastore.self) { _ in
            UserDatastore(context: modelContext)
        }

        container.register(UserRepository.self) { resolver in
            UserRepositoryImpl(userDatastore: resolver.resolve(UserDatastore.self)!)
        }

        container.register(GetUserUseCase.self) { resolver in
            GetUserUseCase(userRepository: resolver.resolve(UserRepository.self)!)
        }

        container.register(SaveUserUseCase.self) { resolver in
            SaveUserUseCase(userRepository: resolver.resolve(UserRepository.self)!)
        }
        container.register(DeleteUserUseCase.self) { resolver in
            DeleteUserUseCase(userRepository: resolver.resolve(UserRepository.self)!)
        }
    }

    private func injectViewModels() {
        container.register(OnboardingViewModel.self) { resolver in
            OnboardingViewModel(saveUserUseCase: resolver.resolve(SaveUserUseCase.self)!)
        }
        container.register(HomeViewModel.self) { resolver in
            HomeViewModel(getUserUseCase: resolver.resolve(GetUserUseCase.self)!, getMenuItemUseCase: resolver.resolve(GetMenuItemUseCase.self)!)
        }
        container.register(SettingScreenViewModel.self) { resolver in
            SettingScreenViewModel(getUserUseCase: resolver.resolve(GetUserUseCase.self)!, saveUserUseCase: resolver.resolve(SaveUserUseCase.self)!, deleteUserUseCase: resolver.resolve(DeleteUserUseCase.self)!, getSettingUseCase: resolver.resolve(GetSettingUseCase.self)!, saveSettingUseCase: resolver.resolve(SaveSettingUseCase.self)!, deleteSettingUseCase: resolver.resolve(DeleteSettingUseCase.self)!)
        }
    }
}
