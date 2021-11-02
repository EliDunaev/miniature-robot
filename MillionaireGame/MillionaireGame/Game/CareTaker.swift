//
//  CareTaker.swift
//  MillionaireGame
//
//  Created by Shisetsu on 27.10.2021.
//

import Foundation

final class CareTaker {
    private let save = JSONEncoder()
    private let load = JSONDecoder()
    
    private let key = "Score"
    
    func saveData(toSave: [ScoreTable]) {
        do {
            let data = try self.save.encode(toSave)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func loadData() -> [ScoreTable] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return[]
        }
        do {
            return try self.load.decode([ScoreTable].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
