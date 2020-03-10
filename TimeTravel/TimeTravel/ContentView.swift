//
//  ContentView.swift
//  TimeTravel
//
//  Created by rocking on 2020/2/26.
//  Copyright © 2020 rocking. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TimeTravelView(initialState: TodoState()) {
            TodoList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
