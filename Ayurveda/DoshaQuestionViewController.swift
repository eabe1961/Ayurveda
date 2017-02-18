
//  DoshaQuestionViewController.swift

import UIKit

class DoshaQuestionViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var prakrutiSegment: UISegmentedControl!
    @IBOutlet weak var vikrutiSegment: UISegmentedControl!
    @IBOutlet weak var nextQuestion: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        prakrutiSegment.selectedSegmentIndex = -1
        vikrutiSegment.selectedSegmentIndex = -1
        }

    @IBAction func nextQuestionTap(_ sender: UIButton) {
        print("TODO: Volgende vraag")
        }

    }
