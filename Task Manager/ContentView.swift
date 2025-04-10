//
//  ContentView.swift
//  Task Manager
//
//  Created by Ngoni Katsidzira  on 10/4/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    ContentView()
}
