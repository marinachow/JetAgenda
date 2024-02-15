//
//  JetAgendaApp.swift
//  JetAgenda
//
//  Created by Fernando Ayala on 08/11/2023.
//

import SwiftUI

@main
struct JetAgendaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
