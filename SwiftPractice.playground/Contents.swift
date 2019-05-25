import UIKit
//Print string in multiple line
var str = """
Hello,
World
"""
print(str)

//Array
var myArray = ["aaa","bbb","ccc"]
myArray[1] = "ddd"
myArray.append("ee")
for item in myArray {
    print(item)
}

//Dictionary
var persons = ["john":22,"steve":33,"Clerk":11]
print(persons)

//create Empty Array and Dictionary
let emptyArray = [String]()
let emptyDictionary = [String:Int]()

//CONTROL FLOWS......for-in, while, repeat-while
let marks = [40,50,60,63]
var total = 0
for mark in marks {
    total += mark
}
print(total)

//optional variable - it may contain value or contain nil
var optionalString : String? = "Hello"
//handle optional value using default value using the ?? operator
var nickName:String? = nil
var fullName:String = "Kirti"
let greeting = "Hi \(nickName ?? fullName)"
print(greeting)

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

// Iterating over dictionary using for loop
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

//while loop
var n = 2
while n < 100 {
    n *= 2
}
print(n)
// Prints "128"

//repeat-while loop
var m = 2
repeat {
    m *= 2
} while m < 100
print(m)
// Prints "128"

//loop using ..< to make range of indexes
total = 0
for i in 0..<4 { // or 0..<=4 inclusive bounderies
    total += i
}
print(total)
// Prints "6"

//FUNCTIONS AND CLOSURES
func greet(person:String, day:String) -> String {
//func greet(p1 person:String,d1 day:String) -> String {
//func greet(_ person:String,_ day:String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person: "kirti",day: "Monday")
//greet(p1: "kirti",d1: "Monday")
//greet("kirti","Monday")

//TUPLE
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
// Prints "120"
print(statistics.2)
// Prints "120"

//Nested Functions
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

//function returns another function
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

//function takes another function as argument
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

//closure - a special kind of function which calls later
numbers.map({ (number :Int) -> Int in
    let result = 10 * number
    return result
})
numbers.map({ (number : Int) -> Int in
    if (number % 2 == 0) { return 1 }
    else { return 0 }
})
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)
let sortedNumbers = numbers.sorted {$0 < $1}
print(sortedNumbers)

//Classes and Objects
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
// Prints "9.3"
triangle.perimeter = 9.9
print(triangle.sideLength)
// Prints "3.3000000000000003"

//willSet and didSet is there
//willSet - to execute code before assigning new value to variable
//didSet - to execute code after assigning new value to variable

//Enumerations and Structures
//Enums can have methods associated with them
enum Rank : Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue
func compareEnumRawvalue(enum1 : Rank, enum2 : Rank) {
    if (enum1.rawValue == enum2.rawValue) {
        print("raw value same")
    }
    else {
        print("raw value different")
    }
}

enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
}
// Prints "Sunrise is at 6:00 am and sunset is at 8:09 pm."

struct Card {
    var rank: Rank
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

//Protocols and Extensions
/***********************************/
protocol ExampleProtocol {
    var simpleDescription : String { get }
    mutating func adjust()
}

class SimpleClass : ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty : Int = 100
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure : ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

extension Int:ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(10.simpleDescription)

//Error Handling
enum PrinterError:Error {
    case outOfPaper
    case noToner
    case onFire
}
func send(job:Int, toPrinter printerName:String) throws -> String{
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}
//handle error
do{
    let printerResponse = try send(job: 100, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch {
    print(error)
}
do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}
// Prints "Job sent"
//use try? to convert result to an optional
// if fun throws error, error is discarded and result is nil
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

//use defer to write block of code that is executed after all other code in the function
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)

//Generics
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)

//you can make generics form of classes, enums, structures, functions
// Reimplement the Swift standard library's optional type
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

//Use where right before the body to specify a list of requirements
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])

