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
    static func addTaskWithObjective(objective: String, completionHandler: (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void) {
        // Create the url to request
        if let urlToReq = NSURL(string: "http://localhost:3000/tasks") {
            // Create an NSMutableURLRequest using the url. This Mutable Request will allow us to modify the headers.
            let request = NSMutableURLRequest(URL: urlToReq)
            // Set the method to POST
            request.HTTPMethod = "POST"
            // Create some bodyData and attach it to the HTTPBody
            let bodyData = "objective=\(objective)"
            request.HTTPBody = bodyData.dataUsingEncoding(NSUTF8StringEncoding)
            // Create the session
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithRequest(request, completionHandler: completionHandler)
            print(request.HTTPBody)
            task.resume()
        }
    }
    static func deleteTaskWithId(id: Int, completionHandler: (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void) {
        // Create the url to request
        if let urlToReq = NSURL(string: "http://localhost:3000/tasks/" + String(id)) {
            // Create an NSMutableURLRequest using the url. This Mutable Request will allow us to modify the headers.
            let request = NSMutableURLRequest(URL: urlToReq)
            request.HTTPMethod = "DELETE"
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithRequest(request, completionHandler: completionHandler)
            task.resume()
        }
    }
    static func editTaskWithId(id: Int, objective: String, completionHandler: (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void) {

        if let urlToReq = NSURL(string: "http://localhost:3000/tasks/update") {
            // Create an NSMutableURLRequest using the url. This Mutable Request will allow us to modify the headers.
            let request = NSMutableURLRequest(URL: urlToReq)
            // Set the method to POST
            request.HTTPMethod = "POST"
            // Create some bodyData and attach it to the HTTPBody
            let bodyData = "id=\(id)&objective=\(objective)"
            request.HTTPBody = bodyData.dataUsingEncoding(NSUTF8StringEncoding)
            // Create the session
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithRequest(request, completionHandler: completionHandler)
            print(request.HTTPBody)
            task.resume()
        }
    }


}