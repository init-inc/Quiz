//
//  ViewController.swift
//  Quiz
//
//  Created by Taku Yamada on 2022/04/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var str = ""
        let i = 3
        if (i >= 1) { // 真偽値→Bool
            str = "iは1以上です"
        }
        self.label.text = str
    }

    @IBAction func pressButton(_ sender: Any) {
        self.label.text = "ボタンを押しました"
    }
    
}

