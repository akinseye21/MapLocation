//
//  SwiftMapAppApp.swift
//  SwiftMapApp
//
//  Created by Yomi on 3/11/23.
//

import SwiftUI

@main
struct SwiftMapAppApp: App {
    
    @StateObject var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
