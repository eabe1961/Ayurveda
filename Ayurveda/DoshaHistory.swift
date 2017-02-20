
//  DoshaHistory.swift

import Foundation


class DoshaHistory: CustomStringConvertible {

    var log = [Date: Answers]() // Mapping from creation date -> answer instance

    init() {
        load()
        }

    // Load previously saved dosha quiz answers.
    func load() {
        if let data = UserDefaults.standard.object(forKey: "History") as? Data {
            log = NSKeyedUnarchiver.unarchiveObject(with: data) as! [Date: Answers]
            }
        }

    // Save dosha quiz answers.
    func save() {
        let data = NSKeyedArchiver.archivedData(withRootObject: log)
        UserDefaults.standard.set(data, forKey: "History")
        }

    // Fetch latest answers object, or nil if none exists.
    func latest() -> Answers? {
        if log.count < 1 {
            return nil
            }
        let dates = log.keys.sorted()
        let key = dates.last!
        return log[key]
        }

    // Create a new Answers instance and add it to the log; also saves it. Returns the newly created instance.
    func add() -> Answers {
        let new = Answers()
        log[new.created] = new
        save()
        return new
        }

    // Erase entire history.
    func erase() {
        log.removeAll()
        save()
        }

    // String representation of entire object.
    var description: String {
        return "<DoshaHistory: \(log)>"
        }
    }
