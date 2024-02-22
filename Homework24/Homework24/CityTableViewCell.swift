import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var date: UILabel!
    
    func configure(with name: String, cityCode: String) {
        cityName.text = name
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        dateFormatter.timeZone = TimeZone(identifier: cityCode)
        let data = Date()
        let dateString = dateFormatter.string(from: data)
        date.text = "🕑\(dateString)"
    }
}
