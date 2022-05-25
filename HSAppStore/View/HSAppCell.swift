//
//  HSAppCell.swift
//  HSAppStore
//
//  Created by Sheng ma on 2022/5/15.
//

import SwiftUI

struct HSAppCell: View {
    var appModel: HSAppModel
    var clickLikeAction: (() -> Void)?
    let defaultName = "HSAppName"
    let defaultDescription = "HSAppName is a default appDescription"
    
    var body: some View {
        Group {
            HStack {
                if appModel.artworkUrl60.isEmpty {
                    HSDeafultImageView()
                } else {
                    HSImageView(appModel.artworkUrl60)
                        .frame(width: 50, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .overlay{
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth:0.2)
                        }
                }
                
                VStack(alignment: .leading) {
                    Text(appModel.trackName.isEmpty ? defaultName : appModel.trackName)
                        .font(.title3)
                        .lineLimit(1)
                    
                    Text(appModel.description.isEmpty ? defaultDescription : appModel.description)
                        .font(.caption)
                        .lineLimit(2)
                }
                
                Spacer()
    
                Image(systemName: appModel.isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(appModel.isFavorite ? .red : .gray)
                    .scaleEffect(appModel.isFavorite ? 1.1 : 1.0)
                    .animation(.default, value: appModel.isFavorite)
                    .onTapGesture {
                        clickFavoriteAction()
                    }
            }.frame(height: 80)
        }.padding(.top, 10)
    }
    
    private func clickFavoriteAction() {
        if let clickLikeAction = clickLikeAction {
            clickLikeAction()
        }
    }
}

struct HSDeafultImageView: View {
    var body: some View {
        Group {
            Image(uiImage: UIImage(imageLiteralResourceName: "defaultImage.jpg"))
                .resizable()
        }
        .frame(width: 50, height: 50)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay{
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.black, lineWidth:0.2)
        }
    }
}
