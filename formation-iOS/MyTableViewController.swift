//
//  ViewController.swift
//  formation-iOS
//
//  Created by julien.pechon.
//

import UIKit

class MyTableViewController: UIViewController {
    
    // Custom array of data
    let characterArray = [
        Character(name: "Luke Skywalker", weight: "73", height: "172", origin: "tatooine", portrait: "Luke"),
        Character(name: "C-3PO", weight: "75", height: "171", origin: "tatooine", portrait: "C3PO"),
        Character(name: "R2-D2", weight: "32", height: "109", origin: "naboo", portrait: "R2"),
        Character(name: "Darth Vader", weight: "120", height: "203", origin: "tatooine", portrait: "Vador"),
        Character(name: "Leia Organa", weight: "51", height: "150", origin: "alderaan", portrait: "Leia")
    ]
    
    // Changing viewController navigation title in viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Star Wars"
    }
}

//MARK: UITableViewDataSource

extension MyTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharacterTableViewCell
            
        cell.configureCell(character: characterArray[indexPath.row])
        
        return cell
    }
}

//MARK: UITableViewDelegate

extension MyTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! HeaderTableViewCell

        headerCell.titleLabel.text = "Personnages"
        
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
