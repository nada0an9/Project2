
import UIKit

class SubscriptionTableTableViewController: UITableViewController, UpdateDelegate {
    
    func updateDetails(name: String) {
        yourArray[indexpath].subscriptionName = name
    }
    

    var yourArray = [Subscription]()
    var id = 0
    var name = ""
    var price = ""
    var yearOrMonth = 0
    var start_date : UIDatePicker!
    var end_date : UIDatePicker!
    var reminingDays = 0
    var indexpath = 0

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
   
    }
 

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show_det"
        {
            let detailsVC = segue.destination as! detailsViewController
            detailsVC.delegate = self
            detailsVC.id = id
            detailsVC.name = name
            detailsVC.price = price
            detailsVC.startDate = start_date
            detailsVC.endDate = end_date
            detailsVC.reminingDays = reminingDays
            detailsVC.yearOrMonth = yearOrMonth
        }
        else{
        let oneClass = segue.destination as! ViewController
         oneClass.arrSubscription = yourArray
            oneClass.indexPath = indexpath
            
            }
    }
        


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return yourArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellitem", for: indexPath)
            
        cell.textLabel?.text = yourArray[indexPath.row].subscriptionName
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       id = yourArray[indexPath.row].subscriptionID
       name = yourArray[indexPath.row].subscriptionName
        price = yourArray[indexPath.row].price
        start_date = yourArray[indexPath.row].startDate
        end_date = yourArray[indexPath.row].endDate
        reminingDays = yourArray[indexPath.row].dayleft
        yearOrMonth = yourArray[indexPath.row].monthOrYear
        indexpath = indexPath.row
        performSegue(withIdentifier: "show_det", sender: self)
        
        

    }


 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
