//
//  ContentView.swift
//  Shared
//
//  Created by Runhua Huang on 2021/7/11.
//

import SwiftUI

struct ContentView: View {
    
    @State var card: ImageCard = ImageCard(image: "intro", tag: "Introduction", title: "ImageCard Viewer使用说明", subtitle: "Mac用户双击所要打开的文件即可\niOS/iPadOS用户可将文件隔空投送到此App内")
    
    @State private var showShareSheet = false
    
    var body: some View {
        Image(card.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 400)
            .cornerRadius(20)
            .overlay(
                VStack(alignment: .leading){
                    Text(card.tag)
                        .foregroundColor(Color.white)
                        .font(.system(size: 15, weight: .bold, design: .rounded))

                    Text(card.title)
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold, design: .rounded))

                    Spacer()

                    Text(card.subtitle)
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                }.padding()
                , alignment: .leading)
            .shadow(color: .gray, radius: 5, y: 5)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .onOpenURL { (url) in
                print(url)
                if let newImageCard  = loadCard(url: url) {
                    print(newImageCard)
                    self.card = newImageCard
                }
            }
        
    }
            
    func loadCard(url: URL) -> ImageCard? {
        guard let codedCard = try? Data(contentsOf: url) else {
            print("No Data Found")
            return nil
        }
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(ImageCard.self, from: codedCard)
    }
}
    




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
