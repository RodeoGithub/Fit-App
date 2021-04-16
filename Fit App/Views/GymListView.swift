//  GymListView.swift

import SwiftUI

struct GymListView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(gymTestList) { gym in
                    ZStack {
                        GymCellView(gym: gym)
                        NavigationLink(destination: GymDetailView(gym: gym)) {
                            EmptyView()
                        }.hidden()
                    }
                }
            }.navigationBarHidden(true)
        }
    }
}

struct GymListView_Previews: PreviewProvider {
    static var previews: some View {
        GymListView()
    }
}
