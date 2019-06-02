// while
// if
// guard
// switch
    // where
    // break
    // continue
// for-in

// Basic for-in Loop
let solarSystem = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturday", "Uranus", "Neptune"]

for planet in solarSystem {
    print("Planet: \(planet)")
}

// More advanced for-in Loop with a Dictionary
// note: a dictionary is inherently unordered
// more info later in Collection Types
let moonCount = ["Mercury": 0, "Venus": 0, "Earth": 1, "Mars": 2, "Jupiter": 79, "Saturn": 62, "Uranus": 27, "Neptune": 14]

for (planet, moons) in moonCount {
    print("The planet \(planet) has \(moons) moons.")
}

// More advanced for-in Loop with numeric ranges
// this is called the closed range operator (...)
for count in 1...10 {
    print("1 + \(count) is \(1+count)")
}

// More advanced for-in Loop with numeric ranges
// If you don't need the value

// More advanced for-in Loop with half-open range
// prints 1 to 59 (60 items), skips the upper, includes the lower
for minute in 0..<60 {
    print(minute)
}

// Count up by 2s (stops before 20)
for number in stride(from: 0, to: 20, by: 2) {
    print(number)
}

// Closed ranges (includes the last number)
for number in stride(from: 0, through: 20, by: 2) {
    print(number)
}

// Simple while loop
var playerLevel = 1
let winningLevel = 10

while (playerLevel <= winningLevel) {
    print("Current Level: \(playerLevel)")
    playerLevel += 1
}
print("Player wins!")
playerLevel = 1

// Repeat-while
// does the loop block first, then checks

repeat {
    print("Current Level: \(playerLevel)")
    playerLevel += 1
} while(playerLevel <= winningLevel)
print("Player wins!")

// Conditional statements
var knownPlanets = 8

if knownPlanets == 8 {
    print("No new planets have been discovered in our solar system.")
}

// with an else statement
if knownPlanets == 8 {
    print("No new planets have been discovered in our solar system.")
} else {
    print("We've either found a new planet, or lost a planet..")
}

// with an else if and a else statement
if knownPlanets == 8 {
    print("No new planets have been discovered in our solar system.")
} else if knownPlanets < 8 {
    print("We've lost a planet in our solar system.")
} else {
    print("We might have gained a planet in our solar system.")
}
// note that the final else statement is optional

// If statements with multiple conditions
var searchingForNewPlanets: Bool = true
if knownPlanets == 8 && searchingForNewPlanets == true {
    print("No new planets have been discovered in our solar system, but we are looking!")
}

var newPlanetFound: Bool = false

if knownPlanets > 8 || newPlanetFound == true {
    print("We might have found a new planet!")
}

// Ternary conditional operator

// the long way
let firstNumber = 97
let secondNumber = 35
let minimum: Int
let maximum: Int

if firstNumber > secondNumber {
    maximum = firstNumber
} else {
    maximum = secondNumber
}

if firstNumber < secondNumber {
    minimum = firstNumber
} else {
    minimum = secondNumber
}

print("The bigger number is \(maximum), and the smaller number is \(minimum).")

// with ternary conditional operator
let min = firstNumber < secondNumber ? firstNumber : secondNumber
let max = firstNumber > secondNumber ? firstNumber : secondNumber
print("The bigger number is \(max), and the smaller number is \(min).")


// Switch statement
let planet = "Jupiter"

if planet == "Jupiter" {
    print("Jupiter is 2.5 times the mass of all the other planets put together.")
} else if planet == "Mars" {
    print("Mars has a carbon dioxide atmosphere.")
} else if planet == "Mercury" {
    print("Mercury is the closest planet to the sun.")
} else {
    print("I don't have a fact for that planet.")
}

switch planet {
case "Jupiter":
    print("Jupiter is 2.5 times the mass of all the other planets put together.")
case "Mars":
    print("Mars has a carbon dioxide atmosphere.")
case "Mercury":
    print("Mercury is the closest planet to the sun.")
default:
    print("I don't have a fact for that planet.")
}
// no break statements needed, safer than C
// a case is required to have an executable statement

// Switch statements with Interval Matching
let studentResult = 75
let plainEnglishResult: String

switch studentResult {
case 0..<50:
    plainEnglishResult = "Fail"
case 50..<60:
    plainEnglishResult = "Pass"
case 60..<70:
    plainEnglishResult = "Credit"
case 70..<80:
    plainEnglishResult = "Distinction"
case 80..<100:
    plainEnglishResult = "High Distinction"
case 100:
    plainEnglishResult = "Perfect High Distinction"
default:
    plainEnglishResult = "Unknown Mark"
}
print("The student achieved a \(plainEnglishResult)")

// Tuples and Switch Statements
// TODO TUPLEs and SWITCH statement

// Switches and Value Binding
// TODO Switches and Value Binding

// Switches with Where Statements
// TODO switches with where statements

// Switches with Compound Cases
let plainEnglishStudentType: String

switch studentResult {
case 0..<50, 50..<60, 60..<70, 70..<80:
    plainEnglishStudentType = "Bad Student"
case 80...100:
    plainEnglishStudentType = "Good Student"
default:
    plainEnglishStudentType = "Unknown Type"
}
print("This student is a \(plainEnglishStudentType)")

// Switches with Compound Cases AND Value Binding
// TODO

// Control Transfer Statements
// continue, break, fallthrough, return, throw
// TODO

// Labeled Statements
// TODO

// Early Exit
// guard
