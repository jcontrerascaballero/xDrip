//
//  TrainingEntriesWorker.swift
//  xDrip
//
//  Created by Artem Kalmykov on 21.03.2020.
//  Copyright © 2020 Faifly. All rights reserved.
//

import Foundation

final class TrainingEntriesWorker: AbstractEntriesWorker {
    @discardableResult static func addTraining(
        duration: TimeInterval,
        intensity: TrainingIntensity,
        date: Date) -> TrainingEntry {
        let entry = TrainingEntry(duration: duration, intensity: intensity, date: date)
        return add(entry: entry)
    }
    
    static func fetchAllTrainings() -> [TrainingEntry] {
        return super.fetchAllEntries(type: TrainingEntry.self)
    }
}
