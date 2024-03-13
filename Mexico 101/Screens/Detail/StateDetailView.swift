//
//  StateDetailView.swift
//  Mexico 101
//
//  Created by Juan Hernandez Pazos on 11/03/24.
//

import SwiftUI

struct StateDetailView: View {
    // MARK: Properties
    @Environment(\.verticalSizeClass) var verticalSizeClass

    var stateDetail: States
    var isLanscape: Bool { verticalSizeClass == .compact }
    
    // MARK: View
    var body: some View {
        if isLanscape {
            landscapeLayout
        } else {
            portraitLayout
        } // Conditional layout
    }
}

// MARK: Previews
#Preview("Light") {
    StateDetailView(stateDetail: MockData.sampleState)
}

#Preview("Dark") {
    StateDetailView(stateDetail: MockData.sampleState)
        .preferredColorScheme(.dark)
}

// MARK: Extensions

extension StateDetailView {
    // MARK: Portrait layout
    private var portraitLayout: some View {
        VStack {
            StateTitle(stateDetail: stateDetail)
            
            gridData
            generalData
        } // VStack
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: Landscape layout
    private var landscapeLayout: some View {
        ScrollView {
            VStack {
                HStack {
                    StateTitle(stateDetail: stateDetail)
                    
                    gridData
                } // HStack
                
                generalData
            } // VStack
        } // ScrollView
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: Grid
    private var gridData: some View {
        Grid(horizontalSpacing: 16) {
            GridRow {
                Text("Población:")
                    .gridColumnAlignment(.leading)
                Text(stateDetail.population)
                    .gridColumnAlignment(.leading)
            }
            GridRow {
                Text("Municipios:")
                Text(stateDetail.municipios)
            }
            GridRow {
                Text("Latitud:")
                Text(stateDetail.latitude)
            }
            GridRow {
                Text("Longitud:")
                Text(stateDetail.longitude)
            }
        } // Grid
        .font(.subheadline)
        .padding(.bottom, 24)
    }
    
    // MARK: General
    private var generalData: some View {
        VStack {
            Text(stateDetail.description)
            .font(.system(.callout, design: .serif))
            
            Image(stateDetail.stateImage)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(radius: 10, x: 1, y: 1)
        
            Spacer()
            
            Link("Leer más...", destination: URL(string: stateDetail.urlString) ?? URL(string: "https://datafox.mx")!)
                .buttonStyle(.borderedProminent)
                .controlSize(.extraLarge)
                .tint(.accent)
        }
    }
}
