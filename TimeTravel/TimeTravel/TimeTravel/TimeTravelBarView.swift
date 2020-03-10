//
//  TimeTravelBarView.swift
//  TimeTravel
//
//  Created by rocking on 2020/2/26.
//  Copyright © 2020 rocking. All rights reserved.
//

import SwiftUI

struct TimeTravelBarView: View {
    //全局的store
    @EnvironmentObject var store: Store

    var body: some View {
        // 用Slider手动修改状态
        let indexBinding = Binding(
        get: {
           return Double(self.store.currentStateIndex)
        }, set: {
            self.store.currentStateIndex = Int($0)
        })

        return VStack(alignment: .leading,spacing: 15){

                HStack(alignment: .firstTextBaseline){
                    Text("allStates：").foregroundColor(.red)
                    Text(self.store.allStatesName).foregroundColor(.blue)
                }
                HStack(){
                    Text("currentState：").foregroundColor(.red)
                    Text(self.store.state.stateName).foregroundColor(.green)
                }
                   Slider(value: indexBinding, in: 0...Double(store.stateCount - 1))
                   .background(Color.white)
                   .frame(height: 44.0, alignment:.bottom)
                   .padding()
        }.padding()
    }
}

#if DEBUG
struct TimeTravelBarView_Previews: PreviewProvider {
    static var previews: some View {
        TimeTravelBarView()
    }
}
#endif
