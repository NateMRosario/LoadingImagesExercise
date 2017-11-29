//
//  ComicViewController.swift
//  LoadingImagesExercises
//
//  Created by C4Q on 11/28/17.
//  Copyright © 2017 raptrous solutions. All rights reserved.
//

import UIKit

class ComicViewController: UIViewController {

    var comics = [Comic]()
    
    var counter = 1 {
        didSet {
        }
    }
    
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func stepperPressed(_ sender: UIStepper) {
        if Int(stepper.value) > counter {
        counter += 1
        } else {
            counter -= 1
        }
    }
    
    @IBAction func buttonsPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            break
        case 1:
            break
        default:
            break
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadComic()
    }

    func loadComic() {
        let url = "https://xkcd.com/\(counter)/info.0.json"
    }

}

