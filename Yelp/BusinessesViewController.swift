//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UIScrollViewDelegate {

    var businesses: [Business]!
    var filteredBusiness: [Business]!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationView: UINavigationItem!
    var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 120
        
        searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.delegate = self
        
        self.navigationView.titleView = searchBar
        
        requestRestuarants()
        
/* Example of Yelp search with more search options specified
        Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            
            for business in businesses {
                print(business.name!)
                print(business.address!)
            }
        }
*/

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func requestRestuarants() {
        
        var offset:Int = 0
        if(businesses != nil) {
            offset = businesses.count
        }
        Business.searchWithTermAndOffset("Thai", offset: offset, completion: { (businesses: [Business]!, error: NSError!) -> Void in
            
            self.isMoreDataLoading = false
            if(self.businesses == nil) {
                self.businesses = businesses
                self.filteredBusiness = businesses
                self.tableView.reloadData()
            } else if( businesses != nil && businesses.count > 0){
                self.businesses.appendContentsOf(businesses)
                self.filteredBusiness = self.businesses
                self.tableView.reloadData()
            }
        })
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(filteredBusiness != nil) {
            return filteredBusiness.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell", forIndexPath: indexPath) as! BusinessCell
        cell.index = indexPath.row
        cell.business = filteredBusiness[indexPath.row]

        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredBusiness = [Business]()
        if searchText.isEmpty == false {
            for (_, restaurant) in (businesses?.enumerate())! {
                let name = restaurant.name!
                if(name.lowercaseString.containsString(searchText.lowercaseString)) {
                    filteredBusiness.append(restaurant)
                }
            }
        } else {
            filteredBusiness = businesses
        }
        
        tableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
        
        filteredBusiness = businesses
        tableView.reloadData()
    }
    
    var isMoreDataLoading = false
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if(!isMoreDataLoading) {
            
            // Calculate the position of one screen length before the bottom of the results
            let scrollViewContentHeight = tableView.contentSize.height
            let scrollOffsetThreshold = scrollViewContentHeight - (3 * tableView.bounds.size.height)
            
            if(scrollView.contentOffset.y > scrollOffsetThreshold && tableView.dragging) {
                isMoreDataLoading = true
                
                requestRestuarants()
            }
        }
    }
    
//    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        print("\(indexPath.row)")
//        if(indexPath.row % 2 == 0) {
//            cell.backgroundColor = UIColor.whiteColor()
//        }
//    }

}
