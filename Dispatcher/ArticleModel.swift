//
//  ArticleModel.swift
//

import Foundation

class ArticleModel: NSObject, Printable {

    let headline: String
    let web_url: String
    let pub_date: String
    
    override var description: String {
        return "headline: \(headline), web_url: \(web_url), pub_date: \(pub_date)\n"
    }
    
    init(headline: String?, web_url: String?, pub_date: String?) {
        self.headline = headline ?? ""
        self.web_url = web_url ?? ""
        self.pub_date = pub_date ?? ""
    }

}