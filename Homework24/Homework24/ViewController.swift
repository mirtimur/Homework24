import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        
    }
    
    func setUpTableView() {
        tableView.register(UINib(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: "CityTableViewCell")
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    // Возвращаем кол-во секций
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Возвращаем кол-во ячеек в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemType.numberOfItems
    }
    
    //Описываем ячейку
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let itemType = ItemType(item: indexPath.item),
              let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as? CityTableViewCell else { return UITableViewCell() }
        
        cell.configure(with: itemType.cityName, cityCode: itemType.cityCode)
        return cell
    }
}

extension ViewController{
    enum ItemType: Int, CaseIterable {
        case ny
        case toronto
        case minsk
        case madrid
        case rome
        case paris
        case seoul
        case sydney
        case tokyo
        case hawaii
        
        init?(item: Int) {
            guard let type = Self.allCases.first(where: { $0.rawValue == item }) else { return nil }
            
            self = type
        }
        
        var cityName: String {
            switch self {
            case .ny:
                return "New-York"
            case .toronto:
                return "Toronto"
            case .minsk:
                return "Minsk"
            case .madrid:
                return "Madrid"
            case .rome:
                return "Rome"
            case .paris:
                return "Paris"
            case .seoul:
                return "Seuol"
            case .sydney:
                return "Sydney"
            case .tokyo:
                return "Tokyo"
            case .hawaii:
                return "Hawaii"
            }
        }
        
        var cityCode: String {
            switch self {
            case .ny:
                "America/New_York"
            case .toronto:
                "Canada/Eastern"
            case .minsk:
                "Europe/Minsk"
            case .madrid:
                "Europe/Madrid"
            case .rome:
                "Europe/Rome"
            case .paris:
                "Europe/Paris"
            case .seoul:
                "Asia/Seoul"
            case .sydney:
                "Australia/Sydney"
            case .tokyo:
                "Japan"
            case .hawaii:
                "US/Hawaii"
            }
        }
        
        static var numberOfItems: Int {
            Self.allCases.count
        }
    }
}

