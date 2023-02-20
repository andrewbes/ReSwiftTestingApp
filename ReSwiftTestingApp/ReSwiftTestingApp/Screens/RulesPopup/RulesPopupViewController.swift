//
//  RulesPopupViewController.swift
//  ReSwiftTestingApp
//
//  Created by Andrii Bezkorovainyi on 2/20/23.
//

import UIKit

class RulesPopupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        store.dispatch(RoutingAction(destination: .menu, navigationType: .dismiss))
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
