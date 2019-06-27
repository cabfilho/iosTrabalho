//
//  ItemStore.swift
//  ListaDeCompras
//
//  Created by Lucas Reis on 23/05/2019.
//  Copyright © 2019 Lucas Reis. All rights reserved.
//

import UIKit

class CarteiraStore {
    
    var todosItems = [CarteiraModel]()
    let itemArchiveURL: URL = {
        let diretorioDocuments = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let diretorioDocument = diretorioDocuments.first!
        return diretorioDocument.appendingPathComponent("items.archive")
    }()
    
    init() {
        if let nsData = NSData(contentsOfFile: itemArchiveURL.path) {
            print("Lendo itens do: \(itemArchiveURL.path)")
            do {
                let data = Data(referencing: nsData)
                let itemsArquivados = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [CarteiraModel]
                todosItems = itemsArquivados
            } catch {
                print("Não foi possível ler os itens")
            }
        }
    }
    
    @discardableResult func criarItem(_ novaOperacao:CarteiraModel) -> CarteiraModel {
        let novoItem: CarteiraModel = novaOperacao
        
        todosItems.append(novoItem)
        
        return novoItem
    }
    
    func removerItem(_ item: CarteiraModel) {
        if let index = todosItems.firstIndex(of: item) {
            todosItems.remove(at: index)
        }
    }
    
    func moverItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        let itemParaMover = todosItems[fromIndex]
        
        todosItems.remove(at: fromIndex)
        
        todosItems.insert(itemParaMover, at: toIndex)
    }
    
    func salvarAlteracoes() -> Bool {
        print("Salvando items no: \(itemArchiveURL.path)")
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: todosItems, requiringSecureCoding: false)
            try data.write(to: itemArchiveURL)
        } catch {
            print("Não foi possível escrever o arquivo")
            return false
        }
        
        return true
    }
}
