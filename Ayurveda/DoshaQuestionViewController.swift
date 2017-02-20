
//  DoshaQuestionViewController.swift

import UIKit

class DoshaQuestionViewController: UIViewController {

    var answers: Answers!
    var cur = 0 // Hoeft niet altijd bij 0 te beginnen, als een vorige afgebroken sessie hervat wordt

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var prakrutiSegment: UISegmentedControl!
    @IBOutlet weak var vikrutiSegment: UISegmentedControl!
    @IBOutlet weak var nextQuestion: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        cur = UserDefaults.standard.intForKey(key: "QuizCur", defaultValue: 0)
        fresh()
        }

    func fresh() {
        func scoreToSegment(_ score: Int) -> Int {
            if score == 0 {
                return -1
                }
            else {
                return score - 1
                }
            }
        titleLabel.text = "\(cur + 1)/\(questions.count)"
        questionLabel.text = questions[cur]
        prakrutiSegment.selectedSegmentIndex = scoreToSegment(answers.prakruti[cur])
        vikrutiSegment.selectedSegmentIndex = scoreToSegment(answers.vikruti[cur])
        if cur == questions.count - 1 {
            nextQuestion.setTitle("klaar", for: .normal)
            }
        else {
            nextQuestion.setTitle("volgende vraag", for: .normal)        
            }
        }


    @IBAction func nextQuestionTap(_ sender: UIButton) {
        func segmentToScore(_ segmentIndex: Int) -> Int {
            if segmentIndex == -1 {
                return 0
                }
            else {
                return segmentIndex + 1
                }
            }
        answers.prakruti[cur] = segmentToScore(prakrutiSegment.selectedSegmentIndex)
        answers.vikruti[cur] = segmentToScore(vikrutiSegment.selectedSegmentIndex)

        doshaHistory.save()
        cur += 1
        UserDefaults.standard.set(cur, forKey: "QuizCur")

        if cur == questions.count  {
            self.performSegue(withIdentifier: "unwindToMenu", sender: self)
            return
            }
        fresh()
        }

    }
