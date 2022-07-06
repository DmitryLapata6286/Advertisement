//
//  ViewController.swift
//  Adv
//
//  Created by Dmitry Lapata on 1.07.22.
//

import UIKit

class AdvViewController: UIViewController {
    // MARK: - Variables
    
    var duration: Int = 86400
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel! {
        didSet{
            timerLabel.superview?.clipsToBounds = true
            timerLabel.superview?.layer.cornerRadius = 10
            timerLabel.textColor = .white
            timerLabel.font.withSize(25)
            timerLabel.text = duration.secondsToTime()
        }
    }
    @IBOutlet weak var button: UIButton! {
        didSet{
            button.setTitle("Activate", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.setGradientBackground([UIColor(red: 65.0/255.0, green: 69.0/255.0, blue: 152.0/255.0, alpha: 1),
                                          UIColor(red: 234.0/255.0, green: 72.0/255.0, blue: 187.0/255.0, alpha: 1)], startPoint: CGPoint(x: 0.5, y: 0), endPoint: CGPoint(x: 0.5, y: 1))
            button.layer.cornerRadius = 10
            button.clipsToBounds = true
//          TODO: - Add container view for shadow
//            button.layer.shadowColor = UIColor(red: 234.0/255.0, green: 72.0/255.0, blue: 187.0/255.0, alpha: 1).cgColor
//            button.layer.shadowRadius = 8
//            button.layer.shadowOpacity = 0.8
//            button.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
//
//            let cgPath = UIBezierPath(roundedRect: button.bounds, byRoundingCorners: [.allCorners], cornerRadii: CGSize(width: 10, height: 10)).cgPath
//            button.layer.shadowPath = cgPath
            
        }
    }

    
    lazy var adv = Advertisement(saleDuration: duration)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        adv.changedTextClosure = {text in
            self.timerLabel.text = text
        }
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

            
 
        adv.timer?.invalidate()
    }
    
    @objc func alertControllerBackgroundTapped()
    {
        self.dismiss(animated: true, completion: nil)
    }
}

