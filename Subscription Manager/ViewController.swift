

import UIKit

struct Subscription{
    
    static var lastId = -1
    var subscriptionID = Subscription.createNewId()
    var subscriptionName: String
    var startDate: UIDatePicker
    var endDate: UIDatePicker
    var price: String
    var monthOrYear :Int
    var dayleft : Int
    
    
    static func daysBetweenDates(endDate: UIDatePicker) -> Int {
        let daydate = Date()
        let end_Date = endDate.date
        let calendar = Calendar.current
        let components = calendar.dateComponents([Calendar.Component.day], from: daydate, to: end_Date)
        return components.day!
    }
  
    
    static func createNewId() -> Int {
       self.lastId += 1
       return (self.lastId)
   }
  

}
class ViewController: UIViewController {

    @IBOutlet weak var monthOrYear: UISegmentedControl!
    @IBOutlet weak var endDate: UIDatePicker!
    @IBOutlet weak var startDate: UIDatePicker!
    @IBOutlet weak var sPrice: UITextField!
    @IBOutlet weak var sName: UITextField!
    
    var indexPath = 0
    var name = ""
    var price = ""
    var start_date : UIDatePicker!
    var end_date : UIDatePicker!
    var leftDays = 0
 
    var arrSubscription : [Subscription]!
    
    
    @IBAction func addSubscription(_ sender: Any) {
        
        
        arrSubscription.append(Subscription(
            subscriptionName: sName.text!,
            startDate: startDate!,
            endDate: endDate!,
            price:sPrice.text!,
            monthOrYear: monthOrYear.selectedSegmentIndex,
            dayleft: Subscription.daysBetweenDates(endDate: endDate)
        ))
        
        print(arrSubscription)
        performSegue(withIdentifier: "goBack", sender: self)
    }
    
//     func updateArray(inexpath: Int, name : String, price : String, start_date : UIDatePicker, end_date :UIDatePicker , MorY :Int, days : Int){
//
//        arrSubscription[inexpath].subscriptionName = name
//        arrSubscription[inexpath].price = price
//        arrSubscription[inexpath].startDate = start_date
//        arrSubscription[inexpath].endDate = end_date
//        arrSubscription[inexpath].monthOrYear = MorY
//        arrSubscription[inexpath].dayleft = days
//
//        print(arrSubscription)
//        performSegue(withIdentifier: "goBack", sender: self)
//
//    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tableVC = segue.destination as! SubscriptionTableTableViewController
        tableVC.yourArray = arrSubscription
        
//        let detVC = segue.destination as! detailsViewController
//        detVC.index_path = indexPath
//        detVC.name = name
//        detVC.price = price
//        detVC.start_date = start_date
//        detVC.end_date = end_date
//        detVC.reminingDays = leftDays

        
        
    }

}

