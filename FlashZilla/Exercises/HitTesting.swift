//
//  HitTesting.swift
//  FlashZilla
//
//  Created by Shashank B on 06/03/25.
//

import SwiftUI

struct HitTesting: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Rectangle tapped!")
                }

            Circle()
                .fill(.red)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Circle tapped!")
                }
            
            //allowsHitTesting() modifier. When this is attached to a view with its parameter set to false, the view isn’t even considered tappable. That doesn’t mean it’s inert, though, just that it doesn’t catch any taps – things behind the view will get tapped instead.
                .allowsHitTesting(false)
        }
        
        VStack {
            Text("Hello")
            Spacer().frame(height: 100)
            Text("World")
        }
        //Where the contentShape() modifier really becomes useful is when you tap actions attached to stacks with spacers, because by default SwiftUI won’t trigger actions when a stack spacer is tapped.
        .contentShape(.rect)

        .onTapGesture {
            print("VStack tapped!")
        }
    }
}

#Preview {
    HitTesting()
}
