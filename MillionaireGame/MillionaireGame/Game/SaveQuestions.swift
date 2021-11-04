//
//  SaveQuestions.swift
//  MillionaireGame
//
//  Created by Shisetsu on 04.11.2021.
//

import Foundation

final class SaveQuestions {
    private let save = JSONEncoder()
    private let load = JSONDecoder()
    
    private let key = "Questions"
    
    func saveQuestionsData(toSave: [QuestionTable]) {
        do {
            let data = try self.save.encode(toSave)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func loadQuestionsData() -> [QuestionTable] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return[]
        }
        do {
            return try self.load.decode([QuestionTable].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
