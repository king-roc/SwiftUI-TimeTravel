//
//  ModalDimmingView.swift
//  TimeTravel
//
//  Created by rocking on 2020/2/27.
//  Copyright © 2020 rocking. All rights reserved.
//

import SwiftUI

struct ModalDimmingView: View {
    @EnvironmentObject var store: Store

    var body: some View {
        Color.black
            .opacity(0.3)
            .edgesIgnoringSafeArea([.bottom, .top])
            .transition(.opacity)
            .onTapGesture {
                self.store.dispatch(event: .cancelCreatingItem)
        }
    }
}

#if DEBUG
struct ModalDimmingView_Previews: PreviewProvider {
    static var previews: some View {
        ModalDimmingView()
    }
}
#endif
