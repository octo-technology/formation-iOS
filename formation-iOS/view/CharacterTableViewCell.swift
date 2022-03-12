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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        resetCell()
    }
    
    func configureCell(character: Character) {
        nameLabel.text = character.name
        weightLabel.text = character.mass?.toMassString()
        heightLabel.text = character.height?.toHeightString()
        originLabel.text = character.species
        portraitImageView.downloaded(from: character.image)
    }
    
    private func resetCell() {
        portraitImageView.image = UIImage(named: "")
        nameLabel.text = ""
        weightLabel.text = ""
        heightLabel.text = ""
        originLabel.text = ""
    }

}
