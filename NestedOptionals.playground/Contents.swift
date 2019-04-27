/*
 
 In Swift 5, try? someExpr() will mirror the behavior of foo?.someExpr():
 
 If someExpr() produces a non-optional value, it will be wrapped in an Optional.
 If someExpr() produces an Optional, then no additional optional-ness is added.

 
 */
import UIKit

// Swift 4: 'Int??'
// Swift 5: 'Int?'
//let result = try? database?.countOfRows(matching: predicate)

// Swift 4: 'String??'
// Swift 5: 'String?'
//let myString = try? String(data: someData, encoding: .utf8)

// Swift 4: '[String: Any]??'
// Swift 5: '[String: Any]?'
//let dict = try? JSONSerialization.jsonObject(with: data) as? [String: Any]

// Swift 4: 'String?'
// Swift 5: 'String?'
//let fileContents = try? String(contentsOf: someURL)

func doubleOptionalInt() throws -> Int?? {
    return 3
}

// Swift 4: 'Int???'
// Swift 5: 'Int??'
let x = try? doubleOptionalInt()
print(x)

func test<T>(fn: () throws -> T) -> T? {
    
    // Will this line change behavior if T is an Optional?
    if let result = try? fn() {
        print(result)
        print("We got a result!")
        return result
    }
    else {
        print("There was an error")
        return nil
    }
}

// T is inferred as 'Int' here
let value  = test(fn: { return 15 })

// T is inferred as 'Int?' here
let value2 = test(fn: { return 15 as Int? }) //explict optional so it will not do anything
