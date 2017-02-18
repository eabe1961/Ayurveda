
//  ChaptersViewController.swift

import UIKit

class ChaptersViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Filosofie"
        }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return corpus.chaptercount
        }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hnr = corpus.chapternumber(volgnr: indexPath.row)
        let titel = corpus.chaptertitle(chapternr: hnr)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = "Hoofdstuk \(hnr)"
        cell.detailTextLabel?.text = titel
        cell.imageView?.image = corpus.chapterimage(chapternr: hnr)
        cell.tag = indexPath.row
        return cell
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let dvc = segue.destination as! ChapterViewController
        let chapnr = corpus.chapternumber(volgnr: cell.tag)
        dvc.resource = corpus.chapterfilenames[chapnr]!
        }
}

