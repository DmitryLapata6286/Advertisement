//
//  ViewController.swift
//  Adv
//
//  Created by Dmitry Lapata on 1.07.22.
//

import UIKit

class AdvViewController: UIViewController {
    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel! {
        didSet{
            timerLabel.superview?.clipsToBounds = true
            timerLabel.superview?.layer.cornerRadius = 10
            timerLabel.textColor = .white
            timerLabel.font.withSize(25)
        }
    }
    @IBOutlet weak var button: UIButton! {
        didSet{
            button.setTitle("Activate", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.clipsToBounds = true
            button.setGradientBackground([UIColor(red: 65.0/255.0, green: 69.0/255.0, blue: 152.0/255.0, alpha: 1),
                                          UIColor(red: 234.0/255.0, green: 72.0/255.0, blue: 187.0/255.0, alpha: 1)], startPoint: CGPoint(x: 0.5, y: 0), endPoint: CGPoint(x: 0.5, y: 1))
            button.layer.cornerRadius = 10
        }
    }

    
    lazy var adv = Advertisement(saleDuration: 86400)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.timerLabel.text = adv.timerLabelInfo
    }

    //MARK: - Actions
    @IBAction func activateButton(_ sender: UIButton) {
        activate()
    }
    
    private func activate() {
        let alert = UIAlertController(title: "Great!", message: "Offer activated at \(timerLabel.text ?? "N/A")", preferredStyle: .alert)
        present(alert, animated: true) {
                    alert.view.superview?.isUserInteractionEnabled = true
                    alert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.alertControllerBackgroundTapped)))
                }

            
 
        adv.stopTimer()
    }
    
    @objc func alertControllerBackgroundTapped()
    {
        self.dismiss(animated: true, completion: nil)
    }
}

