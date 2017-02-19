
//  DoshaQuestionViewController.swift

import UIKit

class DoshaQuestionViewController: UIViewController {
//    var vragen: Vragen!
//    var antwoorden: Antwoorden!
    var cur = 0 // Hoeft niet altijd bij 0 te beginnen, als een vorige afgebroken sessie hervat wordt

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var prakrutiSegment: UISegmentedControl!
    @IBOutlet weak var vikrutiSegment: UISegmentedControl!
    @IBOutlet weak var nextQuestion: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        fresh()
        }

    func fresh() {
        questionLabel.text = questions[cur]
        prakrutiSegment.selectedSegmentIndex = -1 // maar voor eerder gedane questionnaires....
        vikrutiSegment.selectedSegmentIndex = -1
        }


    @IBAction func nextQuestionTap(_ sender: UIButton) {
//        antwoorden.responses[cur] = antwoordSegment.selectedSegmentIndex
        cur += 1
        if cur == questions.count  {
            self.performSegue(withIdentifier: "unwindToMenu", sender: self)
            return
            }
        if cur == questions.count - 1 {
            nextQuestion.setTitle("klaar", for: UIControlState())
            }
        fresh()
        }

    }
