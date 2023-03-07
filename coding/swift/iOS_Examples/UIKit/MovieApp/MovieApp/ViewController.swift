// Search bar 예제
// Network API(JSON style) 사용 예제
// completion(closure)을 매개변수로 주고받는 코드 샘플

import UIKit

class ViewController: UIViewController {
    
    var movieModel: MovieModel?  // json model
    var term = ""  // search bar 입력
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var movieTableView: UITableView!
    
    // Network API 호출과 관련된 공통 코드 계층을 분리시킴
    var networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTableView.delegate = self
        movieTableView.dataSource = self
        searchBar.delegate = self
        
        requestMovieAPI()
    }
    
    func loadImageUseManager(urlString: String, completion: @escaping (UIImage?) -> Void) {
        networkManager.request(type: .justURL(urlString: urlString)) { data, response, error in
            if let hasData = data {
                completion(UIImage(data: hasData))
                return
            }
            completion(nil)
        }
    }
    
    func loadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        if let hasURL = URL(string: urlString) {
            var request = URLRequest(url: hasURL)
            request.httpMethod = "GET"
            
            session.dataTask(with: request) { data, response, error in
                print((response as! HTTPURLResponse).statusCode)
                
                // 클로저 completion으로 받아온 UIImage 객체에 data를 할당해준다.
                // 받아온 UIImage 객체는 이 함수가 끝난 뒤에도 살아있어야 하기 때문에,
                // 함수 선언부에 @escaping 키워드를 사용해준다.
                if let hasData = data {
                    completion(UIImage(data: hasData))
                    return
                }
            }.resume()
        }
        
        // 함수 동작이 여기까지 왔다는건, 위의 API 호출이 실패했음을 의미한다.
        // 따라서, 받아온 completion에 nil을 할당해주어서 메모리 해제를 해줘야 누수가 발생하지 않는다.
        completion(nil)
    }
    
    
    func requestMovieAPIUseManager() {
        // query parameter
        let term = URLQueryItem(name: "term", value: term)
        let media = URLQueryItem(name: "media", value: "movie")
        let querys = [term, media]
        
        networkManager.request(type: .searchMovie(querys: querys)) { data, response, error in
            if let hasData = data {
                do {
                    self.movieModel = try JSONDecoder().decode(MovieModel.self, from: hasData)
                    
                    print(self.movieModel ?? "No data")
                    
                    DispatchQueue.main.async {
                        self.movieTableView.reloadData()
                    }
                    
                } catch {
                    print(error)
                }
            }
        }
    }
    
    // network
    func requestMovieAPI() {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        // API 기본 주소
        var components = URLComponents(string: "https://itunes.apple.com/search?")
        
        // query parameter
        let term = URLQueryItem(name: "term", value: term)
        let media = URLQueryItem(name: "media", value: "movie")
        
        // parameter 할당
        components?.queryItems = [term, media]
        
        guard let url = components?.url else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        
        // dataTask().resume() => API호출을 실행하고 response를 받는 것 까지 한 번에 처리.
        session.dataTask(with: request) { data, response, error in
            // 200, 404, 500 등 response code
            print((response as! HTTPURLResponse).statusCode)
            
            if let hasData = data {
                do {
                    self.movieModel = try JSONDecoder().decode(MovieModel.self, from: hasData)
                    
                    print(self.movieModel ?? "No data")
                    
                    DispatchQueue.main.async {
                        self.movieTableView.reloadData()
                    }
                    
                } catch {
                    print(error)
                }
            }
        }.resume()  // resume() => API 호출 로직 실행!
        
        // 세션 종료하기
        session.finishTasksAndInvalidate()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieModel?.results.count ?? 0
    }
    
    // cell 높이 자동 지정
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // cell 클릭 이벤트
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = UIStoryboard(name: "DetailViewController", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        detailVC.movieResult = self.movieModel?.results[indexPath.row]
        
        // present의 completion()은 화면이 띄워진 다음 동작한다.
        // 따라서, 화면이 보이고 난 다음에 텍스트가 바뀌는 것이 보일 수도 있다.
        // detailVC.modalPresentationStyle = .fullScreen
        self.present(detailVC, animated: true) {
            // detailVC.movieResult = self.movieModel?.results[indexPath.row]
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.titleLabel.text = self.movieModel?.results[indexPath.row].trackName
        cell.descriptionLabel.text = self.movieModel?.results[indexPath.row].shortDescription
        
        let currency = self.movieModel?.results[indexPath.row].currency ?? ""
        let price = self.movieModel?.results[indexPath.row].trackPrice?.description ?? ""
        cell.priceLabel.text = currency + price
        
        if let imageUrl = self.movieModel?.results[indexPath.row].image {
//            self.loadImage(urlString: imageUrl, completion: { image in
//                DispatchQueue.main.async {
//                    cell.movieImageView.image = image
//                }
//            })
            self.loadImageUseManager(urlString: imageUrl, completion: { image in
                DispatchQueue.main.async {
                    cell.movieImageView.image = image
                }
            })
        }
        
        
        // ISO8601 날짜 포맷 가공 예제
        if let dateString = self.movieModel?.results[indexPath.row].releaseDate {
            let formatter = ISO8601DateFormatter()
            if let isoDate = formatter.date(from: dateString) {
                let myFormatter = DateFormatter()
                myFormatter.dateFormat = "yyyy년 MM월 dd일"
                let dateString = myFormatter.string(from: isoDate)
                
                cell.dateLabel.text = dateString
            }
        }
        
        
        return cell
    }
    
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let hasText = searchBar.text else {
            return
        }
        
        term = hasText
        // requestMovieAPI()
        requestMovieAPIUseManager()
        self.view.endEditing(true)  // 키보드 내려주기
    }
}
