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
    
       let b = sender as! UIButton
        setPriority = b.tag
    }
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dataPicker: UIDatePicker!
    @IBOutlet weak var hButton: UIButton!
    @IBOutlet weak var mButton: UIButton!
    @IBOutlet weak var lButton: UIButton!
    
    
    var priorityMatched = 1
    var setPriority:Int{
        get{return priorityMatched}
        set{
            priorityMatched = newValue
            switch newValue {
            case 1:
                self.hButton.selected = true
                self.mButton.selected = false
                self.lButton.selected = false
            case 2:
                self.hButton.selected = false
                self.mButton.selected = true
                self.lButton.selected = false
            case 3:
                self.hButton.selected = false
                self.mButton.selected = false
                self.lButton.selected = true
            default: break
                
            }
        }}

    
    override func viewDidLoad() {
        super.viewDidLoad()
navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .Plain, target: self, action: #selector(save))
        
    self.mButton.selected = true
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
