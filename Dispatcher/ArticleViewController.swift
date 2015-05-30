//
//  ArticleViewController.swift
//  Dispatcher
//
//  Created by Jennifer Brisbane on 5/29/15.
//  Copyright (c) 2015 jellroll. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController, UITableViewDataSource {
    
//    var tableView : UITableView?
    var articles = [ArticleModel]()

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println("Count of articles is " + String(articles.count))
        return articles.count
//        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
//        var cell = UITableViewCell()
//        cell.textLabel?.text = articles[indexPath.row]
        println("headline in cellforrowatindexpath \(articles[indexPath.row].headline_main!)")
        println("web_url in cellforrowatindexpath \(articles[indexPath.row].web_url!)")
        println("pub_date in cellforrowatindexpath \(articles[indexPath.row].pub_date!)")
        println("abstract in cellforrowatindexpath \(articles[indexPath.row].abstract!)")
        cell.textLabel?.text = articles[indexPath.row].headline_main!
        cell.detailTextLabel?.text = articles[indexPath.row].web_url!
        
        return cell
        

    }
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
/*
Oldest article in New York Times archive
http://api.nytimes.com/svc/search/v2/articlesearch.json?q=new+york+times&page=2&sort=oldest&api-key=3155df98a1dcbf4ecaf1128e8883a99b:15:65271311
        
Articles containing "Romney" published on 01/01/2012
http://api.nytimes.com/svc/search/v2/articlesearch.json?fq=romney&facet_field=day_of_week&begin_date=20120101&end_date=20120101&api-key=3155df98a1dcbf4ecaf1128e8883a99b:15:65271311
*/
        
//        let articlesURL = NSURL(string: "https://api.github.com/search/repositories?q=learn+swift+language:swift&sort=stars&order=desc")

        let articlesURL = NSURL(string: "http://api.nytimes.com/svc/search/v2/articlesearch.json?fq=romney&facet_field=day_of_week&begin_date=20120101&end_date=20120101&api-key=3155df98a1dcbf4ecaf1128e8883a99b:15:65271311")
        
        
        // Optionally unwrap an NSData object with the contents of the URL.
        // This could fail for a variety of reasons (API rate limiting, no network connection, etc.) so an if/let is appropriate.
        if let JSONData = NSData(contentsOfURL: articlesURL!) {
            // Optionally unwrap the NSData into an NSDictionary using the NSJSONSerialization class.
            if let json = NSJSONSerialization.JSONObjectWithData(JSONData, options: nil, error: nil) as? NSDictionary {
                // Now that we have an NSDictionary representation of the JSON response,
                // we can look at the raw response in the browser to see that the actual
                // repository data is nested under the "items" key, so we optionally unwrap the items into an Array of NSDictionaries
                if let responseDict = json["response"] as? NSDictionary {
                    
                    if let articlesArray = responseDict["docs"] as? NSArray {
                        
                        // Iterate over the array of items, constructing a new ArticleModel object for each one, and adding it to the articles array.
                        for item in articlesArray {
                                
                            var headline_main : String?
                            
                            if let headline = item["headline"] as? NSDictionary {
                                headline_main = headline["main"] as? String
                            }
                            
                            var web_url = item["web_url"] as? String
                            var pub_date = item["pub_date"] as? String
                            var abstract = item["abstract"] as? String
                                
                            var infoDict : Dictionary<String,String> = ["headline_main":headline_main!,
                                                                        "web_url":web_url!,
                                                                        "pub_date":pub_date!,
                                                                        "abstract":abstract!]
                            
                            articles.append(ArticleModel(infoDict: infoDict as NSDictionary))
                            println("the item that was just added was \(item)")
                        }
                    }
                }
            }
        }
    }
}



