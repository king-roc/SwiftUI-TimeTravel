//
//  TodoState.swift
//  TimeTravel
//
//  Created by rocking on 2020/2/26.
//  Copyright © 2020 rocking. All rights reserved.
//

import SwiftUI
import Combine

//普通的item
struct TodoItem: Identifiable {
    var id: UUID
    var title: String
    var isFinished: Bool
}

//State的信息
struct TodoState {
    var isCreatingItem: Bool = false
    var partialItemName: String = ""
    var todoItems: [TodoItem] = []
    var stateName: String = "runStart"
}

//
public protocol StateMachine {

    // 定义你APP内可能发生的事情例如：添加一个item 修改item Title
    associatedtype Event

    //储存事件信息
    mutating func update(with event: Event)
}

extension TodoState: StateMachine{
     //事件类型
    enum Event {
            //开始创建item 点击 +
             case startCreatingItem
            //取消创建item 点击 后面蒙版
             case cancelCreatingItem
            //修改 添加 title
             case changePartialItemName(String)
            //点击add
             case addItem
            //点击Toggle 开关
             case setItemDone(identifier: UUID, isDone: Bool)
    }

    mutating func update(with event: TodoState.Event) {

        switch event {
        case .startCreatingItem:
            isCreatingItem = true
            partialItemName = ""
            stateName = "startCreatingItem"
        case .cancelCreatingItem:
            isCreatingItem = false
             stateName = "cancelCreatingItem"
        case .changePartialItemName(let name):
             partialItemName = name
            stateName = "changePartialItemName"
        case .addItem:
            todoItems.append(TodoItem(id: UUID(), title: partialItemName, isFinished: false))
            partialItemName = ""
            isCreatingItem = false
            stateName = "addItem"
        case .setItemDone(identifier: let identifier, isDone: let isDone):
             if let index = todoItems.firstIndex(where: { $0.id == identifier }) {
                           todoItems[index].isFinished = isDone
                stateName = "setItemDone"
            }
        }
    }
    
}
