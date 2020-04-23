//
//  ViewControllerModel.swift
//  Redline
//
//  Created by AnnaThomas on 23/04/20.
//  Copyright © 2020 QBurst Technologies. All rights reserved.
//

import Foundation

class ViewControllerModel {
    var contentModels = [ContentModel]()
    
    /// Function that retrieves the json file and parse it
    func getJsonData() {
        if let url = Bundle.main.url(forResource: "CONTENTLISTINGPAGE-PAGE1", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let json = try JSONSerialization.jsonObject(with: data) as! [String: Any]
                let page = json[Constants.jsonKeyPage] as! [String: Any]
                let contentItems = page[Constants.jsonKeyContentItems] as! [String:Any]
                let content = contentItems[Constants.jsonKeyContent] as! [Dictionary<String, Any>]
                self.contentModels = ContentModel.parse(json: content)!
            }
            catch {
                print(error)
                return
            }
        }
    }
}
