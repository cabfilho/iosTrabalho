//
//  DetalheTotalViewController.swift
//  TrabalhoIos
//
//  Created by Beto on 26/06/19.
//  Copyright © 2019 Beto. All rights reserved.
//

import UIKit
class DetalheTotalViewController: UIViewController {
    var valorTotal:Int!
    
    @IBOutlet var valorTotalLabel: UILabel!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        valorTotalLabel.text = String(valorTotal)
  
    }
}
