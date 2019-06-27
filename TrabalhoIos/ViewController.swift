//
//  ViewController.swift
//  TrabalhoIos
//
//  Created by Beto on 22/06/19.
//  Copyright © 2019 Beto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var inputVlr: UITextField!
    var carteiraStore: CarteiraStore!
    var valorTotal:Int!
    
    @IBOutlet var vlrTotal: UILabel!
    
    @IBAction func btnDetalhe(_ sender: Any) {
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        valorTotal = 0

        
   
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "detalhes"?:
            let viewController = segue.destination as! ListaViewController
            viewController.carteiraStore = carteiraStore
            viewController.totalCarteira = valorTotal
        default:
            preconditionFailure("Segue não identificado")
        }
    }
    
    @IBAction func btnActionCreditVlr(_ sender: Any) {
        
        if inputVlr.text != nil{
            let vlrInserido = Int(inputVlr.text!)
            
            valorTotal += vlrInserido!
            let carteira:CarteiraModel = CarteiraModel(valorTotal, vlrInserido!, Date(), 1)
            carteiraStore.criarItem(carteira)
            carteiraStore.salvarAlteracoes()
            vlrTotal.text = String(valorTotal)
        }
    }
    
    @IBAction func btnSutraiVlr(_ sender: Any) {
        if inputVlr.text != nil{
            let vlrInserido = Int(inputVlr.text!)
            valorTotal -= vlrInserido!
            let carteira:CarteiraModel = CarteiraModel(valorTotal, vlrInserido!, Date(), 2)
            carteiraStore.criarItem(carteira)
            carteiraStore.salvarAlteracoes()
            vlrTotal.text = String(valorTotal)
            
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        valorTotal = 0
        if carteiraStore != nil {
            let carteiras = carteiraStore.todosItems
            for carteira in carteiras {
                if carteira.tpOperacao == 1 {
                    valorTotal += carteira.valorInserido
                }else{
                    valorTotal -= carteira.valorInserido
                }
            }
        }
        vlrTotal.text = String(valorTotal)
    }
    override func viewDidLoad() {
     
        super.viewDidLoad()
    }


}

