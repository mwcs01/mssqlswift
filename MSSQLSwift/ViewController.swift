//
//  ViewController.swift
//  MSSQLSwift
//
//  Created by Jim Baughman on 4/6/17.
//  Copyright © 2017 MWCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SQLClientDelegate {
    
    // Handles errors from the SQLClient
    func error(_ error: String!, code: Int32, severity: Int32) {
        print("\(error!) \(code) \(severity)")
    }
    
    //MARK: Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        let client = SQLClient.sharedInstance()!
        client.delegate = self
        client.connect("ServerNameOrIP", username: "cool", password: "cool", database: "database") { success in
            client.execute("SELECT * FROM table", completion: { (_ results: ([Any]?)) in
                for table in results as! [[[String:AnyObject]]] {
                    for row in table {
                        for (columnName, value) in row {
                            print("\(columnName) = \(value)")
                        }
                    }
                }
                client.disconnect()
            })
        }
    }
}
