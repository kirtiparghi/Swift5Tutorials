import UIKit

let sample = [
    "John" : "33",
    "Smith" : "44",
    "Steve" : "ff"
]

//fetch values that is integer convertible
let result1 = sample.compactMapValues {Int($0)}
print(result1)

//Another way to fetch values that is integer convertible
let result2 = sample.compactMapValues(Int.init)
print(result2)

let people = [

    "kirti" : 26,
    "steve" : 40,
    "smith" : 33,
    "john" : nil
]

//discard nil from dictionary
let knownages = people.compactMapValues {$0}
print(knownages)
