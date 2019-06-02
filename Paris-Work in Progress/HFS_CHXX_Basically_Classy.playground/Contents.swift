import UIKit

// Code from "Head First Swift" (1st Edition)

// Structs and Classes

// Swift has four kinds of NAMED TYPES. Throughout the book we'll be working with all of them. They are STRUCTURES, CLASSES, ENUMERATIONS, and PROTOCOLS.

// Let's start with structures.

// Structs!

// Structures, or structs, are types that can store named properties and define their own behaviours.

// NOTE: Structs and Classes are much more similar in Swift than you might be used to in other languages.


// Defining a structure:
struct Coordinates {
    var x: Int
    var y: Int
    var z: Int
}

// NOTE: whether it's a struct or a class, you're defining a new Swift type. So you can't overlap names.

// The above defines a simple structure that has a type named Coordinates, which contains x, y, and z coordinates.
// A struct is defined by using the struct keyword, a name, and an opening and closing brace. Everything you want to include as a member of the struct goes between the braces.
// The struct we created here has three members: x, y, and z. They are properties. They are constants in this case, but could be variables.
// Every instance of hte type Coordinates will have an x, y, and z property.

// Creating an instance of a struct:
var startingLocation = Coordinates(x: 10, y: 15, z: 11)

// You'll see, above, that we're creating a Coordinate value by using it's name, along with a parameter list inside the parantheseses. This is an INITIALIZER.
// NOTE: Initializers enforce that all the properties are set before you start using them. THIS IS ONE OF THE REASONS SEWIFT IS SAFE.
// Using uninitialised variables is a great way to introduce bugs.
// You don't need to explicitly create an initialiser when you define the Coordinate type. Swift automatically creates initialisers for structs using all properties. This is super useful.
// NOTE: We'll talk more about methods in the cha=pter METHODS? (?)

// reading values of properties (using dot syntax)
print(startingLocation.x)

// assigning values of properties (using dot syntax)
startingLocation.x = 50

print(startingLocation.x)

// functions in structs
// Let's say you have a struct that counts how many kilograms of certain types of cargo you have:
struct Cargo {
    var beans: Float
    var rice: Float
    var noodles: Float
    
// you can include functions
    func printLoad() {
        print("\(self.beans)kg of beans, \(self.rice)kg of rice, and \(self.noodles)kg of noodles.")
    }
}

let cargoPod = Cargo(beans: 10, rice: 43.5, noodles: 11.5)
cargoPod.printLoad()

// Structs are value types.
// Classes are reference types.

// Value type example:
// value types are copied on assignment
// for example:
var firstVariable = 100
var secondVariable = firstVariable
print(firstVariable) // prints 100
print(secondVariable) // prints 100
firstVariable = 50
print(firstVariable) // prints 50
print(secondVariable) // still prints 100

// NOTE: a value type is COPIED on assignment
// = means assign
// This applies to structs, because they are value types
var cargoPodOne = Cargo(beans: 5, rice: 10, noodles: 15)
cargoPodOne.printLoad() //prints: 5.0kg of beans, 10.0kg of rice, and 15.0kg of noodles.

var cargoPodTwo = cargoPodOne
cargoPodTwo.printLoad() //also prints: 5.0kg of beans, 10.0kg of rice, and 15.0kg of noodles.

cargoPodOne.beans = 42
cargoPodOne.rice = 19.6
cargoPodOne.noodles = 73.9
cargoPodOne.printLoad() //prints: 42.0kg of beans, 19.6kg of rice, and 73.9kg of noodles.
cargoPodTwo.printLoad() //still prints: 5.0kg of beans, 10.0kg of rice, and 15.0kg of noodles.

// when you assign one of the cargo pods to another it gets an exact copy. the two are completely independent. this demonstrates the VALUE SEMANTICS of working with structs.

// NOTE: most of of Swift's standard types are implemented as STRUCTS.
// The Int, Double, String, Bool, Array and Dictionary. etc.

// Classes are value types, though.

// TODO VALUE TYPE EXAMPLE

// TODO: SIDEBAR TO EXPLAIN POINTERS (OR LACK OF?)  


//Chapter - Basically Classy
//Introduction to Classes
//purpose
//defining
//instances of
//properties (stored, computed, constant, observers)
//properties (instance vs type vs static)
//methods (instance vs type)
//methods (parameter names - covered in functions)
//use of self
//are a reference type
//Don’t like what you’re given? Build it yourself!
//Extending Swift
//purpose/extending other entities
//computed property extensions
//initializer extensions
//method extensions
//subscript extensions
//More on Functions
//Advanced function topics
//Default parameter values
//Variadic parameters
//Function types
//Passing functions as parameters or return values
//Tuples as return types
//Really Classy
//Advanced class features
//overriding - properties, methods, subscripts, preventing
//subscript methods
//member protection
//initialization
//designated vs convenience
//deinitialization

// Basic Class
class Spaceship {
    var vesselName: String
    var engineCount: Int
    
    init(vesselName: String, engineCount: Int) {
        self.vesselName = vesselName
        self.engineCount = engineCount
    }
}

// Instantiating a basic class
let reddwarf = Spaceship(vesselName: "Red Dwarf", engineCount: 1)

//inheritance
class Shuttle: Spaceship {
    
}

class Freighter: Spaceship {
    
}


//preventing inheritance
final class OreCarrier: Freighter {
    // something
}

// error: Inheritance from final class 'OreCarrier'
class AnotherKindOfOreCarrier: OreCarrier {}

// using final on methods:
// TODO.

// Explaining Polymorphism

