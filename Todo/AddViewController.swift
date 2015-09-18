//
//  AddViewController.swift
//  Todo
//
//  Created by nolgong on 2015. 9. 18..
//  Copyright © 2015년 SKP. All rights reserved.
//

import UIKit

protocol AddDelegate: class {
    func todoAdded()
}

class AddViewController: UIViewController {

    @IBOutlet weak var contentView: UITextView!
    weak var delegate: AddDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func done(sender: AnyObject) {
        TodoManager.sharedManager.addTodo(contentView.text, dueDate: NSDate()) { (Bool) -> Void in
            self.delegate?.todoAdded()
            self.dismissViewControllerAnimated(true, completion: nil)
        }
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
