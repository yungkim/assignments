//
//  TaskModel.swift
//  02_bucket_list_crud
//
//  Created by Yung Kim on 7/19/16.
//  Copyright © 2016 Yung Kim. All rights reserved.
//

import Foundation
class TaskModel {
    static func getAllTasks(completionHandler: (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void) {
        let url = NSURL(string: "http://localhost:3000/tasks")
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: completionHandler)
        task.resume()
    }
}