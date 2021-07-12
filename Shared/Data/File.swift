//
//  File.swift
//  Image Card Viewer
//
//  Created by Runhua Huang on 2021/7/11.
//

import Foundation
import SwiftUI

struct ImageCard: Codable {
    var id = UUID()
    let image: String
    let tag: String
    let title: String
    let subtitle: String
}




