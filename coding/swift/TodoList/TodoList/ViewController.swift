// CoreData 연습 예제

import UIKit
import CoreData

enum PriorityLevel: Int16 {
    case level1
    case level2
    case level3
}

extension PriorityLevel {
    var color: UIColor {
        switch self {
        case .level1:
            return .green
        case .level2:
            return .orange
        case .level3:
            return .red
        }
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var todoTabelView: UITableView!
    
    // App Delegate 접근
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    var todoList = [TodoList]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "To-Do List"
        self.makeNavigationBar()
        self.todoTabelView.delegate = self
        self.todoTabelView.dataSource = self
        
        self.fetchData()
        self.todoTabelView.reloadData()
    }
    
    func fetchData() {
        let fetchRequest: NSFetchRequest<TodoList> = TodoList.fetchRequest()
        let context = appdelegate.persistentContainer.viewContext
        do {
            self.todoList = try context.fetch(fetchRequest)
        } catch {
            print(error)
        }
    }
    
    func makeNavigationBar() {
        let item = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTodo))
        item.tintColor = .black
        self.navigationItem.rightBarButtonItem = item
        
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = UIColor(red: 30/255, green: 40/255, blue: 50/255, alpha: 0.3)
        
        self.navigationItem.standardAppearance = barAppearance
        self.navigationItem.scrollEdgeAppearance = barAppearance
        
    }

    @objc func addNewTodo() {
        let detailVC = TodoDetailViewController.init(nibName: "TodoDetailViewController", bundle: nil)
        
        detailVC.delegate = self
        self.present(detailVC, animated: true, completion: nil)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoCell
        
        cell.topTitleLabel.text = todoList[indexPath.row].title
        
        if let hasDate = todoList[indexPath.row].date {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd hh:mm:ss"
            
            let dateString = formatter.string(from: hasDate)
            cell.dateLabel.text = dateString
        } else {
            cell.dateLabel.text = ""
        }
        
        let priority = todoList[indexPath.row].priorityLevel
        let priorityColor = PriorityLevel(rawValue: priority)?.color
        cell.priorityView.backgroundColor = priorityColor
        
        cell.priorityView.layer.cornerRadius = cell.priorityView.bounds.height / 2
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = TodoDetailViewController.init(nibName: "TodoDetailViewController", bundle: nil)
        detailVC.delegate = self
        detailVC.selectedTodoList = todoList[indexPath.row]
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
}

extension ViewController: TodoDetailViewControllerDelegate {
    func didFinishSaveData() {
        self.fetchData()
        self.todoTabelView.reloadData()
    }
}
