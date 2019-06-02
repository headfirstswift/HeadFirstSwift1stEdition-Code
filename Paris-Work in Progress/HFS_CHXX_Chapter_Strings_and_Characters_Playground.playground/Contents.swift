import UIKit

// Playground for HEAD FIRST SWIFT book from O'Reilly Media
// Written by PARIS BUTTFIELD-ADDISON and JON MANNING

// Stringing things along

// variable string literals
var amazingNewString = "Almonds are thirsty"
var anotherString = "How long am I?"

// constant string literals
let amazingConstantString = "This ain't gonna change"
let anotherConstantString = "Not fond of change!"

// Multiline strings?
let motivationalQuote = """
Space: the final frontier.
These are the voyages of the starship Enterprise.
Its continuing mission: to explore strange new worlds, to seek our new life and new civilizations, to boldly go where no one has gone before.
"""

let newMotivationalQuote = """
On this site, a powerful engine will be built. \
An engine that will someday help us travel a hundred times faster than we can today. \
Imagine it - thousands of inhabited planets at our fingertips... and we'll be able to explore those strange new worlds, and seek out new life and new civilizations. \
This engine will let us go boldly... where no man has gone before.
"""

// Strings can be empty
var stringForLater = ""

// Empty string with initializer syntax
var anotherStringForLater = String()

// Checking for an empty string
if stringForLater.isEmpty {
    print("The string was empty!")
}

// Joining strings together (concatenating)
var stringOne = "Hello"
var stringTwo = "friend!"
var stringThree = stringOne + " " + stringTwo

// using the addition assignment operator
stringOne += " mate!"

// String interpolation
var favouritePlanet = "Jupiter"
var greeting = "Hello! My favourite planet is \(favouritePlanet)! What's yours?"

// Counting characters in a String
var message = "This is four words!"
var characterCount = message.count // 19 characters

// Comparing strings
var messageOne = "Resistance is futile!"
var messageTwo = "You will be assimilated."

if messageOne==messageTwo {
    print("The strings are the same.")
}

