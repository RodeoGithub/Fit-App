//  ProfilePhotoView.swift

import SwiftUI

struct ProfilePhotoView: View {
    //recieve an image
    var imageName: String = "logo"
    
    @State var points: Int = 0
    
    var body: some View {
        ZStack {
            HStack(alignment: .top, spacing: 0) {
                Image("\(imageName)")
                    .resizable()
                    .background(Color.red)
                    .frame(width: 64, height: 64)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                Text("\(points)")
                    .foregroundColor(.white)
                    .padding(6)
                    .background(K.Colors.defaultGradient)
                    .clipShape(Circle())
                    .overlay(Circle()
                                .stroke(Color.white,lineWidth: 2)
                    )
                    .offset(x: -24)
            }
        }
    }
}

struct ProfilePhotoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoView(imageName: "logo")
    }
}



