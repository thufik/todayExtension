//
//  TodayViewController.swift
//  Today Widget
//
//  Created by EquipeSuporteAplicacao on 4/30/18.
//  Copyright © 2018 EquipeSuporteAplicacao. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var lbl: UILabel!
    
    private var internalContador = 0
    
    var contador : Int{
        internalContador = internalContador + 1
        return internalContador
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        // Do any additional setup after loading the view from its nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.lbl.text = "\(contador)"
    }
    
    @IBAction func openFirstViewController(_ sender: UIButton) {
        if let url = URL(string : "open://firstview"){
            self.extensionContext?.open(url, completionHandler : nil)
        }
    }
    
    @IBAction func openSecondViewController(_ sender: UIButton) {
        if let url = URL(string : "open://secondview"){
            self.extensionContext?.open(url, completionHandler : nil)
        }
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.noData)
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        let expanded = activeDisplayMode == .expanded
        preferredContentSize = expanded ? CGSize(width: maxSize.width, height: 500) : maxSize
    }
}
