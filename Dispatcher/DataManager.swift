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
  
  
  class func loadDataFromURL(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
    var session = NSURLSession.sharedSession()
    
    // Use NSURLSession to get data from an NSURL
    let loadDataTask = session.dataTaskWithURL(url, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
      if let responseError = error {
        completion(data: nil, error: responseError)
      } else if let httpResponse = response as? NSHTTPURLResponse {
        if httpResponse.statusCode != 200 {
//          var statusError = NSError(domain:"com.raywenderlich", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
            var statusError = NSError();
          completion(data: nil, error: statusError)
        } else {
          completion(data: data, error: nil)
        }
      }
    })
    
    loadDataTask.resume()
  }
    
    class func getArticleDataFromNYTWithSuccess(success: ((articleData: NSData!) -> Void)) {
        // call loadDataFromURL
        // This takes the URL and a completion closure that passes in an NSData object.
        loadDataFromURL(NSURL(string: articleURL)!, completion:{(data, error) -> Void in
            // Make sure the data exists using optional binding
            if let urlData = data {
                // Pass the data to the success closure
                success(articleData: urlData)

            }
        })
    }
    
}