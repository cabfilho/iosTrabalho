import UIKit

class CarteiraModel: NSObject, NSCoding {
    var valorTotal: Int
    var valorInserido:Int
    var dataOperacao: Date
    var tpOperacao:Int
    
    init(_ valorTotal: Int, _ valorInserido: Int, _ dataOperacao:Date, _ tpOperacao:Int) {
        self.valorTotal = valorTotal
        self.valorInserido = valorInserido
        self.dataOperacao = dataOperacao
        self.tpOperacao = tpOperacao
        
        super.init()
    }
    

    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(valorTotal, forKey: "valorTotal")
        aCoder.encode(valorInserido, forKey: "valorInserido")
        aCoder.encode(dataOperacao, forKey: "dataOperacao")
        aCoder.encode(tpOperacao, forKey: "tpOperacao")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.valorTotal = aDecoder.decodeInteger(forKey: "valorTotal")
        self.dataOperacao = aDecoder.decodeObject(forKey: "dataOperacao") as! Date
        self.valorInserido = aDecoder.decodeInteger(forKey: "valorInserido")
        self.tpOperacao = aDecoder.decodeInteger(forKey: "tpOperacao")
        
        super.init()
    }
    
}
