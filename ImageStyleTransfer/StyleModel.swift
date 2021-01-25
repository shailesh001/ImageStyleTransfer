//
//  StyleModel.swift
//  ImageStyleTransfer
//
//  Created by Shailesh Patel on 25/01/2021.
//

import UIKit
import CoreML

enum StyleModel: String, CaseIterable {
    case upsideDown = "Flip Up"
    case left = "Spin Left"
    case right = "Spin Right"
    
    var isActive: Bool { return true }
    // Make this a conditional to enable only certain models
    
    init(index: Int) { self = StyleModel.styles[index] }
    
    static var styles: [StyleModel] { return self.allCases.filter { (style) in style.isActive } }
    
    var name: String { return self.rawValue }
    var styleIndex: Int { return StyleModel.styles.firstIndex(of: self)! }
}
