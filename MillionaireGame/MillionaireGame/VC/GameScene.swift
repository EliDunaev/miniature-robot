//
//  GameScene.swift
//  MillionaireGame
//
//  Created by Shisetsu on 27.10.2021.
//

import UIKit

protocol GameSceneDelegate: AnyObject {
    func resultSummation (_ controller: GameScene, questions: QuestionTable)
}

final class GameScene: UIViewController {
    
    weak var gameDelegate: GameSceneDelegate?
    private var setGameDifficultyStrategy: GameDiffcultyStrategy {
        switch Game.shared.difficulty {
        case .normal:
            return NormalQuestions()
        case .random:
            return RandomQuestions()
        }
    }
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var answerALabel: AnswerButton!
    @IBOutlet weak var answerBLabel: AnswerButton!
    @IBOutlet weak var answerCLabel: AnswerButton!
    @IBOutlet weak var answerDLabel: AnswerButton!
    @IBOutlet weak var rewardLabel: UILabel!
    
    var question: QuestionTable?
    var questionNumber: Int = 0
    var answerNumber: Int!
    var gameQuestions: [QuestionTable]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dificultySetup()
        setupGameData()
        
    }
    
    @IBAction func choseAnswer(_ sender: UIButton) {
        let info = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        
        if sender.tag == question?.correctAnswer {
            info.title = "Верно!"
            questionNumber += 1
            
            if questionNumber < questionsPull.count{
                self.gameDelegate?.resultSummation(self, questions: question!)
                info.addAction(UIAlertAction(title: "Продолжаем", style: .default, handler: setupGameData))
                present(info, animated: true)
            } else {
                self.gameDelegate?.resultSummation(self, questions: question!)
                info.title = "Игра закончена"
                info.addAction(UIAlertAction(title: "На главный экран", style: .default) {
                    [weak self] _ in
                    self?.finishGame()
                })
                present(info, animated: true)
            }
        } else {
            info.title = "Ответ неверный!"
            info.addAction(UIAlertAction(title: "Игра окончена", style: .default) {
                [weak self] _ in
                self?.finishGame()
            })
            present(info, animated: true)
        }
    }
    
    func dificultySetup() {
        gameQuestions = setGameDifficultyStrategy.setDifficulty()
    }
 
    func setupGameData(action: UIAlertAction! = nil) {
        
        question = gameQuestions![questionNumber]
        
        questionLabel.text = question?.question
        
        playerNameLabel.text = "У нас в студии Игрок 1"
        
        answerALabel.setTitle(question?.answers[0], for: .normal)
        answerBLabel.setTitle(question?.answers[1], for: .normal)
        answerCLabel.setTitle(question?.answers[2], for: .normal)
        answerDLabel.setTitle(question?.answers[3], for: .normal)
        
        Game.shared.session?.correctAnswers.addObserver(self, options: [.initial, .new],
                                             closure: { [weak self] (correctAnswers, _) in
            self?.questionNumberLabel.text = "Правильных ответов: \(correctAnswers) из \(self!.gameQuestions!.count)"
                                             })
        Game.shared.session?.totalReward.addObserver(self, options: [.initial, .new],
                                             closure: { [weak self] (reward, _) in
                                                self?.rewardLabel.text = "Сумма выигрыша: \(reward)"
                                             })
    }
    
    func finishGame() {
        Game.shared.endGame()
        self.dismiss(animated: true)
    }
}
