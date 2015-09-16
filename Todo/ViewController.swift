//
//  ViewController.swift
//  Todo
//
//  Created by Changshin Lee on 2015. 9. 11..
//  Copyright © 2015년 SKP. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CELL", forIndexPath: indexPath)
        cell.textLabel?.text = "OK"
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.automaticallyAdjustsScrollViewInsets = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

