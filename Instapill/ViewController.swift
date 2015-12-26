//
//  ViewController.swift
//  Instapill
//
//  Created by Sherif on 12/23/15.
//  Copyright © 2015 Instapill. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    //MARK: Properties
    
    @IBOutlet weak var mainWebView: UIWebView!
    @IBOutlet weak var loadingView: UIView!
    var initLoad = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainWebView.hidden = true
        
        // Handle the web view’s delegate callbacks.
        mainWebView.delegate = self
        
        let url = NSURL(string: "https://instapill.com")
        let request = NSURLRequest(URL: url!)
        
        mainWebView.loadRequest(request)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: UIWebViewDelegate
    
    func webView(webView: UIWebView,
        shouldStartLoadWithRequest request: NSURLRequest,
        navigationType: UIWebViewNavigationType) -> Bool {
            
            if request.URL!.absoluteString.containsString("facebook.com") || request.URL!.absoluteString.containsString("twitter.com") || request.URL!.absoluteString.containsString("goo.gl") {
                
                // Load external URLs
                UIApplication.sharedApplication().openURL(request.URL!)
                return false
            }
            
            return true
    }

    func webViewDidFinishLoad(webView: UIWebView){
        if initLoad == true {
            loadingView.hidden = true
            mainWebView.hidden = false
            initLoad = false
        }
    }
    
    //MARK: Actions
    
}

