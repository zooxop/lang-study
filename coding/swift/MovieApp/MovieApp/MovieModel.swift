import Foundation

// Codable : Encodable + Decodable
// json을 모델로 Decode, 모델을 json으로 Encode하는 기능을 담고 있는 프로토콜
struct MovieModel: Codable {
    let resultCount: Int
    let results: [MovieResult]
}

struct MovieResult: Codable {
    let trackName: String?
    let previewUrl: String?
    let image: String?
    let shortDescription: String?
    let longDescription: String?
    let trackPrice: Double?
    let currency: String?
    let releaseDate: String?
    // let releaseDate
    
    // CodingKey : json의 key 이름을 원하는 변수명으로 치환해서 사용하고 싶을 때, 아래와 같이 사용한다.
    enum CodingKeys: String, CodingKey {
        case image = "artworkUrl100"  // json key는 "artworkUrl100"이고, 이를 "image"로 치환해서 사용.
        case trackName
        case previewUrl
        case shortDescription
        case longDescription
        case trackPrice
        case currency
        case releaseDate
    }
}
