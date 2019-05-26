import UIKit

//Enumeration examples
enum CompassPoint {
    case north
    case south
    case east
    case west
}
enum Planet1 {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
var directionToHead = CompassPoint.east
switch directionToHead {
    case .east:
        print("east")
    case .north:
        print("north")
    case .south:
        print("south")
    case .west:
        print("west")
}

//CaseIterable - to have a collection of all of that enumeration’s cases
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")
// Prints "3 beverages available"
for beverage in Beverage.allCases {
    print(beverage)
}

//associated values
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
var productBarcode = Barcode.upc(8, 85909, 51226, 3)

//raw values
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
let possiblePlanet = Planet(rawValue: 7)
print(possiblePlanet!)

//recursive enumeration
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

///////////////////////////
//Structures and Classes
///////////////////////////


