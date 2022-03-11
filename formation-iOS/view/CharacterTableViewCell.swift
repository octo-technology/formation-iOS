//
//  CharacterTableViewCell.swift
//  formation-iOS
//
//  Created by julien.pechon on 11/03/2022.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var portraitImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(character: Character) {
        nameLabel.text = character.name
        weightLabel.text = character.weight
        heightLabel.text = character.height
        originLabel.text = character.origin
        portraitImageView.image = UIImage(named: character.portrait)
    }

}
