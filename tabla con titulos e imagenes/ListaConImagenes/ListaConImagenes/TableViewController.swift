//
//  TableViewController.swift
//  ListaConImagenes
//
//  Created by Miguel Angel Herrera Perez on 02/03/23.
//

import UIKit



class TableViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    
    let searchController = UISearchController()
    @IBOutlet weak var shapeTableView: UITableView!
    
    var shapeList = [Shape]()
    var filteredShapes = [Shape]()
        
    override func viewDidLoad()
        {
            super.viewDidLoad()
            initList()
            initSearchController()
        }
        
        func initList() {
            let Cuadrado = Shape(id: "0", name: "Cuadrado 0", imageName: "cuadro1")
            shapeList.append(Cuadrado)
            
            let Square = Shape(id: "1", name: "Square 0", imageName: "cuadro2")
            shapeList.append(Square)
            
            let Cuadrado1 = Shape(id: "2", name: "Cuadrado 1", imageName: "cuadro1")
            shapeList.append(Cuadrado1)
            
            let Square1 = Shape(id: "3", name: "Square 1", imageName: "cuadro2")
            shapeList.append(Square1)
            
        }
        func initSearchController() {
            searchController.loadViewIfNeeded()
            searchController.searchResultsUpdater = self
            searchController.obscuresBackgroundDuringPresentation = false
            searchController.searchBar.enablesReturnKeyAutomatically = false
            searchController.searchBar.returnKeyType = UIReturnKeyType.done
            definesPresentationContext = true
            
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = true
            searchController.searchBar.scopeButtonTitles = ["All", "Cuadrado","Square"]
            searchController.searchBar.delegate = self
        }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if(searchController.isActive) {
                return filteredShapes.count
            }
            return shapeList.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellID") as!
            TableViewCell
            
            let thisShape: Shape!
            if (searchController.isActive) {
                thisShape = filteredShapes[indexPath.row]
            } else {
                thisShape = shapeList[indexPath.row]
            }
            
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
                
                let selectedShape: Shape!
                if(searchController.isActive) {
                    selectedShape = filteredShapes[indexPath.row]
                }
                else {
                    selectedShape = shapeList[indexPath.row]
                }
                
                tableViewDetail!.selectedShape = selectedShape
                self.shapeTableView.deselectRow(at: indexPath, animated: true)
            }
        }

        func updateSearchResults(for searchController: UISearchController) {
            let searchBar = searchController.searchBar
            let scopeButton = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
            let searchText = searchBar.text!
            
            filterForSearchTextAndScopeButton(searchText: searchText, scopeButton: scopeButton)
        }
        
        func filterForSearchTextAndScopeButton(searchText: String, scopeButton : String = "All") {
            filteredShapes = shapeList.filter {
                shape in
                let scopeMatch = (scopeButton == "All" || shape.name.lowercased().contains(scopeButton.lowercased()))
                if(searchController.searchBar.text != "") {
                    let searchTextMatch = shape.name.lowercased().contains(searchText.lowercased())
                    
                    return scopeMatch && searchTextMatch
                } else {
                    return scopeMatch
                }
            }
            shapeTableView.reloadData()
        }
    
}

