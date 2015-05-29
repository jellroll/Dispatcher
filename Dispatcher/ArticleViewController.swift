//
//  ArticleViewController.swift
//  Dispatcher
//
//  Created by Jennifer Brisbane on 5/29/15.
//  Copyright (c) 2015 jellroll. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataManager.getArticleDataFromNYTWithSuccess { (articleData) -> Void in
            //        let json = JSON(data: iTunesData)
            let json = JSON(data: articleData)
            //        if let appName = json["feed"]["entry"][0]["im:name"]["label"].string {
            //            println("NSURLSession: \(appName)")
            //        }
            
            // Retrieve the whole list of apps with SwiftyJSON
            //        if let appArray = json["feed"]["entry"].array {
            // Retrieve the whole list of articles with SwiftyJSON
            //        if let appArray = json["response"]["docs"].array {
            if let articleArray = json["response"]["docs"].array {
                
                // Create a mutable array to hold the objects to be created.
                //            var apps = [AppModel]()
                var articles = [ArticleModel]()
                
                // Loop through all the items and create a new instance of AppModel from the JSON data
                for articleDict in articleArray {
                    var headline: String? = articleDict["headline"]["main"].string
                    var web_url: String? = articleDict["web_url"].string
                    var pub_date: String? = articleDict["pub_date"].string
                    
                    var article = ArticleModel(headline: headline, web_url: web_url, pub_date: pub_date)
                    articles.append(article)
                }
                
                // Print the new objects out to the debugger
                println(articles)
            }
        }
        
        
    }
}



