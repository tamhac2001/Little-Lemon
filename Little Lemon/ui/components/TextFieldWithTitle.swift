//
//  TextFieldWithTitle.swift
//  Little Lemon
//
//  Created by Tam Hac on 28/02/2024.
//

import SwiftUI

struct TextFieldWithTitle: View {
    let title: String
    let placeHolder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title).font(.headline)
            TextField(placeHolder, text: $text).textFieldStyle(.roundedBorder)
        }
    }
}

#Preview {
    TextFieldWithTitle(title: "Email", placeHolder: "Enter email", text: .constant(""))
}
