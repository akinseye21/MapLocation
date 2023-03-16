//
//  LocationMapAnnotationView.swift
//  SwiftMapApp
//
//  Created by Yomi on 3/13/23.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    var body: some View {
        VStack(spacing: 0){
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(Color("AccentColor"))
                .cornerRadius(36)
            Image(systemName: "triangle.fill")
                .rotationEffect(Angle(degrees: 180))
                .foregroundColor(Color("AccentColor"))
                .offset(y: -4)
                .frame(width: 10, height: 10)
                .padding(.bottom, 40)
        }
    }
}

struct LocationMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapAnnotationView()
    }
}
