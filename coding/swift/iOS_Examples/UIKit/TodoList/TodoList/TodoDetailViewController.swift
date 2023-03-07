import UIKit
import CoreData


protocol TodoDetailViewControllerDelegate: AnyObject {
    func didFinishSaveData()
}

class TodoDetailViewController: UIViewController {
    
    weak var delegate: TodoDetailViewControllerDelegate?

    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var lowButton: UIButton!
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var highButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    var selectedTodoList: TodoList?
    
    var priority: PriorityLevel?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let hasData = selectedTodoList {
            titleTextField.text = hasData.title
            priority = PriorityLevel(rawValue: hasData.priorityLevel)
            makePriorityButtonDesign()
            
            deleteButton.isHidden = false
            saveButton.setTitle("update", for: .normal)
        } else {
            self.setPriority(lowButton)  // 기본으로 low 버튼 눌려있도록
            
            deleteButton.isHidden = true
            saveButton.setTitle("save", for: .normal)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lowButton.layer.cornerRadius = lowButton.bounds.height / 2
        normalButton.layer.cornerRadius = normalButton.bounds.height / 2
        highButton.layer.cornerRadius = highButton.bounds.height / 2
    }
    
    
    // low, normal, high 버튼 3개의 이벤트가 이 함수 하나에 연결되어 있음.
    // 버튼을 구분하는 방법: 각 버튼의 view-tag 값을 1/2/3 으로 할당하여 구분한다.
    // sender는 Any가 아닌 UIButton 타입으로 받아오도록 직접 수정해주거나 타입캐스팅을 해서 사용한다.
    @IBAction func setPriority(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            priority = .level1
        case 2:
            priority = .level2
        case 3:
            priority = .level3
        default:
            break
        }
        
        makePriorityButtonDesign()
    }
    
    func makePriorityButtonDesign() {
        lowButton.backgroundColor = .clear
        normalButton.backgroundColor = .clear
        highButton.backgroundColor = .clear
        
        switch priority {
        case .level1:
            lowButton.backgroundColor = priority?.color
        case .level2:
            normalButton.backgroundColor = priority?.color
        case .level3:
            highButton.backgroundColor = priority?.color
        default:
            break
        }
    }
    
    @IBAction func saveTodo(_ sender: Any) {
        
        // create/update 분기 처리
        if selectedTodoList != nil {
            updateTodo()
        } else {
            saveTodo()
        }
        
        delegate?.didFinishSaveData()
        self.dismiss(animated: true, completion: nil)
    }
    
    func saveTodo() {
        // let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "TodoList", in: context) else {
            return
        }
        
        guard let object = NSManagedObject(entity: entityDescription, insertInto: context) as? TodoList else {
            return
        }
        
        object.title = titleTextField.text
        object.date = Date()  // 현재 날짜
        object.uuid = UUID()  // UUID: Unique ID
        
        object.priorityLevel = priority?.rawValue ?? PriorityLevel.level1.rawValue
        
        // save data
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    func updateTodo() {
        guard let hasData = selectedTodoList else {
            return
        }
        
        guard let hasUUID = hasData.uuid else {
            return
        }
        
        let fetchRequest: NSFetchRequest<TodoList> = TodoList.fetchRequest()
        
        // 선택한 데이터만 가져오기(쿼리 where절 같은 개념)
        fetchRequest.predicate = NSPredicate(format: "uuid = %@", hasUUID as CVarArg)
        
        do {
            let loadedData = try context.fetch(fetchRequest)
            
            loadedData.first?.title = titleTextField.text
            loadedData.first?.date = Date()
            loadedData.first?.priorityLevel = self.priority?.rawValue ?? PriorityLevel.level1.rawValue
            
            // save data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
        } catch {
            print(error)
        }
        
        
    }
    
    @IBAction func deleteTodo(_ sender: Any) {
        guard let hasData = selectedTodoList else {
            return
        }
        
        guard let hasUUID = hasData.uuid else {
            return
        }
        
        let fetchRequest: NSFetchRequest<TodoList> = TodoList.fetchRequest()
        
        // 선택한 데이터만 가져오기(쿼리 where절 같은 개념)
        fetchRequest.predicate = NSPredicate(format: "uuid = %@", hasUUID as CVarArg)
        
        do {
            let loadedData = try context.fetch(fetchRequest)
            
            if let hasData = loadedData.first {
                context.delete(hasData)  // coredata 데이터 삭제
                
                // save data
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
            }
        } catch {
            print(error)
        }
        
        delegate?.didFinishSaveData()
        self.dismiss(animated: true, completion: nil)
    }
}

