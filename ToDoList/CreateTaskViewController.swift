//
//  CreateTaskViewController.swift
//  ToDoList
//
//  Created by Lukasz Matuszczak on 29/07/16.
//
//

import UIKit
import RealmSwift

class CreateTaskViewController: UIViewController {

    @IBAction func priorityButtonClicked(sender: AnyObject) {
    }
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dataPicker: UIDatePicker!
    
   
    @IBOutlet weak var hButton: UIButton!
    @IBOutlet weak var mButton: UIButton!
    @IBOutlet weak var lButton: UIButton!
    var priorityMatched = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .Plain, target: self, action: #selector(save))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func save(sender: AnyObject) {
        let task:Task = Task()
        task.name = nameTextField.text!
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        let strDate = dateFormatter.stringFromDate(dataPicker.date)
        task.date = strDate
        
        task.priority = priorityMatched
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(task)
        }
        self.navigationController?.popViewControllerAnimated(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
