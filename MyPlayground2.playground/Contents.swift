import UIKit

var array = ["Hola","Adios"]

extension Collection {
    
    func myFilter(_ isIncluded: (Element) -> Bool) -> [Element]  {
            var results: [Element] = []
            for element in self {
                if isIncluded(element) {
                    results.append(element)
                }
            }
        return results
    }
}

func resolver (_  Arreglo: [Any], _ item1: String) -> [String] {
    let answer = array.myFilter { (item) -> Bool in
        return item == item1
    }
    
    return answer
}
