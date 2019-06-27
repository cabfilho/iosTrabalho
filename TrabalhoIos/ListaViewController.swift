//
//  ListaViewController.swift
//  TrabalhoIos
//
//  Created by Beto on 24/06/19.
//  Copyright © 2019 Beto. All rights reserved.
//

import UIKit

class ListaViewController: UITableViewController {
    
    var carteiraStore: CarteiraStore!
    var totalCarteira:Int!
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = "Valor Total: R$" + String(totalCarteira)
        self.tableView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
       // navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carteiraStore.todosItems.count
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "mostrarTotal"?:
            if let row = self.tableView.indexPathForSelectedRow?.row {
                let item = carteiraStore.todosItems[row]
                
                let detalhesViewController = segue.destination as! DetalheTotalViewController
                detalhesViewController.valorTotal = item.valorTotal
            }
        default:
            preconditionFailure("Identificador do segue não encontrado")
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var identifier: String = "ItemCell"
   
        
        let cell: ItemCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ItemCell
        
        let item: CarteiraModel = carteiraStore.todosItems[indexPath.row]
        cell.dtOperacao.text = dateFormatter.string(from: item.dataOperacao)
  
        if item.tpOperacao == 2 {
            cell.vlrInserido.textColor = UIColor.red
            cell.vlrInserido.text = "-" + String(item.valorInserido)
        } else {
            cell.vlrInserido.text = String(item.valorInserido)
             cell.vlrInserido.textColor = UIColor.green
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let item = carteiraStore.todosItems[indexPath.row]
            
            //let titulo: String = "Deletar \(item.nome)"
            let mensagem: String = "Você tem certeza que quer excluir esse item?"
   
       
            
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        carteiraStore.moverItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
  
    

    
}

