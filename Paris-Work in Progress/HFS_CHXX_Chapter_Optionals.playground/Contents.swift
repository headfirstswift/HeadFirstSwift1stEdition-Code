// CODE for CHAPTER: Optionals

import UIKit


//: # OPTIONALS
//: ## Defining
var integer: Int
integer = 1
// integer = nil // ERROR: 'nil' cannot be assigned to type 'Int'

var optionalInteger: Int?
optionalInteger = 1
optionalInteger = nil
optionalInteger = 2

//: ## Unwrapping
// you may think to do it like this
if optionalInteger == nil {
    optionalInteger = 0
}

// but swift can't tell with sufficient certainty that the value will never be nil after the 'if' statement
// optionalInteger = optionalInteger + 1 // ERROR: value of optional type 'Int?' must be unwrapped to a value of type 'Int'

// so we have some ways to un-optional and optional type: unwrapping
// option 1: "trust me, it won't be nil by the time you get here"
optionalInteger = optionalInteger! + 1

// option 2: "try to use it, but if it's nil by the time you get here then use this other value instead"
var nonoptionalInteger = optionalInteger ?? 0
nonoptionalInteger += 1

//: ## Optional binding with let/var
// like saying "if optionalInteger is not nil, assign its value to var unwrappedInteger as non-optional (as one clean step)"
if var unwrappedInteger = optionalInteger {
    // it was not nil, so we can use its new non-optional counterpart
    unwrappedInteger += 1
} else {
    // it was nil, so we can ignore it and do something else
    var unwrappedInteger = 1
    
    // STUFF TO MAKE THE YELLOW GO AWAY (REMOVE BEFORE USE)
    print(unwrappedInteger)
    unwrappedInteger += 1
}

//: ## Returning optional values from functions

//: ## Optional chaining / Implicitly unwrapped optionals
// lets define a cell that holds some value and optionally some information about it, such as encoding
struct Cell {
    var value: String?
    var typeInformation: String?
    
    init(value: String?, typeInformation: String? = nil) {
        self.value = value
        self.typeInformation = typeInformation
    }
    
    func describeValues() {
        //print("\(value, default: "NULL") (\(typeInformation, default: "String"))")
    }
}

// cells fit into rows, each of which has zero or more cells
struct Row {
    var index: Int! // we promise this will have a value whenever you use it, but it can start as nil
    var cells: [Cell]
    
    init(cells: [Cell] = []) {
        self.index = nil
        self.cells = cells
    }
}

// rows fit into a table which each have a name, an optional header row, and zero or more rows of value
// a table's values are somewhat protected against meddling by making them settable only from within the struct declaration
struct Table: CustomStringConvertible {
    var name: String
    var headers: Row?
    var rows: [Row]
    var description: String { return tableString() }
    
    init(name:  String, headers: Row? = nil) {
        self.name = name
        self.headers = headers
        self.rows = []
        
        self.headers?.index = -1 // headers may not exist, but if it does then do this to it
    }
    
    subscript(column: Int) -> [Cell] {
        get {
            guard column < columnCount() - 1 else { return [] }
            
            var cells: [Cell] = []
            
            for row in rows {
                cells.append(row.cells[column])
            }
            
            return cells
        }
    }
    
    mutating func addRow(_ row: Row) {
        let index = rows.count
        rows.append(row)
        rows[index].index = index
    }
    
    func columnCount() -> Int {
        if let headers = headers {
            return headers.cells.count
        }
        
        return rows.first?.cells.count ?? 0
    }
    
    func columnIndices() -> [Int] {
        return Array(0..<columnCount())
    }
    
    func tableString() -> String {
        var description = ""
        
        if let headers = headers {
            description += "|"
            for cell in headers.cells {
                description += " \(String(describing: cell.value ?? "NULL")) |"
                // description += "\(cell.value, default: "NULL") | "
            }
            description += "\n\n"
        }
        
        for row in rows {
            for cell in row.cells {
                description += "\(String(describing: cell.value ?? "NULL"))  "
                // description += "\(cell.value, default: "NULL")"
            }
            description += "\n"
        }
        
        return description
    }
}

let headerRow = Row(cells: [Cell(value: "Name"), Cell(value: "DOB")])
var table = Table(name: "People", headers: headerRow)

