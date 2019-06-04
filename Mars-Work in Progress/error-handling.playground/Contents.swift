// --------------------------------------------------------------
// ⬇ This code is Pattern-matching:
// --------------------------------------------------------------
protocol CelestialBody: CustomDebugStringConvertible {
    var name: String { get }
}

extension CelestialBody {
    var debugDescription: String {
        return "A \(type(of: self)) named \(self.name)."
    }
}

import Foundation

enum PlanetType {
    case terran, jovian
}

struct Planet: CelestialBody {
    let name: String
    let diameter: Double
    let moonCount: Int
    let type: PlanetType
    let habitable: Bool
}

struct Sun: CelestialBody {
    let name: String
    let diameter: Double
}

let mercury = Planet(name: "Mercury", diameter: 4879, moonCount: 0, type: .terran, habitable: false)
let venus   = Planet(name: "Venus", diameter: 12104, moonCount: 0, type: .terran, habitable: false)
let earth   = Planet(name: "Earth", diameter: 12756, moonCount: 1, type: .terran, habitable: true)
let mars    = Planet(name: "Mars", diameter: 6792, moonCount: 2, type: .terran, habitable: false)
let jupiter = Planet(name: "Jupiter", diameter: 142984, moonCount: 79, type: .jovian, habitable: false)
let saturn  = Planet(name: "Saturn", diameter: 120536, moonCount: 62, type: .jovian, habitable: false)
let uranus  = Planet(name: "Uranus", diameter: 51118, moonCount: 27, type: .jovian, habitable: false)
let neptune = Planet(name: "Neptune", diameter: 49528, moonCount: 14, type: .jovian, habitable: false)

let planets = [mercury, venus, earth, mars, jupiter, saturn, uranus, neptune]
let theSun = Sun(name: "Sol", diameter: 1391000)

func volumeOfSphere(with radius: Double) -> Double {
    return (4 / 3) * (Double.pi * pow(radius, 3))
}

// if guard for

// wildcards

// where (condition chaining)

// ~= Expression Pattern
for planet in planets {
    if planet.moonCount == 0 {
        
    }
    
    if 1..<6 ~= planet.moonCount {
        
    }
    
    if 6..<20 ~= planet.moonCount {
        
    }
    
    if 20... ~= planet.moonCount {
        
    }
}

for planet in planets {
    switch (planet.moonCount) {
        case 0: print("\(planet.name) has no moons.")
        case 1..<6: print("\(planet.name) has a small amount of moons!")
        case 6..<20: print("\(planet.name) has a considerable amount of moons!")
        case 20...: print("\(planet.name) has SO many moons!")
        default: print("ERROR: There was no information about moon count for \(planet.name)!")
    }
}

// overloading


//: Error handling with optional chaining

//: .map() and compactMap()

//: Throwing and handling errors
// multiple and rethrows

//: Encoding and decoding
typealias Codable = Decodable & Encodable

// --------------------------------------------------------------
// ⬇ This code is Be The Playground:
// --------------------------------------------------------------

// 3-6 paper debugging activities

// --------------------------------------------------------------
// ⬇ This code is Mixed Messages:
// --------------------------------------------------------------

// code block

// potential missing code segments (+ red herrings)

// potential outputs (+ red herrings)

// --------------------------------------------------------------
// ⬇ This code is Code Magnet:
// --------------------------------------------------------------

// code block with blanks

// bits to fill in blanks (+ red herrings)

// --------------------------------------------------------------
// ⬇ This code is Sharpen Your Pencil:
// --------------------------------------------------------------

// large chunk of code (20 - 40 lines)

// output if run

// output if run with change (one or more)

// --------------------------------------------------------------
// ⬇ This code is Pool Puzzle:
// --------------------------------------------------------------

// like magnets again but list rather than set of magnets
