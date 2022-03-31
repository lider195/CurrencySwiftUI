import SwiftUI

struct ConverterCoins: View {
    @ObservedObject var viewModel: CoinClientModels

    
    var body: some View {
        ZStack {
            Color.orange
                .opacity(0.7)
            VStack {
                Text(viewModel.currencyCoin)
                    .font(.system(size: 40))
                    .rotationEffect(.degrees(15))
                    .padding(.top,70)
                    .shadow(color: .black, radius: 1, x: 1, y: 1)
                Text(viewModel.name)
                    .font(.system(size: 25))
                    .rotationEffect(.degrees(15))
                    .shadow(color: .black, radius: 1, x: 1, y: 1)
                Spacer()
                Text("\(viewModel.priceCoin)")
                Spacer()
                Text("*")
                    .font(.system(size: 70))
                TextField("Count", text: $viewModel.count)
                    .font(.system(size: 35))
                    .textFieldStyle(.plain)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .padding()
                Spacer()

                Text("\(String(format: "%.2f", summ()))$")
                    .font(.system(size: 40))
                Spacer()
            }
        }
        .cornerRadius(30)
        .clipShape(CShape())
        .contentShape(CShape())
        .shadow(color: .red, radius: 200, x: 20, y: 20)
        .ignoresSafeArea()
    }

    func summ() -> Double {
        let a = viewModel.priceCoin
        let b = Double(viewModel.count) ?? 1.0
        let c = a * b
        return c
    }
}

struct ConverterCoins_Previews: PreviewProvider {
    static var previews: some View {
        ConverterCoins(viewModel: CoinClientModels(currencyCoin: "BTC",
                                                                     priceCoin: 1213.3,
                                                                     name: "Bitcoin",
                                                                     count: "2"))
    }
}
