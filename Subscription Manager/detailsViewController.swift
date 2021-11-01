//
//  detailsViewController.swift
//  Subscription Manager
//
//  Created by Nada Alansari on 25/03/1443 AH.
//

import UIKit

protocol UpdateDelegate {
    
    func updateDetails(name: String)
    
}

class detailsViewController: UIViewController {
    var delegate: UpdateDelegate!
    var id = 0
    var name = ""
    var price = ""
    var yearOrMonth = 0
    var start_date :UIDatePicker!
    var end_date : UIDatePicker!
    var reminingDays = 0
    var index_path = 0
    
    @IBOutlet weak var sPRICE: UITextField!
    @IBOutlet weak var endDate: UIDatePicker!
    @IBOutlet weak var startDate: UIDatePicker!
    @IBOutlet weak var YearOrMonth: UISegmentedControl!
    @IBOutlet weak var sName: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
         let oneClass = segue.destination as! ViewController
        oneClass.name = sName.text!
        oneClass.price = sPRICE.text!
        oneClass.start_date = startDate
        oneClass.end_date = endDate
        oneClass.leftDays = reminingDays
        oneClass.indexPath = index_path

       }
    
    @IBAction func updateBtn(_ sender: Any) {
        


    }
    
    override func viewDidLoad() {
        sName.text = name
        sPRICE.text = price
        startDate = start_date
        endDate = end_date
        YearOrMonth.selectedSegmentIndex = yearOrMonth
        super.viewDidLoad()

    }
    

}
