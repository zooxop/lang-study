import Foundation

enum MovieAPIType {
    case justURL(urlString: String)
    case searchMovie(querys: [URLQueryItem])
}

// 예외처리시 사용할 에러 타입 선언
enum MovieAPIError: Error {
    case badURL
}

class NetworkManager {
    
    // 매개변수 타입이 길어질 때 사용하면 좋다.
    typealias NetworkCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void
    
    // 1. only URL
    // 2. URL + parameter
    func request(type: MovieAPIType, completion: @escaping NetworkCompletion) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        do {
            let request = try buildRequest(type: type)
                
            session.dataTask(with: request) { data, response, error in
                print((response as! HTTPURLResponse).statusCode)
                
                // 받은 클로저를 그대로 넘겨줌
                completion(data, response, error)

            }.resume()
            
            // 세션 종료하기
            session.finishTasksAndInvalidate()

        } catch {
            print(error)
            
        }
    }
    
    private func buildRequest(type: MovieAPIType) throws -> URLRequest {
        
        switch type {
            
        case .justURL(urlString: let urlString):
            guard let hasURL = URL(string: urlString) else {
                throw MovieAPIError.badURL
            }
            
            var request = URLRequest(url: hasURL)
            request.httpMethod = "GET"
            return request
            
        case .searchMovie(querys: let querys):
            
            // API 기본 주소
            var components = URLComponents(string: "https://itunes.apple.com/search?")
            
            // parameter 할당
            components?.queryItems = querys
            
            guard let hasUrl = components?.url else {
                throw MovieAPIError.badURL
            }
            
            var request = URLRequest(url: hasUrl)
            request.httpMethod = "GET"
            return request
        }
        
    }
}
