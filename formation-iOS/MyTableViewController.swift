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
    
    
    override func viewDidLoad() {
        addButton()
    }
    
    private func addButton() {
        // MARK: #1
//        let button = UIButton(frame: CGRect(x: 10, y: 30, width: 100, height: 50))
        let button = UIButton(type: .system)
        self.view.addSubview(button)
        
        // MARK: set UI
        button.backgroundColor = .systemYellow
        button.setTitle("Choose your side", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5

        
        // MARK: set target
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        // MARK: #2
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.widthAnchor.constraint(equalToConstant: 140),
            button.heightAnchor.constraint(equalToConstant: 30)
        ])

    }
    
    @objc func buttonAction(sender: UIButton!) {
        let yourSideVC = YourSideViewController()
        yourSideVC.sideSelectorDelegate = self
        navigationController?.pushViewController(yourSideVC, animated: true)
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


extension MyTableViewController: SideSelectorDelegate {
    func sideChoosen(color: UIColor) {
        view.backgroundColor = color
    }
    
}
