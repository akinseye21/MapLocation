//
//  LocationListView.swift
//  SwiftMapApp
//
//  Created by Yomi on 3/13/23.
//

import SwiftUI

struct LocationListView: View {
    
    @EnvironmentObject var vm: LocationsViewModel
    
    var body: some View {
        List{
            ForEach(vm.locations) { location in
                Button {
                    vm.updateLocation(location: location)
                } label: {
                    myList(location: location)
                }
                .padding(.vertical, 4)
                //give each list row a transparent background
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationListView{
    
    func myList(location: Location) -> some View{
        HStack{
            if let imageName = location.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(5)
            }
            VStack(alignment: .leading){
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
