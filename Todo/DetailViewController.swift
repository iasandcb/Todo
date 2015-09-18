//
//  DetailViewController.swift
//  Todo
//
//  Created by nolgong on 2015. 9. 18..
//  Copyright © 2015년 SKP. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var date: String = "Date"
    var content : String = ""
    
    @IBOutlet weak var contentView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = date
        contentView.text = content
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
