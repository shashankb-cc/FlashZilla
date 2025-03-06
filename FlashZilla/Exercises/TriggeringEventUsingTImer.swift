//
//  TriggeringEventUsingTImer.swift
//  FlashZilla
//
//  Created by Shashank B on 06/03/25.
//

import SwiftUI

struct TriggeringEventUsingTImer: View {
    //    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    
    @Environment(\.scenePhase) var scenePhase
    
    
    var body: some View {
        Text("Hello, World!")
            .onReceive(timer) { time in
                if counter == 5 {
                    timer.upstream.connect().cancel()
                } else {
                    print("The time is now \(time)")
                }
                
                counter += 1
            }
        Button("Stop") {
            timer.upstream.connect().cancel()
        }
        
        Text("Hello, world!")
                   .onChange(of: scenePhase) { oldPhase, newPhase in
                       if newPhase == .active {
                           print("Active")
                       } else if newPhase == .inactive {
                           print("Inactive")
                       } else if newPhase == .background {
                           print("Background")
                       }
                   }
    }
}

#Preview {
    TriggeringEventUsingTImer()
}
