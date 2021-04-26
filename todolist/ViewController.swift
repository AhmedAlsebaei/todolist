//
//  ViewController.swift
//  todolist
//
//  Created by ahmed aelsebaay on 18/04/2021.
//

import UIKit
import PMSuperButton
class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource
{


    @IBOutlet weak var taskstable: UITableView!
    var tasks = [task]()
    var tasks_2 = [  String? ]()

    @IBOutlet weak var poupview: UIView!
    
    @IBOutlet weak var popuptextfield: UITextField!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.taskstable.delegate=self
        self.taskstable.dataSource=self
        
      
        self.poupview.layer.cornerRadius=15
        self.tasks_2 = UserDefaults.standard .value(forKey: "tasks")as! [String]

        self.taskstable.reloadData()

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = self.tasks_2 [indexPath.row]
        let cell = self.taskstable.dequeueReusableCell(withIdentifier: "taskcell")as!taskcell
        cell.tasklabel.text=task

return cell

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.tasks_2.count

    }

    @IBAction func preesdonaddbutton(_ sender: Any) {
        self.popuptextfield.becomeFirstResponder()
        
        self.poupview.alpha = 0
        self.poupview.isHidden=false
        UIView.animate(withDuration: 1, animations: {
                        self.poupview.alpha = 1}, completion: nil)
        self.taskstable.reloadData()
 }
    
    @IBAction func popupaddabutton(_ sender: UIButton) {
        if (self.popuptextfield.text?.isEmpty == false) {
            let newtask = task.init(taskname: self.popuptextfield.text)
           let newtask_2  = self.popuptextfield.text
            self.tasks_2.append(newtask_2)
            self.poupview.isHidden=true
            self.popuptextfield.resignFirstResponder()
            self.popuptextfield.text=""
            self.taskstable.reloadData()
            UserDefaults.standard.setValue(self.tasks_2, forKey: "tasks")
        
    }
    
    }
    @IBAction func popupcanclebutton(_ sender: UIButton) {
        self.poupview.alpha = 1
        self.popuptextfield.resignFirstResponder()

        UIView.animate(withDuration: 1, animations: {
                        self.poupview.alpha = 0 }, completion:{ finished in
                            self.poupview.isHidden = true
                            self.popuptextfield.text=""
                            UserDefaults.standard.setValue(self.tasks_2, forKey: "tasks")

                                
                        } )
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if ( editingStyle == .delete){
            self.tasks_2.remove (at: indexPath.row )
            self.taskstable.deleteRows(at: [indexPath], with: .fade)
        }
        
    }

}
