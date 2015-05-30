//
//  DataManager.swift
//


import Foundation


/* 
Oldest article in New York Times archive
http://api.nytimes.com/svc/search/v2/articlesearch.json?q=new+york+times&page=2&sort=oldest&api-key=3155df98a1dcbf4ecaf1128e8883a99b:15:65271311

Articles containing "Romney" published on 01/01/2012
http://api.nytimes.com/svc/search/v2/articlesearch.json?fq=romney&facet_field=day_of_week&begin_date=20120101&end_date=20120101&api-key=3155df98a1dcbf4ecaf1128e8883a99b:15:65271311
*/

let articleURL = "http://api.nytimes.com/svc/search/v2/articlesearch.json?fq=romney&facet_field=day_of_week&begin_date=20120101&end_date=20120101&api-key=3155df98a1dcbf4ecaf1128e8883a99b:15:65271311"


class DataManager {
    
    // class-level method, a.k.a. "type method"
    // takes 2 parameters: an NSURL, and a closure referred to as "completion" that gets passed
    //  in from getArticleDataFromNytWithSuccess
    // returns nothing
    class func loadDataFromURL(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
    
    var session = NSURLSession.sharedSession()
    
    // Use NSURLSession to get data from an NSURL
    let loadDataTask = session.dataTaskWithURL(url, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
        // if we get an error, execute the clode block with nil data
        if let responseError = error {
            completion(data: nil, error: responseError)
        } else if let httpResponse = response as? NSHTTPURLResponse {
            if httpResponse.statusCode != 200 {
                var statusError = NSError();
                completion(data: nil, error: statusError)
            } else {
                completion(data: data, error: nil)
            }
        }
    }) // end of the chunk of code that gets passed to session.dataTaskWithURL
    
    loadDataTask.resume()
  }
    
    // class-level method, a.k.a. "type method"
    // takes 1 parameter: a closure referred to as "success" that gets passed in from viewDidLoad
    // returns nothing
    class func getArticleDataFromNYTWithSuccess(success: (articleData: NSData!) -> Void) {

        // This takes the URL and a completion closure that passes in an NSData object.
        loadDataFromURL(NSURL(string: articleURL)!, completion:{(data, error) -> Void in
            // Make sure the data exists using optional binding
            if let urlData = data {
                // Pass the data to the success closure
                // (In other words, do all the other stuff first, and then execute the clode block
                //  that was passed into this function.)
                success(articleData: urlData)
                
//              (articleData) -> Void in
//              let json = JSON(data: articleData)
//              // Retrieve list of articles with SwiftyJSON
//              if let articleArray = json["response"]["docs"].array {
//                  // Create a mutable array to hold the objects to be created.
//                  var articles = [ArticleModel]()
//                  // Loop through all the items and create a new instance of ArticleModel from the JSON
//                  for articleDict in articleArray {
//                      var headline: String? = articleDict["headline"]["main"].string
//                      var web_url: String? = articleDict["web_url"].string
//                      var pub_date: String? = articleDict["pub_date"].string
//                      var article = ArticleModel(headline: headline, web_url: web_url, pub_date: pub_date)
//                      self.articles.append(article)
//                  }
//                  // Print the new objects out to the debugger
//                  println(self.articles)
//              } 

                
            }
        }) // end of the chunk of code that gets passed to loadDataFromURL
        
    } // end of getArticleDataFromNYTWithSuccess method declaration

}