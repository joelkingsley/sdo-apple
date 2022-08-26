//
//  TopVideoPreview.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 30/06/2022.
//

import SwiftUI
import Kingfisher

protocol TopPreviewableVideo {
    var thumbnailURL: URL { get }
    var categories: [String] { get }
}

struct TopVideoPreview: View {
    var video: TopPreviewableVideo
    
    func isCategoryLast(_ category: String) -> Bool {
        if let index = video.categories.firstIndex(of: category),
           index + 1 != video.categories.count {
            return false
        }
        return true
    }
    
    var body: some View {
        ZStack {
            KFImage(video.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipped()
            VStack {
                Spacer()
                
                HStack {
                    ForEach(video.categories, id: \.self) { category in
                        Text(category)
                            .font(.sdoFootnote)
                        if !isCategoryLast(category) {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.blue)
                                .font(.system(size: 3))
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    
                    TogglableButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                        
                    }
                    
                    Spacer()
                    
                    ActionButton(imageName: "play.fill", text: "Play") {
                        
                    }.frame(width: 120)
                    
                    Spacer()
                    
                    TogglableButton(text: "Info", isOnImage: "info.circle", isOffImage: "info.circle", isOn: true) {
                        
                    }
                    
                    Spacer()
                }
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(uiColor: UIColor.systemBackground).opacity(0.0),
                        Color(uiColor: UIColor.systemBackground).opacity(0.98)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                ).padding(.top, -150)
            )
        }
        .foregroundColor(.white)
    }
}

struct TopVideoPreview_Previews: PreviewProvider {
    static var previews: some View {
//        TopVideoPreview(video: exampleVideo1)
        EmptyView()
    }
}
