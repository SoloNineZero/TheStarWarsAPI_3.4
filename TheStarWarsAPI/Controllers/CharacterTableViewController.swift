//
//  InfoTableViewController.swift
//  TheStarWarsAPI
//
//  Created by Игорь Солодянкин on 23.03.2023.
//

import UIKit

final class CharacterTableViewController: UITableViewController {
    
    //MARK: - Private properties
    private var characters: [Character] = []
    private let networkManager = NetworkManager.shared

    // MARK: - Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCharacter()
        title = "Star Wars"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)
        guard let cell = cell as? CharacterTableViewCell else { return UITableViewCell() }
        let character = characters[indexPath.row]
        cell.configure(with: character)

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let infoVC = segue.destination as? InfoViewController else { return }
        guard let index = tableView.indexPathForSelectedRow else { return }
        infoVC.character = characters[index.row]
    }
}
//MARK: - Private functions
extension CharacterTableViewController {
    private func fetchCharacter() {
        networkManager.fetchCharacters(from: Link.apiCharacterURL.url) { [weak self] result in
            switch result {
            case .success(let characters):
                self?.characters = characters
                self?.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
