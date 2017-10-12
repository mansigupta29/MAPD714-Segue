
import UIKit

class SingleComponentPickerViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var singlePicker: UIPickerView!
    
    private let characterName = ["Han Solo", "Luke Sykwalker", "Leia Organa", "Chewbacca", "Threepio", "Lando Carlissian"]
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    //Data Source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Data Source
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return characterName.count
    }

    @IBAction func onButtonPressed(_ sender: UIButton) {
        
        let row = singlePicker.selectedRow(inComponent: 0)
        let selected = characterName[row]
        let title = "You selected \(selected)"
        
        let alert = UIAlertController(
            title: title,
            message: "Thank You for choosing",
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(
            title: "You're welcome",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)

        
    }
    
    //Data Delegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return characterName[row]
    }
}
