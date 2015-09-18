//
//  ViewController.swift
//  Todo
//
//  Created by Changshin Lee on 2015. 9. 11..
//  Copyright © 2015년 SKP. All rights reserved.
//

import UIKit
import MZFormSheetPresentationController

class ViewController: UIViewController, UITableViewDataSource {
    
    unowned let todoManager = TodoManager.sharedManager
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func showAddPopup(sender: AnyObject) {
        let navigationController = self.storyboard!.instantiateViewControllerWithIdentifier("Add") 
        let formSheetController = MZFormSheetPresentationController(contentViewController: navigationController)
        formSheetController.contentViewSize = CGSizeMake(250, 250)
        
        self.presentViewController(formSheetController, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoManager.numberOfTodos()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CELL", forIndexPath: indexPath)
        cell.textLabel?.text = todoManager.todoAt(indexPath.row).title
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.automaticallyAdjustsScrollViewInsets = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        todoManager.getList { (Int) -> Void in
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

