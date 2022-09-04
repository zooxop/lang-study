import UIKit

class GeneralCell: UITableViewCell {
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightImageView: UIImageView! {
        
        // property observer
        // didSet: 해당 프로퍼티가 메모리에 세팅되는 순간 동작함
        didSet {
            rightImageView.image = UIImage(systemName: "chevron.right")
        }
    }
    
    
    
}

struct GeneralModel {
    var leftTitle = ""
}

class GeneralViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var model = [[GeneralModel]]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralCell", for: indexPath) as! GeneralCell
        
        cell.leftLabel.text = model[indexPath.section][indexPath.row].leftTitle
        return cell
    }
    

    @IBOutlet weak var generalTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generalTableView.delegate = self
        generalTableView.dataSource = self
        generalTableView.backgroundColor = UIColor(white: 245/255, alpha: 1)
        
        model.append([GeneralModel(leftTitle: "About")])
        
        
        model.append([GeneralModel(leftTitle: "Keyboard"),
                    GeneralModel(leftTitle: "Game Controller"),
                    GeneralModel(leftTitle: "Fonts"),
                    GeneralModel(leftTitle: "Language & Region"),
                    GeneralModel(leftTitle: "Dictionary")])
        
        model.append([GeneralModel(leftTitle: "Reset")])
        
        // Navigation Controller
        self.title = "General"
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    

}
