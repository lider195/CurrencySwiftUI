import SwiftUI

extension View {
    @ViewBuilder
    func isLoading(_ isLoading: Bool) -> some View {
        ZStack {
            self
            if isLoading {
                LoadingView()
            }
        }
        .animation(.linear(duration: 0.2), value: isLoading)
    }
}

struct CShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}
