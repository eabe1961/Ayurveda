
//  MainMenuViewController.swift

import UIKit

class MainMenuViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            navigationItem.title = "Ayur•veda"
            }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 3
        }
}
