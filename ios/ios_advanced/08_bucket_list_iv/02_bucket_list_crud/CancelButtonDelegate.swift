//
//  CancelButtonDelegate.swift
//  02_bucket_list_crud
//
//  Created by Yung Kim on 7/12/16.
//  Copyright © 2016 Yung Kim. All rights reserved.
//

import UIKit
protocol CancelButtonDelegate: class {
    func cancelButtonPressedFrom(controller: UIViewController)
}