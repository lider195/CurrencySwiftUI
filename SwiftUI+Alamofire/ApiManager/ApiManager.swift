import Alamofire
import Foundation

final class ApiManager {
    static let instance = ApiManager()

    enum Constants {
        static let baseURL = "https://rest.coinapi.io/v1"
    }

    enum EndPoint {
        static let assets = "/assets"
    }

    private let header: HTTPHeaders = ["X-CoinAPI-Key":
        "2D5456EB-D37B-4609-A828-04362AD282FA",
        "Accept": "application/json"]

    func getAllExchanges(completion: @escaping ([CoinClientModel]) -> Void) {
        AF.request(Constants.baseURL + EndPoint.assets,
                   method: .get,
                   parameters: [:],
                   headers: header).responseDecodable(of: [CoinServerModel].self) { response in
            switch response.result {
            case .success(let data):
                let model = data.map(ModelConverter.instance.convert)
                completion(model)
            case .failure(let error): print(error)
            }
        }
    }
}
