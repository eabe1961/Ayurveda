
//  MainMenuViewController.swift

import UIKit

var doshaHistory: DoshaHistory!

class MainMenuViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            navigationItem.title = "Ayur·veda"

            doshaHistory = DoshaHistory()
            // doshaHistory.erase()
            print("doshaHistory at startup: ", doshaHistory)

            // If the file 'Texts-production/Introductie.html' exists, use the production content. Otherwise, use the development content.
            var sourceDir = "Texts-development"
            let introFilename = Bundle.main.resourcePath! + "/Texts-production/Introductie.html"
            if FileManager().fileExists(atPath: introFilename) {
                sourceDir = "Texts-production"
                }
            corpus = Corpus(subdir: sourceDir, prefix: "Hoofdstuk")
            }

    // TODO: Custom cell view for proper spacing.
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 3
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dvc = segue.destination as? ChapterViewController {
            switch segue.identifier! {
                case "introductie": dvc.resource = "Texts-production/Introductie.html"
                case "voorbehoud": dvc.resource = "Texts-production/Medisch voorbehoud.html"
                case "colofon": dvc.resource = "Texts-production/Colofon.html"
                default: print("Error: unknown segue ", segue.identifier!)
                }
            }
        }

}
