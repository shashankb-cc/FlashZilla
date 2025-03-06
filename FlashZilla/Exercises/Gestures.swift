
//
//  Gestures.swift
//  FlashZilla
//
//  Created by Shashank B on 06/03/25.
//

import SwiftUI

struct Gestures: View {
    
    //for scaling
//    @State private var currentAmount = 0.0
//      @State private var finalAmount = 1.0
    
    //for rotation
//    @State private var currentAmount = Angle.zero
//       @State private var finalAmount = Angle.zero
    
    //FOR LONG PRESS AND DRAG
    // how far the circle has been dragged
    @State private var offset = CGSize.zero
    
    // whether it is currently being dragged or not
    @State private var isDragging = false
    var body: some View {
        VStack {
//
//            Section {
//                Text("Hello, world!")
//                    .onTapGesture {
//                        print("Tapped")
//                    }
//                Text("Hello, world!")
//                    .onTapGesture(count:5) {
//                        print(" prints after 5 taps Tapped")
//                    }
//                Text("Hello, world!")
//                    .onLongPressGesture {
//                        print("long pressed")
//                    }
//                Text("Hello, World!")
//                    .onLongPressGesture(minimumDuration: 5) {
//                        print("Long pressed! for 5 sec")
//                    }
//                Text("Hello, World!")
//                    .onLongPressGesture(minimumDuration: 1) {
//                        print("Long pressed!")  // Only prints if held for 1 second
//                    } onPressingChanged: { inProgress in
//                        //prints true when hold on pressing , then if i release befoe the min duration false is printed or min duraton passed false is printed
//                        print("In progress: \(inProgress)!")
//                    }
//            }
//            Divider()
//                .frame(height: 10)
//                .overlay {
//                    Rectangle()
//                        .frame(height: 4)
//                }
             
//            Section {
//                Text("Hello world ")
//                    .scaleEffect(currentAmount + finalAmount)
//                    .gesture(
//                        MagnifyGesture()
//                            .onChanged{ value in
//                                currentAmount = value.magnification - 1
//                                print("Scaling: \(currentAmount + finalAmount)")
//
//                            }
//                            .onEnded{ value in
//                                finalAmount += currentAmount
//                                currentAmount = 0
//                                print("Final scale: \(finalAmount)")
//
//                            }
//                    )
//            }
//            Section {
//                Text("Hello world ")
//                    .rotationEffect(currentAmount + finalAmount)
//                    .gesture(
//                        RotationGesture()
//                            .onChanged{ value in
//                                currentAmount = value
//                                print("Scaling: \(currentAmount + finalAmount)")
//
//                            }
//                            .onEnded{ value in
//                                finalAmount += currentAmount
//                                currentAmount = .zero
//                                print("Final scale: \(finalAmount)")
//
//                            }
//                    )
//            }
            
            //gesture collision In this situation SwiftUI will always give the child’s gesture priority, which means when you tap the text view above you’ll see “Text tapped”.
            
            
//            VStack {
//                        Text("Hello, World!")
//                            .onTapGesture {
//                                print("Text tapped")
//                            }
//                    }
//                    .onTapGesture {
//                        print("VStack tapped")
//                    }
            
            //if you want to change that you can use the highPriorityGesture() modifier to force the parent’s gesture to trigger instead, like this:
            
//            VStack {
//                        Text("Hello, World!")
//                            .onTapGesture {
//                                print("Text tapped")
//                            }
//                    }
//                    .highPriorityGesture(
//                        TapGesture()
//                            .onEnded {
//                                print("VStack tapped")
//                            }
//                    )

            
            //Alternatively, you can use the simultaneousGesture() modifier to tell SwiftUI you want both the parent and child gestures to trigger at the same time, like this:
            
//            VStack {
//                       Text("Hello, World!")
//                           .onTapGesture {
//                               print("Text tapped")
//                           }
//                   }
//                   .simultaneousGesture(
//                       TapGesture()
//                           .onEnded {
//                               print("VStack tapped")
//                           }
//                   )
            
            //sequencing of gesture fir example something longpressed and DRAG
            
            // a drag gesture that updates offset and isDragging as it moves around

            let dragGesture = DragGesture()
                .onChanged {
                    value in offset = value.translation
                }
                .onEnded{ _ in
                    withAnimation {
                        offset = .zero
                        isDragging = false
                    }
                }
            // a long press gesture that enables isDragging
            let pressGesture = LongPressGesture()
                .onEnded { value in
                    withAnimation {
                        isDragging = true
                    }
                }
            // a combined gesture that forces the user to long press then drag
            let combined = pressGesture.sequenced(before: dragGesture)
            
            // a 64x64 circle that scales up when it's dragged, sets its offset to whatever we had back from the drag gesture, and uses our combined gesture
                   Circle()
                       .fill(.red)
                       .frame(width: 64, height: 64)
                       .scaleEffect(isDragging ? 1.5 : 1)
                       .offset(offset)
                       .gesture(combined)
        }
    }
}

#Preview {
    Gestures()
}
