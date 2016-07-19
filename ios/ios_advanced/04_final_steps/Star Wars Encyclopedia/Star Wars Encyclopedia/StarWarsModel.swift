//
//  StarWarsModel.swift
//  Star Wars Encyclopedia
//
//  Created by Yung Kim on 7/18/16.
//  Copyright © 2016 Yung Kim. All rights reserved.
//

import Foundation
class StarWarsModel {
    // Note that we are passing in a function to the getAllPeople method (similar to our use of callbacks in JS). This function will allow the ViewController that calls this method to dictate what runs upon completion. Notice the signature or type for the function that we are passing in matches the
    static func getAllPeople(url: String?, completionHandler: (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void) {
        // Specify the url that we will be sending the GET Request to
        let url = NSURL(string: url!)
        // Create an NSURLSession to handle the request tasks
        let session = NSURLSession.sharedSession()
        // Create a "data task" which will request some data from a URL and then run the completion handler that we are passing into the getAllPeople function itself
        let task = session.dataTaskWithURL(url!, completionHandler: completionHandler)
        // Actually "execute" the task. This is the line that actually makes the request that we set up above
        task.resume()
    }
    
    static func getAllFilms(completionHandler: (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void) {
        // Specify the url that we will be sending the GET Request to
        let url = NSURL(string: "http://swapi.co/api/films/")
        // Create an NSURLSession to handle the request tasks
        let session = NSURLSession.sharedSession()
        // Create a "data task" which will request some data from a URL and then run the completion handler that we are passing into the getAllPeople function itself
        let task = session.dataTaskWithURL(url!, completionHandler: completionHandler)
        // Actually "execute" the task. This is the line that actually makes the request that we set up above
        task.resume()
    }

    static func getPerson(url: String?, completionHandler: (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void) {
        // Specify the url that we will be sending the GET Request to
        let url = NSURL(string: url!)
        // Create an NSURLSession to handle the request tasks
        let session = NSURLSession.sharedSession()
        // Create a "data task" which will request some data from a URL and then run the completion handler that we are passing into the getAllPeople function itself
        let task = session.dataTaskWithURL(url!, completionHandler: completionHandler)
        // Actually "execute" the task. This is the line that actually makes the request that we set up above
        task.resume()
    }
    
    static func getFilm(url: String?, completionHandler: (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void) {
        // Specify the url that we will be sending the GET Request to
        let url = NSURL(string: url!)
        // Create an NSURLSession to handle the request tasks
        let session = NSURLSession.sharedSession()
        // Create a "data task" which will request some data from a URL and then run the completion handler that we are passing into the getAllPeople function itself
        let task = session.dataTaskWithURL(url!, completionHandler: completionHandler)
        // Actually "execute" the task. This is the line that actually makes the request that we set up above
        task.resume()
    }
    
}