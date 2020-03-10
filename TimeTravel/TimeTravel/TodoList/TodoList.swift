//
//  TodoList.swift
//  TimeTravel
//
//  Created by rocking on 2020/2/27.
//  Copyright © 2020 rocking. All rights reserved.
//

import SwiftUI

struct TodoList: View {

    @EnvironmentObject var store: Store
    
    var body: some View {
        ZStack{
            NavigationView{
                List(store.state.todoItems){item in
                    TodoListItem(item: item)
                }.navigationBarTitle(Text("TimeTrave"))
                    .navigationBarItems(trailing: Button(action: {
                        self.store.dispatch(event: .startCreatingItem)
                    }, label: {
                        Image(systemName: "plus.circle")
                    }))
            }
            if store.state.isCreatingItem {
                ModalDimmingView()
                    VStack{
                    Spacer()
                    AddItemView()
                    .background(Color.white)
                    .cornerRadius(12.0)
                    .shadow(radius: 16.0)
                    .padding()
                    Spacer()
                    }
                .transition(.move(edge: .bottom))
            }
        }
    }
}

struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        TodoList()
    }
}
