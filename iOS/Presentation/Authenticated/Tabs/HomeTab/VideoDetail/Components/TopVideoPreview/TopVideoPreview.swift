//
//  TopVideoPreview.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 30/06/2022.
//

import SwiftUI
import Kingfisher

protocol TopPreviewableVideo {
    var title: String { get }
    var localizedType: String { get }
    var thumbnailURL: URL { get }
    var datePublished: Date { get }
    var description: String { get }
    var speakerName: String { get }
    var canUserWatch: Bool { get }
    var subscriptionsForWatching: [SubscriptionData] { get }
}

struct TopVideoPreview: View {
    var video: TopPreviewableVideo
    
    let topVideoPreviewViewModel: TopVideoPreviewViewModel
    
    init(video: TopPreviewableVideo) {
        self.video = video
        self.topVideoPreviewViewModel = TopVideoPreviewViewModel(video: video)
    }
    
    var body: some View {
        ZStack {
            VStack {
                KFImage(video.thumbnailURL)
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .overlay(content: {
                        LinearGradient(
                            colors: [
                                Color(uiColor: UIColor.systemBackground).opacity(0.0),
                                Color(uiColor: UIColor.systemBackground).opacity(0.10),
                                Color(uiColor: UIColor.systemBackground).opacity(0.99)
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .padding(.top, -150)
                    })
                Spacer()
                    .frame(height: 150)
            }

            VStack {
                Spacer()
                
                Text(video.title)
                    .font(.sdoTitle2)
                    .bold()
                    .foregroundColor(Color(uiColor: .label))
                
                Text(video.localizedType)
                    .font(.sdoCallout)
                    .foregroundColor(Color(uiColor: .secondaryLabel))
                
                Text(video.datePublished.formatted(date: .abbreviated, time: .omitted))
                    .font(.sdoCaption)
                    .foregroundColor(Color(uiColor: .secondaryLabel))
                
                Text(video.speakerName)
                    .font(.sdoCaption)
                    .foregroundColor(Color(uiColor: .secondaryLabel))
                
                HStack {
                    Spacer()
                    
                    if video.canUserWatch {
                        ActionButton(imageName: "play.fill", text: "videoDetailPlayButtonLabel") {
                            
                        }
                        .frame(width: 250)
                    }
                    
                    Spacer()
                }
                
                Text(video.description)
                    .lineLimit(2)
                    .foregroundColor(Color(uiColor: .label))
                    .padding(.horizontal)
                    .padding(.top, 20)
                    .truncationMode(.tail)
                
                HStack {
                    Spacer()
                    Button {
                        // TODO: Show dismissable sheet with full description
                    } label: {
                        Text("videoDetailMoreTextLabel")
                    }
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 20)
        }
    }
}

struct TopVideoPreview_Previews: PreviewProvider {
    static var previews: some View {
        TopVideoPreview(video: exampleVideoDetail1)
    }
}
