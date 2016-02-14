//
//  FiltersViewController.swift
//  Yelp
//
//  Created by rcvasant on 2/13/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController {
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var customFilter: UITextField!
    @IBOutlet weak var segmentedView: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let choosenFilter:Int = defaults.integerForKey(filterKey) {
            segmentedView.selectedSegmentIndex = choosenFilter
        } else {
            segmentedView.selectedSegmentIndex = 0
            defaults.setInteger(segmentedView.selectedSegmentIndex, forKey: filterKey)
        }
        
        updateCustomFilterTextView()
    }
    
    func updateCustomFilterTextView() {
        
        customFilter.text = ""
        if segmentedView.selectedSegmentIndex != 5 {
            customFilter.hidden = true
        } else {
            customFilter.hidden = false
            if let term = defaults.stringForKey(customFilterKey) {
                customFilter.text = term
            } else {
                customFilter.text = ""
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func actionToChooseAFilter(sender: AnyObject) {
        defaults.setInteger(segmentedView.selectedSegmentIndex, forKey: filterKey)
        updateCustomFilterTextView()
    }
    
    override func viewWillDisappear(animated: Bool) {
        if(segmentedView.selectedSegmentIndex == 5) {
            if customFilter.text?.isEmpty == false {
             defaults.setValue(customFilter.text, forKey: customFilterKey)
            }
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
