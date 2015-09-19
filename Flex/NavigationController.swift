//
//  ViewController.swift
//  Flex
//
//  Created by Alex Koh on 9/19/15.
//  Copyright (c) 2015 AlexKoh. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // create the request & response
        var request = NSMutableURLRequest(URL: NSURL(string: "https://sandbox-api.uber.com/v1/requests"), cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData, timeoutInterval: 5)
        var response: NSURLResponse?
        var error: NSError?
        
        // create some JSON data and configure the request
        let jsonString = "json=[{\"start_latitude\":\"37.334381\",\"start_longitude\":-121.89432\", \"product_id\":\"a1111c8c-c720-46c3-8534-2fcdd730040d\"}]"
        request.HTTPBody = jsonString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        request.HTTPMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // send the request
        NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: &error)
        
        // look at the response
        if let httpResponse = response as? NSHTTPURLResponse {
            println("HTTP response: \(httpResponse.statusCode)")
        } else {
            println("No HTTP response")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

