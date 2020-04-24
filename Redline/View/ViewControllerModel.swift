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
    var pageNumber = -1
    
    /// Function that returns the model for the cell at indexPath
    /// - Parameters:
    ///     - indexPath : the index path related to cell
    /// - Returns: ContentModel object at index path
    func contentModel(at indexPath: IndexPath) -> ContentModel {
        return contentModels[indexPath.row]
    }
    
    /// Function that returns number of rows
    /// - Returns: Total count of json models
    func numberOfRows() -> Int {
        return contentModels.count
    }

    /// Function that gets the next set of data from json
    /// - Parameters:
    ///     - completion: Completion handler
    func getNextSet(completion:() -> Void) {
        pageNumber+=1
        getJsonData {
            completion()
        }
    }
    
    /// Function that retrieves the json file and parse it
    /// - Parameters:
    ///     - completion: Completion handler

    func getJsonData(completion:() -> Void) {
        if pageNumber >= 0 && pageNumber < 3 {
            if let url = Bundle.main.url(forResource: Constants.apiFileName[pageNumber], withExtension: Constants.jsonExtension) {
                do {
                    let data = try Data(contentsOf: url)
                    // serialize the data as json using JSONSerialization
                    let json = try JSONSerialization.jsonObject(with: data) as! [String: Any]
                    // get json key value for key "page"
                    let page = json[Constants.jsonKeyPage] as! [String: Any]
                    // get json key value for key "content-items"
                    let contentItems = page[Constants.jsonKeyContentItems] as! [String:Any]
                    // get json key value for key "content"
                    let content = contentItems[Constants.jsonKeyContent] as! [Dictionary<String, Any>]
                    // get the list of content models appended to the view model variable
                    self.contentModels =  self.contentModels + ContentModel.parse(json: content)!
                    completion()
                }
                catch {
                    print(error)
                    return
                }
            }
        }
    }
}
