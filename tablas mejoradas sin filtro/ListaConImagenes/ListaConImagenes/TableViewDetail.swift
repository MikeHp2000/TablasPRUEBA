//
//  TableViewDetail.swift
//  ListaConImagenes
//
//  Created by Miguel Angel Herrera Perez on 02/03/23.
//

import Foundation
import UIKit

class TableViewDetail:UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var selectedShape: Shape!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = /* selectedShape.id + "" + */ selectedShape.name
        image.image = UIImage(named: selectedShape.imageName)
        
    }
}
