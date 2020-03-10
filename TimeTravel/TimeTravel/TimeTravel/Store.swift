//
//  Store.swift
//  TimeTravel
//
//  Created by rocking on 2020/2/26.
//  Copyright © 2020 rocking. All rights reserved.
//
import SwiftUI
import Combine

//观察对象
public final class Store: ObservableObject {
    //初始State
    private let initialState: TodoState
    //储存TodoState
    private var subsequentStates: [TodoState] = []
    //Publisher 发布者 发布状态改变
    public let objectWillChange = PassthroughSubject<Void, Never>()


    init(state: TodoState) {
        initialState = state
    }

    var allStates: [TodoState] {
        [[initialState], subsequentStates].flatMap({ $0 })
    }
    //需要加上初始状态
    var stateCount: Int {
        1 + subsequentStates.count
    }

    var allStatesName : String {
        var  allStatesName = ""
        allStates.forEach { todoState in
            if todoState.stateName != ""{
                allStatesName += todoState.stateName + "\n"
            }
        }
        return allStatesName
    }
    //当前state需要改变时 发布change
    var currentStateIndex: Int = 0 {
        didSet {
            withAnimation {
                objectWillChange.send(())
            }
        }
    }

        var state: TodoState {
           allStates[currentStateIndex]
       }
    
    // 添加事件
        func dispatch(event: TodoState.Event) {
           var newState = state
           newState.update(with: event)
           subsequentStates.append(newState)
           currentStateIndex = stateCount - 1
       }

}
