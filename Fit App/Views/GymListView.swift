//  GymListView.swift

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
