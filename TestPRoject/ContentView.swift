//
//  ContentView.swift
//  TestPRoject
//
//  Created by William Kaiser on 10/25/23.
//

import SwiftUI

var recordVideo: RecordVideo?

struct ContentView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        
        Button("Shitty Shity"){
            recordVideo = RecordVideo()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
