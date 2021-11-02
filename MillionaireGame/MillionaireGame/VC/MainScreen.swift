//
//  MainScreen.swift
//  MillionaireGame
//
//  Created by Shisetsu on 27.10.2021.
//

import UIKit

final class MainScreen: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let gameVC = storyBoard.instantiateViewController(withIdentifier: "GameScreen") as? GameScene {
            let gameSession = Session()
            Game.shared.session = gameSession
            gameVC.gameDelegate = gameSession
            gameVC.modalPresentationStyle = .fullScreen
            self.present(gameVC, animated: false, completion:nil)
        }
    }
    
    @IBAction func showScores(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ScoreScreen") as? ScoreTableScene {
            nextViewController.modalPresentationStyle = .popover
            self.present(nextViewController, animated: true, completion: nil)
        }
    }
    
}