var person1 = Row(cells: [Cell(value: "Jane Doe"), Cell(value: "d1993-05-07", typeInformation: "yyyy-MM-dd")]) // this one has a mistake that means it won't convert to date
var person2 = Row(cells: [Cell(value: "John Doe"), Cell(value: "1986-06-30", typeInformation: "yyyy-MM-dd")])

table.addRow(person1) // oh no, but we put it in the table
table.addRow(person2)

if let jane = table.rows.first(where: { row in row.cells.first?.value == "Jane Doe" }) { // find me the row with the given name in the first cell, but if any stage of this request does not exits then just give up, don't tell me and carry on
    table.rows[jane.index].cells[1].value?.removeFirst() // if every stage of this exists, remove the first character of the value found, else just carry on
}

//: ## Closures

//: ### Defining closures
typealias ValueTransformer = (String?) -> Void // the 'Type' name RowTransformer now represents any function/closure that takes an optional String and returns nothing
typealias ValueMapper = (String?) -> String? // the 'Type' name RowTransformer now represents any function/closure that takes an optional String and returns an optional String

extension Table {
    
    mutating func transform(columns: [Int], with transformValue: ValueTransformer) {
        for row in self.rows {
            for index in 0..<row.cells.count {
                if columns.contains(index) {
                    transformValue(row.cells[index].value)
                }
            }
        }
    }
    
    mutating func transform(with valueTransformer: ValueTransformer) {
        transform(columns: columnIndices(), with: valueTransformer)
    }
    
    func map(columns: [Int], with mappingValue: ValueMapper, includeHeaders: Bool = true) -> Table {
        var newTable = Table(name: self.name, headers: self.headers)
        
        for row in self.rows {
            var rowCells: [Cell] = []
            
            for index in 0..<row.cells.count {
                let oldValue = row.cells[index].value
                let type = row.cells[index].typeInformation
                var newCell: Cell
                
                if columns.contains(index)  {
                    newCell = Cell(value: mappingValue(oldValue), typeInformation: type)
                } else {
                    newCell = Cell(value: oldValue, typeInformation: type)
                }
                rowCells.append(newCell)
            }
            newTable.addRow(Row(cells: rowCells))
        }
        
        return newTable
    }
    
    
    func map(with valueMapper: ValueMapper) -> Table {
        return map(columns: columnIndices(), with: valueMapper)
    }
}

//: ### Passing closures as parameters
let uppercaseTable = table.map(with: { cell in return cell?.uppercased() })

print(table)
print(uppercaseTable)

//: ### Automatic argument names

//: ### Trailing closures

//: ### Capturing values

//: ### Capturing values by reference (warning: may be too advanced?)

//: ### Some actual examples of where closures are used (HOF)




//: # SETS

//: ## Sets

//: ### Purpose

//: ### Defining

//: ### Accessing and manipulating set elements

//: ## Set properties

//: ## Iterating over Set elements

//: ## Set operations (union, intersect, etc)

//: ## Features that sets inherit from inbuilt protocols

//: ## Option sets (warning: too advanced?)

//: ## Legacy corner

//: ### NSSet

//: ### bridging between NSSet and Set


//: # GROUPING DATA AND BEHAVIOR

//: ## Structures
// purpose

// defining

// instances of

// properties (stored, computed, constant, observers)

// properties (instance vs type vs static)

// methods (instance vs type, mutating)

// methods (and parameter names - covered in functions)

// use of self

// initialization

// are a value type (eg., copied when passed around)

//: ## Enumerations

// purpose

//: ### defining
enum Day {
    case Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
}

// instances of


// properties (computed)

// methods (instance vs type, mutating(?))

// methods (parameter names - covered in functions)

// use of self

// initialization

//: ### raw values
// explicit


// inferred/extrapolated
enum Month: Int {
    case January = 1, February, March, April, May, June, July, August, September, October, November, December
}

// associated values

// recursive definitions (warning: advanced topic)



// OLD EXAMPLES
//class SpaceShip {
//    var engines:Int = 4
//    var name:String?
//    var manufactureDate:Int?
//}
//
//let myShip = SpaceShip()
//print(myShip.engines)
//print(myShip.name)
//print(myShip.manufactureDate)
//
//// Force unwrapping
//myShip.name = "Pine Goose"
//print(myShip.name!)
//
//// Optional binding
//let yourShip = SpaceShip()
//
//yourShip.name = "The Mad Hatter"
//
//print(yourShip.name)
//
//if let name = yourShip.name {
//    print(name)
//}

// Optional chaining
// TODO


