//
//  HSImageView.swift
//  HSAppStore
//
//  Created by Sheng ma on 2022/5/15.
//

import SwiftUI

struct HSImageView: View {
    @State private var imageData: Data? = nil
    var imageURL: String

    init(_ imageURL: String) {
        self.imageURL = imageURL
    }

    var body: some View {
        if let imageData = imageData {
            Image(uiImage: UIImage(data: imageData) ?? UIImage(imageLiteralResourceName: "defaultImage.jpg"))
                .resizable()
        } else {
            ProgressView()
                .onAppear {
                    getImageData()
                }
                .padding(.all)
        }
    }
    
    private func getImageData() {
        Task {
            HSImageCache.shared.imageForUrl(urlString: self.imageURL, completionHandler: { (data) -> () in
                imageData = data
            })
        }
    }
}
