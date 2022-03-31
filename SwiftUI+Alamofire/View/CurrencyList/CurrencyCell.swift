import SwiftUI

struct CurrencyCell: View {
    @ObservedObject var viewModel: CoinClientModels
    var body: some View {
        HStack {
            Text(viewModel.currencyCoin)
                .padding(.leading, 10)
                .font(.system(size: 20))
                .frame(width: 100, height: 80)
            Spacer()
            Text("$\(String(format: "%.2f", viewModel.priceCoin))")
                .font(.system(size: 15))
                .shadow(color: .red, radius: 3, x: 1, y: 1)
            Spacer()
            Text("Converter")
                .font(.title3)
                .padding(.trailing, 20)
                .opacity(0.5)
        }
        .background(Color.gray)
        .cornerRadius(25)
        .shadow(color: .purple, radius: 10, x: 10, y: 10)
    }
}

struct CurrencyCell_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyCell(viewModel: CoinClientModels(currencyCoin: "BTC",
                                                                   priceCoin: 1213.3,
                                                                   name: "Bitcoin",
                                                 count: "2.0"))
            .previewLayout(.fixed(width: 360, height: 100))
    }
}
