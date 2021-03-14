import UIKit

var ruleType: [String: String] = [:]

func typeConversion(rules: [String]) {
    rules.forEach {
        let rule = $0.components(separatedBy: " ")
        ruleType.updateValue(rule[1], forKey: rule[0])
    }
}

func isMatchName(name: String) -> Bool {
    return program == name
}

func isType(flagType: String, flagArg: String) -> Bool {
    guard let type = ruleType[flagType] as? String else { return false }
    
    if type == "String" {
        for ch in flagArg {
            if !((ch >= "A" && ch <= "Z") || (ch >= "a" && ch <= "z")) {
                return false
            }
        }
        return true;
    } else if type == "NUMBER" {
        if let _ = flagArg as? Int {
            return true
        } else {
            return false
        }
    } else {
        return true
    }
}

var program = "line"
var flag_rules = ["-s STRING", "-n NUMBER", "-e NULL"]
var commands = ["line -n 100 -s hi -e", "lien -s Bye"]
var answer: [Bool] = []

typeConversion(rules: flag_rules)
commands.forEach { (command) in
    var data = command.components(separatedBy: " ")
    
    var isName: Bool
    for (index, item) in data {
        if index == 0 {
            isName = isMatchName(name: item)
        } else {
            
        }
    }
}


