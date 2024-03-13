//
//  StateTitle.swift
//  Mexico 101
//
//  Created by Juan Hernandez Pazos on 10/03/24.
//

import SwiftUI

struct StateTitle: View {
    // MARK: Properties
    let stateDetail: States
    
    // MARK: View
    var body: some View {
        VStack(spacing: 20) {
            Image(stateDetail.stateLogo)
                .resizable()
                .frame(width: 90, height: 90)
            
            Text(stateDetail.stateName)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(Color(.label))
                .scaledToFit()
                .minimumScaleFactor(0.6)
        } // VStack
        .padding()
    } // View
}

// MARK: Previews
#Preview("Light", traits: .sizeThatFitsLayout) {
    StateTitle(stateDetail: MockData.sampleState)
}

#Preview("Dark", traits: .sizeThatFitsLayout) {
    StateTitle(stateDetail: MockData.sampleState)
        .preferredColorScheme(.dark)
}
