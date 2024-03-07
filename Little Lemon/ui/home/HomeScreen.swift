//
//  HomeScreen.swift
//  Little Lemon
//
//  Created by Tam Hac on 26/02/2024.
//

import SwiftUI

struct HomeScreen: View {
    @Environment(\.modelContext) private var modelContext
    @State private var viewModel = SwiftInjectModule.shared.resolve(HomeViewModel.self)

    var body: some View {
        NavigationSplitView {
            ScrollView {
                VStack(alignment: .leading) {
                    HeaderSection(searchQuery: $viewModel.uiState.searchQuery)
                    VStack(alignment: .leading) {
                        Text("ORDER FOR DELIVERY!").font(.headline)
                        HStack {
                            Spacer()
                            ForEach(MenuCategory.allCases, id: \.self) { category in
                                Toggle(isOn: .init(get: {
                                    viewModel.uiState.selectedMenuCategory.contains(category)
                                }, set: { included in
                                    if included {
                                        viewModel.uiState.selectedMenuCategory.append(category)
                                    } else {
                                        if let index = viewModel.uiState.selectedMenuCategory.firstIndex(of: category) {
                                            viewModel.uiState.selectedMenuCategory.remove(at: index)
                                        }
                                    }
                                })) {
                                    Text(category.rawValue.capitalized)
                                }.toggleStyle(.button)
                                Spacer()
                            }
                        }
                    }.padding()
                    ForEach(viewModel.uiState.menuItems.filter { menuItem in
                        let inCategory = viewModel.uiState.selectedMenuCategory.contains(menuItem.category)
                        let inSearchQuery = viewModel.uiState.searchQuery.isEmpty ? true : menuItem.title.localizedCaseInsensitiveContains(viewModel.uiState.searchQuery)
                        return inCategory && inSearchQuery

                    }) { menuItem in
                        Divider().padding(.horizontal)
                        HStack(alignment: .bottom) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(menuItem.title).font(.system(size: 18, weight: .bold))
                                Text(menuItem.description).lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                                Text(menuItem.price.formatted(.currency(code: "USD"))).foregroundStyle(Color.mineralGreen).fontWeight(.bold)
                            }
                            Spacer()
                            AsyncImage(url: URL(string: menuItem.image)) { image in
                                image.resizable().aspectRatio(contentMode: .fit)
                            } placeholder: {
                                ProgressView()
                            }.frame(width: 80, height: 80)
                        }.padding()
                    }
                }.toolbar {
                    let data = viewModel.uiState.avatar
                    ToolbarItem(placement: .principal) {
                        Image(.littleLemon).resizable().aspectRatio(contentMode: .fit).frame(height: 40)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: SettingScreen()) {
                            if data != nil {
                                if let avatarImage = UIImage(data: data!) {
                                    Image(uiImage: avatarImage).resizable().aspectRatio(contentMode: .fill).frame(width: 42, height: 42).clipShape(Circle())
                                }
                            } else {
                                Image(systemName: "person.circle").font(.system(size: 32))
                            }

                        }.foregroundStyle(Color.black)
                    }
                }
                .task {
                    viewModel.updateUi()
                }
            }
        } detail: {
            EmptyView()
        }
    }
}

#Preview {
    HomeScreen()
}

struct SearchTextField: View {
    @Binding var searchQuery: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass").padding()
            TextField("", text: $searchQuery)
        }.frame(height: 40).background(Color.white).clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
