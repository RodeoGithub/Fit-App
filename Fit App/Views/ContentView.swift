//
//  ContentView.swift
//  Fit App
//
//  Created by Rodrigo Maidana on 11/03/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoaded = false
    @State var remaining = 0.75
    @State var timer = Timer.publish(every: 0.01, on: .current, in: .common).autoconnect()
    var body: some View {
        ZStack{
            MainView()
            if !isLoaded {
                WelcomeView()
                    .edgesIgnoringSafeArea(.all)
                    .transition(.scale)
            }
        }.edgesIgnoringSafeArea(.all)
        .onReceive(timer) { _ in
            self.remaining -= 0.01
            if self.remaining <= 0 {
                timer.upstream.connect().cancel()
                withAnimation{
                    self.isLoaded.toggle()
                }
            }
        }
    }
}

struct WelcomeView: View {
    var body: some View {
        ZStack(alignment: .center){
            LinearGradient(gradient:
                            Gradient(colors: [Color(K.Colors.startColor), Color(K.Colors.endColor)]), startPoint: .top, endPoint: .bottom)
            Image("logo")
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
