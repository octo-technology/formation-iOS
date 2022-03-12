//
//  DetailViewController.swift
//  formation-iOS
//
//  Created by julien.pechon on 11/03/2022.
//

import UIKit

class DetailCharacterViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    weak var delegate: CharacterDetailDelegate?
    let character: Character

    init?(coder: NSCoder, charactere: Character) {
        self.character = charactere

        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = character.name
        imageView.downloaded(from: character.image)
    }
    
    @IBAction func didTapLightSide() {
        delegate?.didChooseSide(side: .Light, for: character)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapDarkSide() {
        delegate?.didChooseSide(side: .Dark, for: character)
        navigationController?.popViewController(animated: true)
    }

}

extension DetailCharacterViewController {
    
    static var storyboardName: String {
        return "DetailCharacter"
    }
}
