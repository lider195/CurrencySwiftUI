import Foundation
struct CoinClientModel: Identifiable {
    let assetId: String
    let name: String?
    var priceUSD: Double

    let id = UUID().uuidString
}

final class CoinClientModels: ObservableObject {
    @Published var isLoading = false
    
    @Published var coins = [CoinClientModel]()

    @Published var currencyCoin: String
    @Published var priceCoin: Double
    @Published var count: String
    @Published var name: String

    init(currencyCoin: String,
         priceCoin: Double,
         name: String,
         count: String
    ) {
        self.currencyCoin = currencyCoin
        self.priceCoin = priceCoin
        self.name = name
        self.count = count
    }

    func getCoins() {
        isLoading = true
        ApiManager.instance.getAllExchanges { data in
            self.isLoading = false
            self.coins = data
        }
    }
}
