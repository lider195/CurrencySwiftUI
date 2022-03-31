import SwiftUI

@main
struct SwiftUI_AlamofireApp: App {
    var body: some Scene {
        WindowGroup {
            CurrencyView(viewModel: CoinClientModels(currencyCoin: "BTC",
                                                     priceCoin: 123.2,
                                                     name: "Bitcoin",
                                                     count: "1.0"))
        }
    }
}
