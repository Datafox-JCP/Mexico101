//
//  StatesGridView.swift
//  Mexico 101
//
//  Created by Juan Hernandez Pazos on 10/03/24.
//

import SwiftUI

struct StatesGridView: View {
    // MARK: Properties
    var mxViewModel = MexicoGridViewModel()
    
    // MARK: View
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    Text("Población: 120,014,024 (2020)")
                        .font(.caption)
                        .padding(.horizontal)
                    
                    Spacer()
                } // HStack
                LazyVGrid(columns: mxViewModel.columns) {
                    ForEach(MockData.statesList) { stateDetail in
                        NavigationLink(value: stateDetail) {
                            StateTitle(stateDetail: stateDetail)
                        } // Nav link
                    } // Loop
                } // Lazy grid
            } // Scroll
            .navigationTitle("🇲🇽 México")
            .navigationDestination(for: States.self) { stateDetail in
                StateDetailView(stateDetail: stateDetail)
            } // Nav dest
        } // Navigation
        .tint(Color(.label))
    } // View
}

// MARK: Preview
#Preview("Light") {
    StatesGridView()
}

#Preview("Dark") {
    StatesGridView()
        .preferredColorScheme(.dark)
}
