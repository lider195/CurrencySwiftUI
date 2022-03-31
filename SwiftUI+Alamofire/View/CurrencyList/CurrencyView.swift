
import SwiftUI

struct CurrencyView: View {
    @ObservedObject var viewModel: CoinClientModels
    var body: some View {
        NavigationView {

            List(viewModel.coins) { coins in

                NavigationLink {
                    ConverterCoins(viewModel: CoinClientModels(currencyCoin: coins.assetId,
                                                               priceCoin: coins.priceUSD,
                                                               name: coins.name!,
                                                               count: ""))
                } label: {
                    CurrencyCell(viewModel: CoinClientModels(currencyCoin: coins.assetId,
                                                             priceCoin: coins.priceUSD,
                                                             name: coins.name!,
                                                             count: ""))
                }
            }
            .listStyle(.plain)
            .navigationBarTitle("Coins")
        }

        .onAppear {
            viewModel.getCoins()
        }
        .isLoading(viewModel.isLoading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyView(viewModel: CoinClientModels(currencyCoin: "BTC",
                                                 priceCoin: 1213.3,
                                                 name: "Bitcoin",
                                                 count: "2.0"))
    }
}
