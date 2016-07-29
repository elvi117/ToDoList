//
//  ViewController.swift
//  ToDoList
//
//  Created by Lukasz Matuszczak on 28/07/16.
//
//

import UIKit
import RealmSwift
class ViewController: UIViewController, UITableViewDelegate {

  
    @IBOutlet weak var myTableView: UITableView!
   var arrayOfTasks = [Task]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBarHidden = false
    }

    override func viewDidAppear(animated: Bool) {
        let realm = try! Realm()
        arrayOfTasks = Array(realm.objects(Task.self))
       myTableView.reloadData()

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfTasks.count
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("toDoNameCell", forIndexPath: indexPath) as! toDoNameCell
        cell.titleLabel.text = arrayOfTasks[indexPath.row].name
        cell.dateLabel.text = arrayOfTasks[indexPath.row].date
        switch arrayOfTasks[indexPath.row].priority {
        case 1:
            cell.priorityImg.text = "H"
            cell.priorityImg.backgroundColor = UIColor.redColor()
        case 2:
            cell.priorityImg.text = "M"
            cell.priorityImg.backgroundColor = UIColor.orangeColor()
        case 3:
            cell.priorityImg.text = "L"
            cell.priorityImg.backgroundColor = UIColor.greenColor()
        default:
            break
        }
        return cell
    }
    
     func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return .None
    }
    
     func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
     func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {

    }


    
    
}

