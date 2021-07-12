//
//  Image_Card_ViewerApp.swift
//  Shared
//
//  Created by Runhua Huang on 2021/7/11.
//

import SwiftUI

@main
struct Image_Card_ViewerApp: App {

    var body: some Scene {
        
        WindowGroup {
            ContentView()
        }
    }
    
    func loadCard(url: URL) -> [ImageCard]? {
        guard let codedCard = try? Data(contentsOf: url) else {
            print("No Data Found")
            return nil
        }
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<ImageCard>.self, from: codedCard)
    }
    
    
}
