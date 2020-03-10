//
//  TodoListItem.swift
//  TimeTravel
//
//  Created by rocking on 2020/2/27.
//  Copyright © 2020 rocking. All rights reserved.
//

import SwiftUI

struct TodoListItem: View {

    @EnvironmentObject var store: Store

    let item: TodoItem

    var body: some View {
        let binding = Binding(get: {
            return self.item.isFinished
        }, set: {
            self.store.dispatch(event: .setItemDone(identifier: self.item.id, isDone: $0))
        })
        return Toggle(isOn: binding) {
            Text(item.title)
        }
    }
}

#if DEBUG
struct TodoListItem_Previews: PreviewProvider {
    static var previews: some View {
        TodoListItem(item: TodoItem(id: UUID(), title: "text", isFinished: false))
    }
}
#endif
