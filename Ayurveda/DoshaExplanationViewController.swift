
//  DoshaExplanationViewController.swift

import UIKit

class DoshaExplanationViewController: UIViewController {

    override func viewDidLoad() {
        navigationItem.title = "Uitleg"
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dqvc = segue.destination as! DoshaQuestionViewController
        print("PREP ", dqvc)
//        dqvc.vragen = Vragen()
//        dqvc.antwoorden = Antwoorden(aantalVragen: qvc.vragen.vraagteksten.count)
        }

    @IBAction func unwindToMenu(_ segue: UIStoryboardSegue) {
        let dqvc = segue.source as! DoshaQuestionViewController
        print(dqvc)
        // Doe iets met de answers, print(dqvc.answers)
        }
    }
