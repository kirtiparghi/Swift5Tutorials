import UIKit

@dynamicCallable
struct RandomNumberGenerator {
    func dynamicallyCall(withKeywordArguments args: KeyValuePairs<String,Int>) -> Double {
        let numberofZeroes = Double(args.first?.value ?? 0)
        let maximum = pow(10, Double(numberofZeroes))
        return Double.random(in: 0...maximum)
    }
    
    func dynamicallyCall(withArguments args: [Int]) -> Double {
        let numberofZeroes = Double(args[0])
        let maximum = pow(10, Double(numberofZeroes))
        return Double.random(in: 0...maximum)
    }
}

let random = RandomNumberGenerator()
let result = random(numberOfZeroes:2)
let result1 = random(4)

