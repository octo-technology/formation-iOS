//
//  ViewController.swift
//  formation-iOS
//
//  Created by julien.pechon.
//

import UIKit

protocol CharacterDetailDelegate: AnyObject {
    func didChooseSide(side: Side, for character: Character)
}

class MyTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = CharacterViewModel()
    var characters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            self.characters = await self.viewModel.getCharacters()
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "Star Wars"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detailSegueIdentifier") {
            // pass data to next view
        }
    }
    
    @IBAction func onTapDetailSegue(_ sender: Any) {
        performSegue(withIdentifier: "detailSegueIdentifier", sender: nil)
    }
    
}

extension MyTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharacterTableViewCell
            
        cell.configureCell(character: characters[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "DetailCharacter", bundle: .main)
        let detailViewController = storyboard.instantiateViewController(identifier: "DetailViewController", creator: { [weak self] coder -> DetailCharacterViewController? in
            DetailCharacterViewController(coder: coder, charactere: (self?.characters[indexPath.row])!)
        })
        
        detailViewController.delegate = self
        navigationController?.pushViewController(detailViewController, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! HeaderTableViewCell
        
        headerCell.titleLabel.text = "Personnages"
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

extension MyTableViewController: CharacterDetailDelegate {
    
    func didChooseSide(side: Side, for character: Character) {
        let alert = UIAlertController(title: "Je suis un titre mais je n'ai pas d'inspiration", message: "Donnée enregistrée pour : \(character.name)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}

