//
//  ItemsView.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

struct ItemsView: View {
    
    @StateObject private var viewModel = ItemsViewModel()
    
    @ObservedObject var itemsArray: ItemsArray
    
    @State var collection: String
    @State var search = ""
    @State private var isSearchShow = false
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                withAnimation {
                isSearchShow = true
                }
            }, label: {
                Image(systemName: "magnifyingglass")
            })
            if isSearchShow {
            TextField("Search item", text: $search)
            Spacer()
                Button(action: {
                    withAnimation {
                    isSearchShow = false
                    }
                }, label: {
                    Image(systemName: "xmark")
                })
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 20)
        .padding()
        .background(isSearchShow ? Color.grayColor : Color.clear)
        
        if itemsArray.itemsArray.count > 0 {
            VStack {
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: [.init(.flexible(), spacing: 20), .init(.flexible())], spacing: 20, content: {
                        ForEach((itemsArray.itemsArray)
                                    .filter({ "\($0)".contains(search) || search.isEmpty}), id: \.self) { item in
                            SingleItemView(item: item)
                        }
                    })
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationTitle("\(collection)")
            .accentColor(.primary)
        }
        else {
            Spacer()
            VStack {
                Text("Collection is empty!")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.appColor)
                    .padding(.bottom)
                Text("Add first item to this collection")
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationTitle("\(collection)")
            .accentColor(.primary)
        }
        Spacer()
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemsView(itemsArray: ItemsArray(collection: "Clothes"), collection: "Clothes")
        }
    }
}
