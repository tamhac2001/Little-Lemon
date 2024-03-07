//
//  SettingScreen.swift
//  Little Lemon
//
//  Created by Tam Hac on 04/03/2024.
//

import PhotosUI
import SwiftUI

struct SettingScreen: View {
    @Namespace var bottomID

    @State private var viewModel = SwiftInjectModule.shared.resolve(SettingScreenViewModel.self)

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(alignment: .leading) {
                    Section {
                        Text("Avatar").font(.caption)
                        HStack {
                            Spacer()
                            let data = viewModel.uiState.user.avatar
                            if data != nil {
                                if let avatarImage = UIImage(data: data!) {
                                    Image(uiImage: avatarImage).resizable().aspectRatio(contentMode: .fill).frame(width: 100, height: 100).clipShape(Circle()).overlay(alignment: .bottomTrailing) {
                                        PhotosPicker(selection: .init(get: {
                                            nil
                                        }, set: { photoPickerItem in
                                            viewModel.onPhotoPicked(pickedPhoto: photoPickerItem)
                                        }), matching: .images) {
                                            Image(systemName: "pencil.circle.fill").font(.system(size: 30))
                                        }
                                    }
                                }
                            } else {
                                Image(systemName: "person.circle").font(.system(size: 80)).overlay(alignment: .bottomTrailing) {
                                    PhotosPicker(selection: .init(get: {
                                        nil
                                    }, set: { photoPickerItem in
                                        viewModel.onPhotoPicked(pickedPhoto: photoPickerItem)
                                    }), matching: .images) {
                                        Image(systemName: "pencil.circle.fill").font(.system(size: 30))
                                    }
                                }
                            }
                            Spacer()
                        }.padding(.vertical)

                        TextFieldWithTitle(title: "First name", placeHolder: "Enter first name", text: $viewModel.uiState.user.firstName)
                        TextFieldWithTitle(title: "Last name", placeHolder: "Enter last name", text: $viewModel.uiState.user.lastName)
                        TextFieldWithTitle(title: "Email", placeHolder: "Enter email", text: $viewModel.uiState.user.email).keyboardType(.emailAddress)
                        TextFieldWithTitle(title: "Phone number", placeHolder: "Enter phone number", text: $viewModel.uiState.user.phoneNumber).keyboardType(.phonePad)

                    } header: {
                        Text("Personal information").font(.title3).fontWeight(.bold).padding(.vertical)
                    }

                    Section {
                        ForEach(EmailNotification.allCases, id: \.self) { emailNotification in
                            Toggle(emailNotification.rawValue, isOn: .init(get: {
                                viewModel.uiState.setting.emailNotifications.contains(emailNotification)
                            }, set: { checked in
                                if checked {
                                    viewModel.uiState.setting.emailNotifications.insert(emailNotification)
                                } else {
                                    viewModel.uiState.setting.emailNotifications.remove(emailNotification)
                                }
                            }))
                        }
                    } header: {
                        Text("Email notifications").font(.title3).fontWeight(.bold).padding(.vertical)
                    }
                    Button {
                        viewModel.logout()
                    } label: {
                        Spacer()
                        Text("Log out")
                        Spacer()
                    }.buttonStyle(.borderedProminent).foregroundStyle(Color.black).tint(Color.brightGold)
                    if viewModel.uiStateModified() {
                        HStack {
                            Spacer()
                            Button("Discard changes") {
                                viewModel.discardChanges()
                            }.foregroundStyle(Color.mineralGreen).tint(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1).foregroundStyle(Color.mineralGreen)
                                )
                            Spacer()
                            Button("Save changes") {
                                viewModel.saveChanges()
                            }.buttonStyle(.borderedProminent).foregroundStyle(Color.white).tint(Color.mineralGreen)
                            Spacer()
                        }.padding()
                            .id(bottomID)
                            .onAppear(perform: {
                                withAnimation {
                                    proxy.scrollTo(bottomID)
                                }
                            }).buttonStyle(.bordered)
                    }
                }
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image(.littleLemon).resizable().aspectRatio(contentMode: .fit).frame(height: 40)
                }
            }.navigationBarTitleDisplayMode(.inline)
        }.onAppear {
            viewModel.updateUi()
        }
    }
}

#Preview {
    SettingScreen()
}
