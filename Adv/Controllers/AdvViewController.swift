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
    @IBOutlet weak var button: UIButton! {
        didSet{
            button.setTitle("Activate", for: .normal)
            button.setTitleColor(.white, for: .normal)
            //button.frame = CGRect(x: 350, y: 220, width: 150, height: 50)
            button.clipsToBounds = true
            button.setGradientBackground([UIColor(red: 65.0/255.0, green: 69.0/255.0, blue: 152.0/255.0, alpha: 1),
                                          UIColor(red: 234.0/255.0, green: 72.0/255.0, blue: 187.0/255.0, alpha: 1)], startPoint: CGPoint(x: 0.5, y: 0), endPoint: CGPoint(x: 0.5, y: 1))
            button.layer.cornerRadius = 10
        }
    }
    
    // MARK: - UI variables
    
//    var button: UIButton = {
//        let button = UIButton()
//        button.setTitle("Activate", for: .normal)
//        button.frame = CGRect(x: 350, y: 220, width: 150, height: 50)
//        button.clipsToBounds = true
//        button.setGradientBackground([UIColor(red: 65.0/255.0, green: 69.0/255.0, blue: 152.0/255.0, alpha: 1),
//                                      UIColor(red: 234.0/255.0, green: 72.0/255.0, blue: 187.0/255.0, alpha: 1)], startPoint: CGPoint(x: 0.5, y: 0), endPoint: CGPoint(x: 0.5, y: 1))
//        button.layer.cornerRadius = 10
        
        //TODO: - Add parent view for shadow
        //button.layer.shadowColor = UIColor(red: 234.0/255.0, green: 72.0/255.0, blue: 187.0/255.0, alpha: 1).cgColor
        //button.layer.shadowOffset = CGSize(width: 2, height: 2)
        //button.layer.shadowOpacity = 1.0
        //button.layer.shadowRadius = 100
        
        //button.layer.borderColor = UIColor(red: 234.0/255.0, green: 72.0/255.0, blue: 187.0/255.0, alpha: 1).cgColor
        //button.layer.borderWidth = 2.0
//        return button
//    }()

    
    private var adv = Advertisement(saleDuration: 86400)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    //MARK: - Actions
    @IBAction func activateButton(_ sender: Any) {
    }
}

