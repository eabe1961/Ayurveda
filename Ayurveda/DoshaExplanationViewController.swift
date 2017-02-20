
//  DoshaExplanationViewController.swift

import UIKit

class DoshaExplanationViewController: UIViewController {

    @IBOutlet weak var explanationLabel: UILabel!
    @IBOutlet weak var incompleteLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!

    override func viewDidLoad() {
        navigationItem.title = "Uitleg"
        }

    override func viewWillAppear(_ animated: Bool) {
        if UserDefaults.standard.boolForKey(key: "InQuiz", defaultValue: false) {
            // De vorige quiz is nog niet compleet.
            incompleteLabel.text = "Je kunt nu de vorige test afmaken."
            startButton.setTitle("Ga verder", for: .normal)
            }
        else {
            // De vorige quiz werd wel compleet ingevuld, of dit is de eerste keer.
            incompleteLabel.text = ""
            startButton.setTitle("Start", for: .normal)
            }
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dqvc = segue.destination as! DoshaQuestionViewController
        if UserDefaults.standard.boolForKey(key: "InQuiz", defaultValue: false) {
            dqvc.answers = doshaHistory.latest()
            if dqvc.answers == nil {
                dqvc.answers = doshaHistory.add()
                print("Programmalogicafout: InQuiz is true, maar de history log was leeg. Log entry toegevoegd.")
                }
            }
        else {
            dqvc.answers = doshaHistory.add()
            UserDefaults.standard.set(0, forKey: "QuizCur")
            UserDefaults.standard.set(true, forKey: "InQuiz")
            }
        }

    @IBAction func unwindToMenu(_ segue: UIStoryboardSegue) {
        let dqvc = segue.source as! DoshaQuestionViewController
        // let a = dqvc.answers!
        // print(a.created, a.prakruti, a.vikruti)
        // TODO: Persisteren? Of is dat al gedaan?
        UserDefaults.standard.set(false, forKey: "InQuiz")
        // TODO: Kijken of de quiz volledig werd ingevuld. Zoja, segue programmatisch naar een evaluatiescherm. Zoniet, melding dat de quiz later compleet gemaakt kan worden.
        }
    }
