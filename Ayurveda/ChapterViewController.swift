
//  ChapterViewController.swift
//
// Show a single HTML file resource in a WebView.

import UIKit

class ChapterViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!

    var resource = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false // Prevents extra whitespace in WebView
        if let url = Bundle.main.url(forResource: resource, withExtension: "") {
            webView.loadRequest(URLRequest(url: url))
            }
        else {
            print("Can't load resource: ", resource)
            }
        }
}
