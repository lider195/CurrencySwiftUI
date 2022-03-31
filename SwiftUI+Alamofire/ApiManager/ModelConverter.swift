struct ModelConverter {
    static let instance = ModelConverter()
    func convert(_ serverModel: CoinServerModel) -> CoinClientModel {
        let assetId = serverModel.asset_id ?? "none"
        let priceUSD = Double(serverModel.price_usd ?? 0)
        let clientModel = CoinClientModel(
            assetId: assetId,
            name: serverModel.name,
            priceUSD: priceUSD
        )
        return clientModel
    }
}
