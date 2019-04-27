// it will handle unknown case which are not mention in enum

import UIKit

enum PasswordError : Error {
    case short
    case obvious
    case simple
}

func showOld(error : PasswordError) {
    switch error {
    case .short:
        print("Your password was too short.")
    case .obvious:
        print("Your password was too obvious.")
    @unknown default:
        print("Your password wasn't suitable.")
    }
}
