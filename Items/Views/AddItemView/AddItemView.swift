//
//  AddItemView.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

struct AddItemView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var name = ""
    @State var store = ""
    @State var tag = ""
    @State var collection = "collection"
    
    @State private var showCollections = false
    
    
    var collections = ["tech", "clothes", "home"]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Create new item you want to track")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                HStack {
                    Button(action: {
                        
                    }, label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 140, height: 140)
                                .foregroundColor(.mainColor)
                            
                            Image(systemName: "photo.fill")
                                .foregroundColor(.secondaryColor)
                                .font(.system(size: 60))
                        }
                    })
                    
                    
                    Spacer()
                    
                    VStack(spacing: 20) {
                        HStack { //scribble.variable
                            Image(systemName: "scribble.variable")
                            TextField("name", text: $name)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                        }
                        HStack {
                            Image(systemName: "shippingbox.fill")
                            TextField("store", text: $store)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                        }
                        HStack {
                            Image(systemName: "tag.fill")
                                .font(.system(size: 15))
                            TextField("tag", text: $tag)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                        }
                        
                        HStack {
                            Image(systemName: "doc.fill")
                            Menu  {
                                ForEach(collections, id: \.self) { coll in
                                    Button(action: {
                                        self.collection = coll
                                    }, label: {
                                        Text("\(coll)")
                                    })
                                }
                            } label: {
                                
                                Text("\(collection)")
                                Spacer()
                            }     .accentColor(collection != "collection" ? .primary : Color(.systemGray3))
                        }
                    }
                    .padding()
                }
                .padding()
                .frame(height: 200)
                .background(Color.grayColor)
            }
            
            Button(action: {
                
            }, label: {
                HStack {
                    Image(systemName: "plus.square.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.clear)
                    Spacer()
                    Text("Create")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "plus.square.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                    
                }
                .padding()
                .frame(height: 60)
            })
            .frame(maxWidth: .infinity)
            .background(Color.appColor)
            .accentColor(.primary)
            .padding(.vertical)
            .opacity(check() ? 1.0 : 0.3)
            
            Spacer()
        }
        .padding()
        .navigationTitle("New Item")
        .navigationBarItems(leading:
                                Button(action: {
                                    self.presentationMode.wrappedValue.dismiss()
                                }, label: {
                                    Image(systemName: "xmark")
                                        .foregroundColor(.primary)
                                }))
    }
    
    func check() -> Bool {
        if !name.isEmpty, !store.isEmpty, !tag.isEmpty, !collection.isEmpty {
            return true
        }
        else {
            return false
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddItemView()
                .preferredColorScheme(.dark)
        }
    }
}
