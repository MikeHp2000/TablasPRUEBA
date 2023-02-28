import UIKit

var array = [1,2,3,4,5,6]

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

let answer = array.myFilter { (item) -> Bool in
    return item > 4
}
print(answer)
