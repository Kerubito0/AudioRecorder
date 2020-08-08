//
//  ContentView.swift
//  AudioRecorder
//
//  Created by kerubito on 2020/08/06.
//  Copyright © 2020 kerubito. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let audioRecorder: AudioRecorder = AudioRecorder()
    @State var isRecording = false
    var body: some View {
        VStack {
            Button("録音開始") {
                self.audioRecorder.record()
            }
            .padding(.bottom, 10.0)
            Button("録音停止") {
                _ = self.audioRecorder.recordStop()
            }
            .padding(.bottom, 10.0)
            Button("再生開始") {
                self.audioRecorder.play()
            }
            .padding(.bottom, 10.0)
            Button("再生停止") {
                self.audioRecorder.playStop()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
