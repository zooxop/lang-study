// Table view 연습 프로젝트

import UIKit

class ViewController: UIViewController{

    var settingModel = [[SettingModel]]()
    
    @IBOutlet weak var settingTableView: UITableView!
    
    func makeData() {
        settingModel.append([SettingModel(leftImageName: "person.circle", menuTitle: "Sign in to your iPhone", subTitle: "Set up iCloud, the App Store, and more.", rightImageName: nil)])
        
        settingModel.append(
            [SettingModel(leftImageName: "gear", menuTitle: "General", subTitle: nil, rightImageName: "chevron.right"),
            SettingModel(leftImageName: "person.fill", menuTitle: "Accessibility", subTitle: nil, rightImageName: "chevron.right"),
            SettingModel(leftImageName: "hand.raised.fill", menuTitle: "Privacy", subTitle: nil, rightImageName: "chevron.right")]
        )
                        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTableView.backgroundColor = UIColor(white: 245/255, alpha: 1)
        
        // Table view를 사용할 때 설정해주어야 하는 규격
        settingTableView.delegate = self
        settingTableView.dataSource = self
        
        // Table view cell을 등록하는 코드
        let profileNib = UINib(nibName: "ProfileCell", bundle: nil)
        settingTableView.register(profileNib, forCellReuseIdentifier: "ProfileCell")
        
        let menuNib = UINib(nibName: "MenuCell", bundle: nil)
        settingTableView.register(menuNib, forCellReuseIdentifier: "MenuCell")
        
        makeData()
        
        self.view.backgroundColor = UIColor(white: 245/255, alpha: 1)
        
        
    }
    
    
    // 화면이 호출될 때 마다 실행된다.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Navigation Controller
        self.title = "Settings"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

}


// Table view를 사용하려면 준수해야 하는 protocol을 extension으로 구현.
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // table view 아래에 Section이 있고, Section 안에 cell이 있다.
    // => 2차원 배열로 구성한다.
    
    // 해당 Section에 들어있는 cell의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingModel[section].count
    }
    
    // Section의 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingModel.count
    }
    
    // cellForRowAt: 어떤 cell을 보여줄 것인지
    // indexPath: cell의 표시 순서
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 첫 번째 section일 때, "ProfileCell" 스타일로 보여준다.
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            
            cell.topTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
            cell.bottomDescription.text = settingModel[indexPath.section][indexPath.row].subTitle
            
            cell.profileImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
            
            return cell
        }
        else {  // 나머지 section에선 "MenuCell" 스타일로 보여준다.
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
            
            cell.leftImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
            cell.leftImageView.tintColor = .orange
            cell.rightImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].rightImageName ?? "")
            cell.middleTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
            
            return cell
        }
        
    }
    
    // table view cell의 높이에 대한 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UITableView.automaticDimension  // 첫 번째 cell은 auto layout을 따른다.
        } else {
            return 60  // 나머지 cell들은 높이를 고정.
        }
    }
    
    // row(cell)를 터치했을 때 동작하는 이벤트
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // cell을 눌렀을 때 클릭되어 있는 애니메이션을 서서히 풀어주는 애니메이션
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 && indexPath.row == 0 {
            let myIdVC = MyIDViewController(nibName: "MyIDViewController", bundle: nil)
            
            self.present(myIdVC, animated: true, completion: nil)
            
        } else if indexPath.section == 1 && indexPath.row == 0 {
            if let generalVC = UIStoryboard(name: "GeneralViewController", bundle: nil).instantiateViewController(withIdentifier: "GeneralViewController") as? GeneralViewController {
                self.title = ""
                self.navigationController?.pushViewController(generalVC, animated: true)
            }
            
        }
    }
    
    
}
