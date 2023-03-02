//
//  TableViewController.swift
//  ListaConImagenes
//
//  Created by Miguel Angel Herrera Perez on 02/03/23.
//

import UIKit

class TableViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var shapeTableView: UITableView!
    
    var shapeList = [Shape]()
        
        override func viewDidLoad()
        {
            super.viewDidLoad()
            initList()
        }
        
        func initList()
        {
            let fig0 = Shape(id: "0", name: "fig 0", imageName: "cuadro1")
            shapeList.append(fig0)
            
            let fig1 = Shape(id: "1", name: "fig 1", imageName: "cuadro2")
            shapeList.append(fig1)
            
            let fig2 = Shape(id: "2", name: "fig 2", imageName: "cuadro1")
            shapeList.append(fig2)
            
            let fig3 = Shape(id: "3", name: "fig 3", imageName: "cuadro2")
            shapeList.append(fig3)
            
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
            return shapeList.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellID") as! TableViewCell
            
            let thisShape = shapeList[indexPath.row]
            
            tableViewCell.shapeName.text = /* thisShape.id + " " + */ thisShape.name
            tableViewCell.shapeImage.image = UIImage(named: thisShape.imageName)
            
            return tableViewCell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "detailSegue") {
                let indexPath = self.shapeTableView.indexPathForSelectedRow!
                let tableViewDetail = segue.destination as? TableViewDetail
                let selectedShape = shapeList[indexPath.row]
                tableViewDetail!.selectedShape = selectedShape
                self.shapeTableView.deselectRow(at: indexPath, animated: true)
            }
    }

}

