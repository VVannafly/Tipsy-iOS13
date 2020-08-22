//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Dmitriy Chernov on 19.08.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    
    var percent = 10
    var people = 2
    var result = "0.0"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sumLabel.text = String(result)
        infoLabel.text = "Split between \(people) people, with \(percent)% tip."

        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
