//
//  StyleModel.swift
//  ImageStyleTransfer
//
//  Created by Shailesh Patel on 25/01/2021.
//

import UIKit
import CoreML

enum StyleModel: String, CaseIterable {
    /*
    case upsideDown = "Flip Up"
    case left = "Spin Left"
    case right = "Spin Right"
    var isActive: Bool { return true }
    // Make this a conditional to enable only certain models
    
    init(index: Int) { self = StyleModel.styles[index] }
    
    static var styles: [StyleModel] { return self.allCases.filter { (style) in style.isActive } }
    
    var name: String { return self.rawValue }
    var styleIndex: Int { return StyleModel.styles.firstIndex(of: self)! }
    */
    
    // The length of this must match the number styles defined in the model i.e. 6 for this model
    case abstract = "Abstract"
    case apples = "Apples"
    case brick = "Brick"
    case flower = "Flower"
    case foliage = "Foliage"
    case honeycomb = "HoneyComb"
    //case mosiac = "Mosiac"
    //case nebula = "Nebula"
    
    var model: StyleTransferModel { return StyleTransferModel() }
    
    // Change if your own model has different constraints
    var constraints: CGSize { return CGSize(width: 800, height: 800) }
    var isActive: Bool { return true }
    
    init(index: Int) { self = StyleModel.styles[index] }
    
    static var styles: [StyleModel] {
        return self.allCases.filter { (style) in style.isActive }
    }
    
    var name: String { return self.rawValue }
    
    var styleIndex: Int { return StyleModel.styles.firstIndex(of: self)! }
    
    var styleArray:MLMultiArray {
        return MLMultiArray(size: StyleModel.allCases.count, selecting: self.styleIndex)
    }
}
