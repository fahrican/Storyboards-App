//
//  PlayersViewController.swift
//  RatingsTutorial
//
//  Created by fahri on 01.06.18.
//  Copyright © 2018 fahri. All rights reserved.
//

import UIKit

class PlayersViewController: UITableViewController {
    
    var players = SampleData.generatePlayersData()
}

extension PlayersViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath)
        
        let player = players[indexPath.row]
        cell.textLabel?.text = player.name
        cell.detailTextLabel?.text = player.game
        return cell
    }
}
