//
//  MexicoGridViewModel.swift
//  Mexico 101
//
//  Created by Juan Hernandez Pazos on 10/03/24.
//

import SwiftUI
import Observation

@Observable
final class MexicoGridViewModel {
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
}
