
import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        let date = datePicker.date
        
    }

}
