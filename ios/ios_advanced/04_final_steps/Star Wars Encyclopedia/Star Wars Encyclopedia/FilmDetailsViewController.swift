//
//  FilmDetailsViewController.swift
//  Star Wars Encyclopedia
//
//  Created by Yung Kim on 7/19/16.
//  Copyright © 2016 Yung Kim. All rights reserved.
//

import UIKit

protocol FilmDetailsViewControllerDelegate
{
//    func passIndex(count: Int)
}

class FilmDetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var openingCrawlLabel: UILabel!

    var getSpecies = false
    var index: Int?
    var url: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("Film Details URL: \(url!)")
        getData(url!)
    }
    func getData(url: String?) {
        StarWarsModel.getPerson(url) { // Notice how we are passing a block to the function (this becomes "completionHandler" in the function definition in StarWarsModel.swift)
            data, response, error in
            do {
                
                // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let film = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                    print(film)
                    dispatch_async(dispatch_get_main_queue()) {
                        self.titleLabel.text = String("\(film.valueForKey("title")!)")
                        self.releaseDateLabel.text = String("Release Date: \(film.valueForKey("release_date")!)")
                        self.directorLabel.text = String("Director: \(film.valueForKey("director")!)")
                        self.openingCrawlLabel.text = String("Opening Crawl: \(film.valueForKey("opening_crawl")!)")
                                           }
                }
            } catch {
                print("Something went wrong")
            }
        }
    }
}