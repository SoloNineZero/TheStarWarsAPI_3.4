//
//  InfoTableViewCell.swift
//  TheStarWarsAPI
//
//  Created by Игорь Солодянкин on 23.03.2023.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var cellView: UIView! {
        didSet {
            cellView.layer.cornerRadius = 10
        }
    }
    
    func configure(with character: Character) {
        nameLabel.text = character.name
    }

}
