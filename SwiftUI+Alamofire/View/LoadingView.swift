import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.9)
                .ignoresSafeArea()
            ProgressView()
                .progressViewStyle(.circular)
                .tint(.orange)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
