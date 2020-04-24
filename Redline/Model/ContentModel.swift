//
//  ContentModel.swift
//  Redline
//
//  Created by AnnaThomas on 23/04/20.
//  Copyright © 2020 QBurst Technologies. All rights reserved.
//

import Foundation

struct ContentModel: Codable {
    var id: Int?
    var title: String?
    var image: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title = "name"
        case image = "poster-image"
    }
}

extension ContentModel {
    /// Function that parses the response json to model
    /// - Parameters:
    ///     - json: json Dictionary
    /// - Returns: array of ContentModel
    static func parse(json: [Dictionary<String,Any>]) -> [ContentModel]? {
        if let jsonData = try? JSONSerialization.data(withJSONObject: json, options: []) {
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode([ContentModel].self, from: jsonData)
                return response
            }
            catch {
                debugPrint(error)
            }
        }
        return nil
    }
}
