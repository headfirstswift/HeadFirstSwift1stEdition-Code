import Foundation

// --------------------------------------------------------------
// ⬇ This code is setup for the rest:
// --------------------------------------------------------------
protocol CelestialBody: CustomDebugStringConvertible {
    var name: String { get }
}

extension CelestialBody {
    var debugDescription: String {
        return "A \(type(of: self)) named \(self.name)."
    }
}

protocol Spherical {
    var diameter: Double { get }
}

extension Spherical {
    var volume: Double {
        let radius = self.diameter / 2
        return (4 / 3) * (Double.pi * pow(radius, 3))
    }
}

enum PlanetType {
    case terran, jovian
}

struct Planet: CelestialBody, Spherical {
    let name: String
    let diameter: Double
    let moonCount: Int
    let type: PlanetType
    let habitable: Bool
}

struct Sun: CelestialBody, Spherical {
    let name: String
    let diameter: Double
}

struct FieldOfAsteroids: CelestialBody {
    let name: String
    let mass: Double
}

let mercury = Planet(name: "Mercury", diameter: 4879, moonCount: 0, type: .terran, habitable: false)
let venus   = Planet(name: "Venus", diameter: 12104, moonCount: 0, type: .terran, habitable: false)
let earth   = Planet(name: "Earth", diameter: 12756, moonCount: 1, type: .terran, habitable: true)
let mars    = Planet(name: "Mars", diameter: 6792, moonCount: 2, type: .terran, habitable: false)
let jupiter = Planet(name: "Jupiter", diameter: 142984, moonCount: 79, type: .jovian, habitable: false)
let saturn  = Planet(name: "Saturn", diameter: 120536, moonCount: 62, type: .jovian, habitable: false)
let uranus  = Planet(name: "Uranus", diameter: 51118, moonCount: 27, type: .jovian, habitable: false)
let neptune = Planet(name: "Neptune", diameter: 49528, moonCount: 14, type: .jovian, habitable: false)

let innerPlanets = [mercury, venus, earth, mars]
let outerPlanets = [jupiter, saturn, uranus, neptune]
let planets = innerPlanets + outerPlanets

let theSun = Sun(name: "Sol", diameter: 1391000)
let asteroidBelt = FieldOfAsteroids(name: "The Main Asteroid Belt", mass: 3e21)
let kuiperBelt = FieldOfAsteroids(name: "The Kuiper Belt", mass: 2e23)

let celestialBodies: [CelestialBody] = [theSun] + innerPlanets + [asteroidBelt] + outerPlanets + [kuiperBelt]

// --------------------------------------------------------------
// ⬇ This code is Pattern-matching:
// --------------------------------------------------------------
// pattern matching is useful for categorising and generalising things
// so many sub-types can be treated as being in different buckets
// while maintaining unique behaviours

/// if case let, guard let, for case let <===TODO===

/// wildcards <===TODO===

/// where (condition chaining) <===TODO===
for body in celestialBodies where body is Spherical  {
    
}

// ~= Expression Pattern is like "contains/isin" in the case of numbers
// but means "matches pattern"
print("\n====================\n MOONS\n====================")
for planet in planets {
    if planet.moonCount == 0 {
        print("\(planet.name) has no moons.")
    } else if 1..<6 ~= planet.moonCount {
        print("\(planet.name) has a small amount of moons!")
    } else if 6..<20 ~= planet.moonCount {
        print("\(planet.name) has a considerable amount of moons!")
    } else if 20... ~= planet.moonCount {
        print("\(planet.name) has SO many moons!")
    } else {
        print("ERROR: There was no information about moon count for \(planet.name)!")
    }
}

// the operator is inferred in switch cases with range-matching
// (this code is equivalent to the above)
print("\n====================\n MOONS\n====================")
for planet in planets {
    switch planet.moonCount {
        case 0: print("\(planet.name) has no moons.")
        case 1..<6: print("\(planet.name) has a small amount of moons!")
        case 6..<20: print("\(planet.name) has a considerable amount of moons!")
        case 20...: print("\(planet.name) has SO many moons!")
        default: print("ERROR: There was no information about moon count for \(planet.name)!")
    }
}

enum MassCategory{
    case small, medium, large
    
    var volumeRange: Range<Double> {
        switch self {
            case .small: return 0..<10e11
            case .medium: return 10e11..<10e13
            case.large: return 10e13..<10e50
        }
    }
}

// which means we can overload it to do great things in switch statements
func ~= (pattern: MassCategory, value: Spherical) -> Bool {
    return pattern.volumeRange.contains(value.volume)
}

print("\n====================\n MASSES\n====================")
for body in celestialBodies {
    guard let sphericalBody  = body as? Spherical else {
        print("\(body.name) is of too irregular mass to calculate volume!")
        continue
    }
    
    switch (sphericalBody) {
        case .small: print("\(body.name) is small in volume!")
        case .medium: print("\(body.name) is medium in volume!")
        case .large: print("\(body.name) is large in volume!")
        default: print("\(body.name) is totally unprecedented in volume!")
    }
}

// --------------------------------------------------------------
// ⬇ This code is Error handling with optional chaining:
// --------------------------------------------------------------

// --------------------------------------------------------------
// ⬇ This code is .map() and compactMap():
// --------------------------------------------------------------

// --------------------------------------------------------------
// ⬇ This code is Throwing and handling errors:
// --------------------------------------------------------------

// --------------------------------------------------------------
// ⬇ This code is Encoding and decoding:
// --------------------------------------------------------------

// automatic synthesis of codable

struct SpaceShuttle: Codable {
    let name: String
    let designation: String
}

struct Fleet: Codable {
    var shuttles: [SpaceShuttle]
}

let shuttles = [
    SpaceShuttle(name: "Challenger", designation: "OV-099"),
    SpaceShuttle(name: "Enterprise", designation: "OV-101"),
    SpaceShuttle(name: "Colombia", designation: "OV-102"),
    SpaceShuttle(name: "Discovery", designation: "OV-103"),
    SpaceShuttle(name: "Atlantis", designation: "OV-104"),
    SpaceShuttle(name: "Endeavour", designation: "OV-105")
]

let nasaFleet = Fleet(shuttles: shuttles)

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted
var encoded: Data? = nil

do {
    encoded = try encoder.encode(nasaFleet)
} catch {
    print("Error encoding JSON: \(error)")
}

if let encodedJSON = encoded, let string = String(data: encodedJSON, encoding: .utf8) {
    print(string)
} else {
    print("Improperly encoded JSON object, somehow!")
}

// non-automica synthesis of codable (DIY adherence)

///==============================================================
/// PICK SOME ACTIVITIES

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
