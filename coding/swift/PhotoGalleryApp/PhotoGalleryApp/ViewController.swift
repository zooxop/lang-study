// collection view | Photo gallery 연습
// 앨범 접근 권한 (info.plist)

import UIKit
import PhotosUI

class ViewController: UIViewController {
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    // Photo fetch method로부터 반환된 asset이 들어있음.
    var fetchResults: PHFetchResult<PHAsset>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation Controller 제목, 좌/우 버튼 만들기
        self.title = "Photo Gallery App"
        self.makeNavigationItem()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 1) / 2, height: 200)
        
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        
        self.photoCollectionView.collectionViewLayout = layout
        self.photoCollectionView.dataSource = self
    }
    
    // 코드로 Nav-Con UI 구성요소 만들기
    func makeNavigationItem() {
        
        // 버튼
        let photoItem = UIBarButtonItem(image: UIImage(systemName: "photo.on.rectangle"), style: .done, target: self, action: #selector(checkPermission))
        photoItem.tintColor = .black.withAlphaComponent(0.7)
        
        let refreshItem = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .done, target: self, action: #selector(refresh))
        refreshItem.tintColor = .black.withAlphaComponent(0.7)
        
        
        // 버튼을 navigation에 좌/우 각각 붙여준다.
        self.navigationItem.rightBarButtonItem = photoItem
        self.navigationItem.leftBarButtonItem = refreshItem
    }
    
    // 환경설정의 앱 접근 권한을 확인하고, 승인 받는 코드 샘플
    @objc func checkPermission() {
        // 앨범 접근 권한 상태 가져오기
        if PHPhotoLibrary.authorizationStatus() == .authorized ||
            PHPhotoLibrary.authorizationStatus() == .limited {  // 접근 가능 상태
            
            // .notDetermined 블럭에서 이 함수를 다시 호출하는데,
            // 그 때는 서브 쓰레드가 동작 중이므로, 바로 showGallery와 같은 UI 컨트롤 코드를 실행하면
            // 크래쉬가 발생한다. 따라서 메인 쓰레드에서 동작하도록 코드를 감싸주어야 함.
            DispatchQueue.main.async {
                self.showGallery()
            }
        } else if PHPhotoLibrary.authorizationStatus() == .denied {  // 접근 권한 거절 상태
            
            // 메인 쓰레드에서 실행.
            DispatchQueue.main.async {
                self.showAuthorizationDeniedAlert()
            }
        } else if PHPhotoLibrary.authorizationStatus() == .notDetermined {  // 아직 물어보지 않은 상태
            
            // info.plist에 설정해놓은 문구를 출력시키며 권한 요청 메시지를 띄운다.
            PHPhotoLibrary.requestAuthorization { status in
                self.checkPermission()  // 클로저에서 실행되기 때문에, 별도 쓰레드에서 동작함.
            }
        }
    }
    
    
    // 접근 권한이 없는 경우, 다시 권한 요청을 한다.
    // 앱 설정 화면으로 포워딩을 할 수 있게 해줌.
    func showAuthorizationDeniedAlert() {
        
        // alert 창 만들기
        let alert = UIAlertController(title: "포토 라이브러리 접근 권한을 활성화 해주세요.", message: nil, preferredStyle: .alert)
        
        // alert 창에 버튼 붙이기
        // 매개변수 handler에 클로저 형태로 버튼 클릭 이벤트를 할당함.
        alert.addAction(UIAlertAction(title: "닫기", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "설정으로 가기", style: .default, handler: { action in
            
            // url : 이 앱의 환경설정 화면으로 가는 url
            guard let url = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }))
       
        // alert 창을 보여주기 => present
        self.present(alert, animated: true, completion: nil)
    }
    
    
    // 갤러리를 호출하는 코드 샘플
    func showGallery() {
        let library = PHPhotoLibrary.shared()  // 사진 library를 싱글톤으로 받아옴.
        
        // 갤러리 관련 설정값을 여기에 할당할 수 있음.
        var configuration = PHPickerConfiguration(photoLibrary: library)
        configuration.selectionLimit = 10  // 최대 선택 개수 제한
        
        // 사진 선택기 : picker
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        
        
        self.present(picker, animated: true, completion: nil)
    }
    
    @objc func refresh() {
        self.photoCollectionView.reloadData() // UICollectionView의 자체 새로고침 기능
    }

}

extension ViewController: UICollectionViewDataSource {
    
    // 보여줄 CollectionViewCell 의 개수 리턴해주기.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 전역변수 fetchResults에서 count를 가져옴.
        return self.fetchResults?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        // fetchResults에 들어있는 원소들을 순서대로 image 할당을 시켜줌.
        if let asset = self.fetchResults?[indexPath.row] {
            cell.loadImage(asset: asset)
        }
        
        return cell
    }
}

extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        // results: 사용자가 선택(pick)한 이미지들이 들어있음.
        let identifiers = results.map {
            $0.assetIdentifier ?? ""  // assetIdentifier: 이미지의 고유 번호
        }
        
        self.fetchResults = PHAsset.fetchAssets(withLocalIdentifiers: identifiers , options: nil)
        
        // reloadData() : Table View / Collection View의 모든 데이터를 "갱신한다."
        // 갱신한다 => 설정해놓은 "DataSource" 프로토콜 구현체를 실행한다는 의미.
        // 여기서는 ViewController 클래스가 "UICollectionViewDataSource"프로토콜을 extension으로 구현했고, (= self)
        // viewDidLoad() 메서드에서 CollectionView의 dataSource를 self로 지정해주었다.
        self.photoCollectionView.reloadData()
        
        self.dismiss(animated: true, completion: nil)
    }
}

// 사용자가 앨범에서 사진을 선택하고 "Add"를 누르면
// 1. Delegate의 picker 메서드 실행
// 2. DataSource의 개수 리턴 메서드 실행
// 3. DataSource의 cell 갱신 메서드 실행.
