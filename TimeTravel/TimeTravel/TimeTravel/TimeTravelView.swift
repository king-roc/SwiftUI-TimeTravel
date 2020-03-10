//
//  TimeTravelView.swift
//  TimeTravel
//
//  Created by rocking on 2020/2/27.
//  Copyright © 2020 rocking. All rights reserved.
//

import SwiftUI

struct TimeTravelView<Content>: View where Content: View{

    let initialState: TodoState

    private let content: Content

    @State var store: Store? = nil

    public init(initialState:TodoState ,content: () -> Content){
        self.initialState = initialState
        self.content = content()
    }

    var body: some View {
        let store = self.store ?? Store(state: initialState)
        if (self.store == nil) {
            self.store = store
        }
        return VStack{
            content
            TimeTravelBarView()
        }.environmentObject(store)
    }
}

#if DEBUG
struct TimeTravelView_Previews: PreviewProvider {
    static var previews: some View {
        TimeTravelView(initialState: TodoState()) {
                TodoList()
        }
    }
}
#endif
