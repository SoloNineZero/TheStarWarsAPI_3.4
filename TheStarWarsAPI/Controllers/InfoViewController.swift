//
//  InfoViewController.swift
//  TheStarWarsAPI
//
//  Created by Игорь Солодянкин on 24.03.2023.
//

import UIKit

final class InfoViewController: UIViewController {
    
    @IBOutlet var descriptionLabel: UILabel!
        
    var character: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = character.name
        descriptionLabel.text = character.description
    }
}
