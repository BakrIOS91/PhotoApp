//
//  PhotoCell.swift
//  PhotoApp
//
//  Created by Bakr mohamed on 07/04/2023.
//

import SwiftUI
import Kingfisher

struct PhotoCell: View {
    var model: PhotoModel
        
    var body: some View {
        ZStack(alignment: .bottom) {
            Unwrap(model.downloadURL?.toURL) { photoURL in
                KFImage.url(photoURL)
                    .placeholder {
                        Rectangle()
                            .foregroundColor(.appBackground)
                            .shimmed
                    }
                    .loadDiskFileSynchronously()
                    .cacheOriginalImage()
                    .fade(duration: 0.25)
                    .resizable()
                    .scaledToFill()
            }
            
            ZStack{
                
                Color.appWhite
                    .cornerRadius(25, corners: [.topLeft, .topRight])
                    .shadow(radius: 4)
                
                VStack(alignment: .leading){
                    
                    Text(model.author ?? "N/A")
                        .font(.boldWithSize16)
                    
                    Spacer()
                }
                .padding()

            }
            .frame(width: 200, height: 50, alignment: .center)

        }
        .frame(width: 350, height: 400, alignment: .center)
        .cornerRadius(30)
        .shadow(radius: 3)
    }
}

struct PhotoCell_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCell(model: .fake)
    }
}
