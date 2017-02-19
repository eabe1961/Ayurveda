
//  DoshaExplanationViewController.swift

import UIKit

class DoshaExplanationViewController: UIViewController {

    override func viewDidLoad() {
        navigationItem.title = "Uitleg"
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dqvc = segue.destination as! DoshaQuestionViewController
        dqvc.answers = Answers()
        UserDefaults.standard.set(true, forKey: "InQuiz")
        }

    @IBAction func unwindToMenu(_ segue: UIStoryboardSegue) {
        let dqvc = segue.source as! DoshaQuestionViewController
        let a = dqvc.answers!
        print(a.created)
        print(a.prakruti)
        print(a.vikruti)
        // TODO: Persisteren
        UserDefaults.standard.set(false, forKey: "InQuiz")
        }
    }
