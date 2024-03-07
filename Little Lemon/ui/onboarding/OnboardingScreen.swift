//
//  OnboardingScreen.swift
//  Little Lemon
//
//  Created by Tam Hac on 26/02/2024.
//

import SwiftData
import SwiftUI

struct OnboardingScreen: View {
    @State private var viewModel = SwiftInjectModule.shared.resolve(OnboardingViewModel.self)

    var body: some View {
        VStack {
            Image(.littleLemonLogo).resizable().aspectRatio(contentMode: .fit).frame(height: 128)
            Spacer().frame(height: 64)
            VStack(alignment: .leading, spacing: 20) {
                TextFieldWithTitle(title: "First name", placeHolder: "Enter first name", text: $viewModel.uiState.firstName)
                TextFieldWithTitle(title: "Last name", placeHolder: "Enter last name", text: $viewModel.uiState.lastName)
                TextFieldWithTitle(title: "Email", placeHolder: "Enter email", text: $viewModel.uiState.email).keyboardType(.emailAddress)
            }
            Spacer()
            Button {
                viewModel.register()
            } label: {
                Spacer()
                Text("Register")
                Spacer()
            }.buttonStyle(.borderedProminent).disabled(!viewModel.uiState.isFormValid)
        }.padding()
    }
}

#Preview {
    OnboardingScreen()
}
