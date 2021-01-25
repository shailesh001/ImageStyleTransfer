//
//  Utils.swift
//  ImageStyleTransfer
//
//  Created by Shailesh Patel on 25/01/2021.
//

import UIKit
import CoreML

extension MLMultiArray {
    convenience init(size: Int, selecting selectedIndex: Int) {
        do {
            try self.init(shape: [size] as [NSNumber], dataType: MLMultiArrayDataType.double)
        } catch {
            fatalError("Could initialise MLMultiArray for MLModel options")
        }
        
        for index in 0..<size {
            self[index] = (index == selectedIndex) ? 1.0 : 0.0
        }
    }
}

extension CVPixelBufferLockFlags {
    static let readAndWrite = CVPixelBufferLockFlags(rawValue: 0)
}

extension CVPixelBuffer {
    var width: Int {
        return CVPixelBufferGetWidth(self)
    }
    
    var height: Int {
        return CVPixelBufferGetHeight(self)
    }
    
    var bytesPerRow: Int {
        return CVPixelBufferGetBytesPerRow(self)
    }
    
    var baseAddress: UnsafeMutableRawPointer? {
        return CVPixelBufferGetBaseAddress(self)
    }
 
    func perform<T>(permission: CVPixelBufferLockFlags, action: () -> (T?)) -> T? {
        CVPixelBufferLockBaseAddress(self, permission)
        
        let output = action()
        
        CVPixelBufferUnlockBaseAddress(self, permission)
        
        return output
    }
}
