//
//  ViewController.swift
//  TABLASRegreso
//
//  Created by Miguel Angel Herrera Perez on 21/02/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    @IBOutlet var table: UITableView!
    @IBOutlet var field: UITextField!
    
    var data = [String]()
    var filteredData = [String]()
    var filtered = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        table.delegate = self
        table.dataSource = self
        field.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text {
            filterText(text+string)
        }
        
        return true
    }
    
    func filterText(_ query: String) {
        // guard let query = query else{
        //     return
        // }
        
        filteredData.removeAll()
        for string in data {
            if string.lowercased().starts(with: query.lowercased() ) {
                filteredData.append(string)
            }
        }
        
        table.reloadData()
        filtered = true
        
    }
    
    // Poner datos en el indices
    private func setupData(){
        data.append("Salon 1")
        data.append("Salon 2")
        data.append("Salon 3")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !filteredData.isEmpty {
            return filteredData.count
        }
        
        return filtered ? 0 : data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if !filteredData.isEmpty {
            cell.textLabel?.text = filteredData[indexPath.row]
        } else {
            cell.textLabel?.text = data[indexPath.row]
        }
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

