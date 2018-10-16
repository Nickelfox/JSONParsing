//
//  ViewController.swift
//  JSONParsing-Example
//
//  Created by Ravindra Soni on 26/07/17.
//  Copyright © 2017 Nickelfox Soni. All rights reserved.
//

import UIKit
import JSONParsing

enum Test: String, JSONParseRawRepresentable {
    typealias RawValue = String
    case one = "one"
    case two = "two"
    case three
}

//let jsonData = "{\"data\": [\"one\",\"two\"]}"
let jsonData = "{\"data\": \"one\"}"
let data = jsonData.data(using: .utf8)!
struct Object: JSONParseable {
    
    let values: Test
    
    static func parse(_ json: JSON) throws -> Object {
        return try Object(values: json["data"].value())
    }
    
}



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        do {
            let json = try JSON(data: data)
            let object = try Object.parse(json)
            print(object.values)
        } catch {
            print(error)
        }

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

