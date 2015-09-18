//
//  ViewController.swift
//  Todo
//
//  Created by Changshin Lee on 2015. 9. 11..
//  Copyright © 2015년 SKP. All rights reserved.
//

import UIKit
import MZFormSheetPresentationController

class ViewController: UIViewController, UITableViewDataSource, AddDelegate {
    
    unowned let todoManager = TodoManager.sharedManager
    let dateFormatter = NSDateFormatter()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func showAddPopup(sender: AnyObject) {
        let addViewController = self.storyboard!.instantiateViewControllerWithIdentifier("Add") as! AddViewController
        addViewController.delegate = self
        let formSheetController = MZFormSheetPresentationController(contentViewController: addViewController)
        formSheetController.contentViewSize = CGSizeMake(250, 250)
        
        self.presentViewController(formSheetController, animated: true, completion: nil)
    }
    
    func refreshList() {
        todoManager.getList { (Int) -> Void in
            self.tableView.reloadData()
        }
    }

    // MARK: UIViewController
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let todo = todoManager.todoAt(tableView.indexPathForSelectedRow!.row)
        let dest = segue.destinationViewController as! DetailViewController
        dest.date = dateFormatter.stringFromDate(todo.dueDate)
        dest.content = todo.title
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "yyyy-MM-dd"
//        self.automaticallyAdjustsScrollViewInsets = true
        refreshList()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: AddDelegate
    
    func todoAdded() {
        refreshList()
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoManager.numberOfTodos()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CELL", forIndexPath: indexPath)
        let todo = todoManager.todoAt(indexPath.row)
        cell.textLabel?.text = todo.title
        cell.detailTextLabel?.text = dateFormatter.stringFromDate(todo.dueDate)
        return cell
    }
}

