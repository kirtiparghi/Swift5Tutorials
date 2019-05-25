import UIKit

struct User {
    var name : String
    var age : Int
}

extension String.StringInterpolation {
    mutating func appendInterpolation(_ value:User) {
        appendInterpolation("My name is \(value.name) and I'm \(value.age)")
    }
    
    mutating func appendInterpolation(_ number: Int, style: NumberFormatter.Style) {
        let formatter = NumberFormatter()
        formatter.numberStyle = style
        
        if let result = formatter.string(from: number as NSNumber) {
            appendInterpolation(result)
        }
    }
}

let user = User(name: "kirti", age: 26)
print("User details : \(user)")

let lucky = "The lucky number this week is \(10,style:.spellOut)"
print(lucky)
