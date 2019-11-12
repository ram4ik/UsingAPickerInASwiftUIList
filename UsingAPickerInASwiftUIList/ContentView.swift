//
//  ContentView.swift
//  UsingAPickerInASwiftUIList
//
//  Created by ramil on 12.11.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var colours = ["red", "orange", "yellow", "green", "blue"]
    @State private var selection = 4
    @State private var pickerVisible = false
    @State private var count = 0
    
    var body: some View {
        VStack {
            Text("Picker Tutorial")
                .font(.largeTitle)
                .foregroundColor(.gray)
            List {
                HStack {
                    Text("Colour")
                    Spacer()
                    Button(colours[selection]) {
                        if self.pickerVisible {
                            self.count += 1
                        }
                        self.pickerVisible.toggle()
                    }
                    .foregroundColor(self.pickerVisible ? .red : .blue)
                }
                
                if pickerVisible {
                    HStack {
                        Spacer()
                        Picker(selection: $selection, label: Text("")) {
                            ForEach(0..<colours.count) {
                                Text(self.colours[$0]).foregroundColor(.secondary)
                            }
                        }
                        .onTapGesture {
                            self.count += 1
                            self.pickerVisible.toggle()
                        }
                        Spacer()
                    }
                }
                
                HStack {
                    Text("Number of selections")
                    Spacer()
                    Text("\(count)")
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
