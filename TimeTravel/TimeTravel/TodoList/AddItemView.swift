//
//  AddItemView.swift
//  TimeTravel
//
//  Created by rocking on 2020/2/27.
//  Copyright © 2020 rocking. All rights reserved.
//

import SwiftUI

struct AddItemView: View {

    @EnvironmentObject var store: Store

    var body: some View {
        let binding = Binding(get: {
            self.store.state.partialItemName
        }, set: {
            self.store.dispatch(event: .changePartialItemName($0))
        })
        return VStack{
            TextField("Title", text: binding)
            Button(action: {
                self.store.dispatch(event: .addItem)
            }) {
                HStack{
                    Spacer()
                    Text("Add")
                    Spacer()
                }
            }
            .background(Color.accentColor)
            .disabled(store.state.partialItemName.isEmpty)
            .foregroundColor(.white)
            .cornerRadius(8.0)
        }
        .padding()
    }
}

#if DEBUG
struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
#endif
