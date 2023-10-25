//
//  Shit.swift
//  TestPRoject
//
//  Created by William Kaiser on 10/25/23.
//

import Foundation
import AVFoundation
import CoreMedia

class RecordVideo: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate {
    override init(){
        super.init()
        // finds the front camera
        let discovery = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera, .externalUnknown], mediaType: AVMediaType.video, position: .unspecified)
        
        // get the front camera
        print(discovery.devices)
        let camera = discovery.devices.first { device in
            device.manufacturer == "Apple Inc."
        }!
        
        // capture session
        let captureSession = AVCaptureSession()
        
        let captureSessionInput = try! AVCaptureDeviceInput(device: camera)
        captureSession.addInput(captureSessionInput)
        
        let videoDataOutput = AVCaptureVideoDataOutput()
        captureSession.addOutput(videoDataOutput)
        videoDataOutput.videoSettings = [
            kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange
        ]
        videoDataOutput.setSampleBufferDelegate(self, queue: .global(qos: .userInitiated))
        videoDataOutput.alwaysDiscardsLateVideoFrames = true
        
        captureSession.startRunning()
    }
    
    func captureOutput(_ output: AVCaptureOutput, didDrop sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
            print("Captured output\(sampleBuffer)")
    }

    
}
