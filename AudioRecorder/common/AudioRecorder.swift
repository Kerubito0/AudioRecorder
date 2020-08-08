//
//  AudioRecorder.swift
//  AudioRecorder
//

import AVFoundation

class AudioRecorder {
    
    private var audioRecorder: AVAudioRecorder!
    internal var audioPlayer: AVAudioPlayer!
    
    internal func record() {
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord)
        try! session.setActive(true)
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 44100,
            AVNumberOfChannelsKey: 2,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        audioRecorder = try! AVAudioRecorder(url: getURL(), settings: settings)
        audioRecorder.record()
    }
    
    internal func recordStop() -> Data?{
        audioRecorder.stop()
        let data   = try? Data(contentsOf: getURL())
        return data
    }
    
    internal func play() {
        audioPlayer = try! AVAudioPlayer(contentsOf: getURL())
        audioPlayer.volume = 10.0
        audioPlayer.play()
    }
    
    internal func playStop() {
        audioPlayer.stop()
    }
    
    private func getURL() -> URL{
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("sound.m4a")
    }
}
