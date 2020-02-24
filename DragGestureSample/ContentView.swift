//
//  ContentView.swift
//  DragGestureSample
//
//  Created by MakeItSimple on 2020/02/25.
//  Copyright © 2020 Ju Young Jung. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentPosition: CGSize = .zero
    @State var newPosition: CGSize = .zero
    
    var body: some View {
        Circle()
            .frame(width: 100, height: 100)
            .foregroundColor(Color.red)
            .offset(x: self.currentPosition.width, y: self.currentPosition.height)
        
            .gesture(DragGesture()
                .onChanged { value in
                    self.currentPosition =
                        CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                }
                .onEnded { value in
                    self.currentPosition =
                        CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                    
                    self.newPosition = self.currentPosition
                
                }
            
            )
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
