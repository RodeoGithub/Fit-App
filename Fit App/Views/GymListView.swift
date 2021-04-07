//
//  GymListView.swift
//  Fit App
//
//  Created by Rodrigo Maidana on 07/04/2021.
//

import SwiftUI

struct GymListView: View {
    var body: some View {
        List {
            ForEach(gymTestList) { gym in
                GymCellView(gym: gym)
                    .padding()
            }
        }
    }
}

struct GymListView_Previews: PreviewProvider {
    static var previews: some View {
        GymListView()
    }
}
