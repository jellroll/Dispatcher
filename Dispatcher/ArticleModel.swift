//
//  ArticleModel.swift
//

import Foundation

class ArticleModel: NSObject, Printable {

//    let headline: String
//    let web_url: String
//    let pub_date: String
//    
//    // This is what will show up if we print the object
//    override var description: String {
//        return "headline: \(headline), web_url: \(web_url), pub_date: \(pub_date)\n"
//    }
//    
//    init(headline: String?, web_url: String?, pub_date: String?) {
//        self.headline = headline ?? ""
//        self.web_url = web_url ?? ""
//        self.pub_date = pub_date ?? ""
//    }

    var headline_main: String?
    var web_url: String?
    var pub_date: String?
    var abstract: String?
    
    // initializer that accepts a dictionary parameter
    init(infoDict: NSDictionary) {
        
        self.headline_main = infoDict["headline_main"] as? String
        self.web_url = infoDict["web_url"] as? String
        self.pub_date = infoDict["pub_date"] as? String
        self.abstract = infoDict["abstract"] as? String
    }
//
//    // This is what will show up if we print the object
//    override var description: String {
//        return "headline: \(headline), web_url: \(web_url), pub_date: \(pub_date)\n"
//    }
    
    
//    var name: String?
//    var desc: String?
//    var html_url: String?
//    
//    init(json: NSDictionary) {
//        self.name = json["name"] as? String
//        self.desc = json["description"] as? String
//        self.html_url = json["html_url"] as? String
//    }
}