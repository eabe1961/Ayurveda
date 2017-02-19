
//  DoshaExplanationViewController.swift

import UIKit

class DoshaExplanationViewController: UIViewController {

    override func viewDidLoad() {
        navigationItem.title = "Uitleg"
        if UserDefaults.standard.boolForKey(key: "InQuiz", defaultValue: false) {
            // TODO: De vorige quiz is nog niet compleet
            }
        else {
            // TODO: Nieuwe quiz
            }
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dqvc = segue.destination as! DoshaQuestionViewController
        dqvc.answers = Answers()
        UserDefaults.standard.set(true, forKey: "InQuiz")
        UserDefaults.standard.set("BOEH", forKey: "QuizCur")
        }

    @IBAction func unwindToMenu(_ segue: UIStoryboardSegue) {
        let dqvc = segue.source as! DoshaQuestionViewController
        let a = dqvc.answers!
        print(a.created)
        print(a.prakruti)
        print(a.vikruti)
        // TODO: Persisteren
        UserDefaults.standard.set(false, forKey: "InQuiz")
        // TODO: Kijken of de quiz volledig werd ingevuld. Zoja, segue programmatisch naar een evaluatiescherm. Zoniet, melding dat de quiz later compleet gemaakt kan worden.
        }
    }
