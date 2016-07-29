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
    
    
    
    
    
     func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
     func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            
            let realm = try! Realm()
            let tmp:Task = Task()
            let cell:toDoNameCell = tableView.cellForRowAtIndexPath(indexPath) as! toDoNameCell
            tmp.date = cell.dateLabel.text!
            tmp.name = cell.titleLabel.text!
            switch cell.priorityImg {
            case "H":
                tmp.priority = 1
            case "M":
                tmp.priority = 2
            case "L":
                tmp.priority = 3
            default:
                break
            }
            
            let objectToDelete = realm.objects(Task.self).filter("name == %@ && date == %@", tmp.name, tmp.date).first
            
            try! realm.write {
                realm.delete(objectToDelete!)
            }
       
            arrayOfTasks = Array(realm.objects(Task.self))
            myTableView.reloadData()
        }
        
    }
    
}

