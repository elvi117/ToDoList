//
//  CreateTaskViewController.swift
//  ToDoList
//
//  Created by Lukasz Matuszczak on 29/07/16.
//
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBAction func priorityButtonClicked(sender: AnyObject) {
    }
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dataPicker: UIDatePicker!
    
   
    @IBOutlet weak var hButton: UIButton!
    @IBOutlet weak var mButton: UIButton!
    @IBOutlet weak var lButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .Plain, target: self, action: #selector(save))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func save(sender: AnyObject) {
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
