/*
 Backslashes and quote marks are interpreted as those literal symbols rather than escapes characters or string terminators. This makes a number of use cases more easy, but regular expressions in particular will benefit.
 */

import UIKit

var string1 = #"Welcome to "swift 5 tutorials""#
print(string1)

var string2 = #"""

welcome
to
swift 5
tutorials

"""#
print(string2)

var string3 = ##"welcome "#back#"!!!"##
print(string3)

