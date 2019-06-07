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
//if case (_,0,0) = coordinate {
    // is on the x axis
//}

// where (condition chaining)

print("\n====================\n TERRAFORMING\n====================")

// you could do it like this:
for planet in planets { // iterates over whole list, just does nothing sometimes
    if planet.type == .terran && !planet.habitable {
        print("\(planet.name) may be suitable for terraforming!")
    }
}

// or you could do it like this:
let nonHabitableTerranPlanets = planets.filter({ planet in planet.type == .terran && !planet.habitable })
for planet in nonHabitableTerranPlanets {
    print("\(planet.name) may be suitable for terraforming!")
}

// or even combine on one like to make a mess like this:
for planet in planets.filter({ planet in planet.type == .terran && !planet.habitable }) {
    print("\(planet.name) may be suitable for terraforming!")
}

// but this is easier (and possibly faster?)
for planet in planets where planet.type == .terran && !planet.habitable  {
    print("\(planet.name) may be suitable for terraforming!")
}

// ~= Expression Pattern is like "contains/is in" in the case of numbers
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
/// ⬇ This code is Error handling with optional chaining:
// --------------------------------------------------------------

// --------------------------------------------------------------
// ⬇ This code is .map() and compactMap():
// --------------------------------------------------------------
let celestialBodiesThatAreSpherical = celestialBodies.filter({ $0 is Spherical }) // gets CelestialBodies that are Spherical

print("\n====================\n VOLUME\n====================")
for body in celestialBodiesThatAreSpherical {
    if let sphericalBody = body as? Spherical { // but then you have to do a cast
        print("Volume of spherical body of diameter \(sphericalBody.diameter)km is \(sphericalBody.volume)")
    }
}

let sphericalBodies = celestialBodies.compactMap({ $0 as? Spherical }) // gets CelestialBodies that are Spherical AS SPHERICAL TYPE

for sphericalBody in sphericalBodies { // saves some iterations and is already the right type
    print("Volume of spherical body of diameter \(sphericalBody.diameter)km is \(sphericalBody.volume)")
}

// what if you want details across types?
let namedMixedBodies = celestialBodies.map({ body in (name: body.name, volume: (body as? Spherical)?.volume) })

for body in namedMixedBodies { // saves some iterations and is already the right type
    if let volume = body.volume {
        print("Volume of \(body.name) is \(volume)")
    } else {
        print("Volume of \(body.name) is inestimable with given information!")
    }
}

// a little bit of other higher-order functions for later on

extension Collection {
    func list() -> String {
        //return self.map({ "- \($0)"}).joined(separator: "\n") // <-- works
        //return self.map({ element in  "- \($element)"}).joined(separator: "\n") // <-- makes more sense
        //return self.reduce("", { $0 + "- \($1)\n" }) // <-- is better
        return self.reduce("", { (string, element) in string + "- \(element)\n" }) // <-- makes more sense AND is better
    }
}

// --------------------------------------------------------------
/// ⬇ This code is Throwing and handling errors:
// --------------------------------------------------------------

// --------------------------------------------------------------
// ⬇ This code is Encoding and decoding:
// --------------------------------------------------------------

// automatic synthesis of codable
struct SpaceShuttle: Codable, CustomStringConvertible {
    let name: String
    let designation: String
    
    var description: String {
        return "🚀 \(name) (\(designation))"
    }
}

struct Fleet: Codable, CustomStringConvertible {
    var shuttles: [SpaceShuttle]
    
    var description: String {
        return "Fleet of \(shuttles.count) Space Shuttles:\n" + shuttles.list()
    }
}

let fleet = """
    {
        "shuttles" : [
            {
                "name" : "Challenger",
                "designation" : "OV-099"
            },
            {
                "name" : "Enterprise",
                "designation" : "OV-101"
            },
            {
                "name" : "Colombia",
                "designation" : "OV-102"
            },
            {
                "name" : "Discovery",
                "designation" : "OV-103"
            },
            {
                "name" : "Atlantis",
                "designation" : "OV-104"
            },
            {
                "name" : "Endeavour",
                "designation" : "OV-105"
            }
        ]
    }
"""

let decoder = JSONDecoder()

let nasaFleet = try! decoder.decode(Fleet.self, from: fleet.data(using: .utf8)!)
print("\n====================\n SHUTTLES (DECODED)\n====================")
print(nasaFleet)


let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted

var encoded = try! encoder.encode(nasaFleet)
print("\n====================\n SHUTTLES (ENCODED)\n====================")
print(String(data: encoded, encoding: .utf8)!)


// non-automatic synthesis of codable (DIY adherence)

struct FlightLogEntry: Codable, CustomStringConvertible {
    let date: Date
    let craft: SpaceShuttle
    let crew: Int
    let duration: TimeInterval
    let missionCode: String
    let maidenVoyage: Bool
    let landingSite: LandingSite
    
    private var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.string(from: self.date)
    }
    
    private var durationHours: Int {
        return Int(self.duration) / (60 * 60 * 100)
    }
    
    var description: String {

        return "\(self.dateString): \(self.craft) on mission \(self.missionCode) | crew: \(self.crew) | duration: \(self.durationHours / 24)d \(self.durationHours % 24)h | landed: \(self.landingSite.rawValue)" + (self.maidenVoyage ? " | MAIDEN VOYAGE" : "")
    }
    
    enum LandingSite: String, Codable {
        case edwards, kennedy, whitesands
    }
}

// extension maintains automatic pairwise initialiser
extension FlightLogEntry {
    private enum CodingKeys: String, CodingKey {
        case date, craft, crew, duration
        case missionCode = "mission_code"
        case maidenVoyage = "maiden_voyage"
        case landingSite = "landing_site"
    }
    
    init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.date = try container.decode(Date.self, forKey: .date)
            self.craft = try container.decode(SpaceShuttle.self, forKey: .craft)
            self.crew = try container.decode(Int.self, forKey: .crew)
            self.duration = try container.decode(TimeInterval.self, forKey: .duration)
            self.missionCode = try container.decode(String.self, forKey: .missionCode)
            self.maidenVoyage = try container.decode(Bool.self, forKey: .maidenVoyage)
            self.landingSite = try container.decode(LandingSite.self, forKey: .landingSite)
        } catch {
            throw error
        }
    }
    
    func encode(to encoder: Encoder) throws {
        do {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(self.date, forKey: .date)
            try container.encode(self.craft, forKey: .craft)
            try container.encode(self.crew, forKey: .crew)
            try container.encode(self.duration, forKey: .duration)
            try container.encode(self.missionCode, forKey: .missionCode)
            try container.encode(self.maidenVoyage, forKey: .maidenVoyage)
            try container.encode(self.landingSite, forKey: .landingSite)
        } catch {
            throw error
        }
    }
}

// this is bad, don't do this (usually do the excessive checks, but since we know in this case because it's right up there 👆, it's okay)
let challenger = nasaFleet.shuttles.filter({ $0.designation == "OV-099" })[0]
let enterprise = nasaFleet.shuttles.filter({ $0.designation == "OV-101" })[0]
let colombia = nasaFleet.shuttles.filter({ $0.designation == "OV-102" })[0]
let discovery = nasaFleet.shuttles.filter({ $0.designation == "OV-103" })[0]
let atlantis = nasaFleet.shuttles.filter({ $0.designation == "OV-104" })[0]
let endeavour = nasaFleet.shuttles.filter({ $0.designation == "OV-105" })[0]

extension Date {
    static func makeFrom(m month: Int, d day: Int, y year: Int, _ hr: Int = 0, _ min: Int = 0, _ sec: Int = 0) -> Date {
        let calendar = Calendar(identifier: .gregorian)
        let components = DateComponents(year: year, month: month, day: day, hour: hr, minute: min, second: sec)
        return calendar.date(from: components)!
    }
}

extension TimeInterval {
    static func makeFrom(d days: Int = 0, h hours: Int = 0, m min: Int = 0, s sec: Int = 0) -> TimeInterval {
        let daysMs = days * 24 * 60 * 60 * 1000
        let hoursMs = hours * 60 * 60 * 1000
        let minutesMs = min * 60 * 1000
        let secondsMs = sec * 1000
        return TimeInterval(daysMs + hoursMs + minutesMs + secondsMs)
    }
}

let log: [FlightLogEntry] = [
    FlightLogEntry(date: Date.makeFrom(m: 08, d: 12, y: 1977), craft: enterprise, crew: 2, duration: TimeInterval.makeFrom(m: 5), missionCode: "ALT-12", maidenVoyage: true, landingSite: .edwards),
    FlightLogEntry(date: Date.makeFrom(m: 04, d: 12, y: 1981), craft: colombia, crew: 2, duration: TimeInterval.makeFrom(d: 2, h: 6), missionCode: "STS-1", maidenVoyage: true, landingSite: .edwards),
    FlightLogEntry(date: Date.makeFrom(m: 04, d: 04, y: 1982), craft: challenger, crew: 4, duration: TimeInterval.makeFrom(d: 5), missionCode: "STS-6", maidenVoyage: true, landingSite: .edwards),
    FlightLogEntry(date: Date.makeFrom(m: 08, d: 30, y: 1984), craft: discovery, crew: 6, duration: TimeInterval.makeFrom(d: 6), missionCode: "STS-41-D", maidenVoyage: true, landingSite: .edwards),
    FlightLogEntry(date: Date.makeFrom(m: 08, d: 27, y: 1985), craft: atlantis, crew: 5, duration: TimeInterval.makeFrom(d: 6, h: 1), missionCode: "STS-51-J", maidenVoyage: true, landingSite: .edwards),
    FlightLogEntry(date: Date.makeFrom(m: 05, d:07, y: 1992), craft: endeavour, crew: 7, duration: TimeInterval.makeFrom(d: 8, h: 21), missionCode: "STS-49", maidenVoyage: true, landingSite: .edwards)
]

encoder.dateEncodingStrategy = .iso8601
encoded = try! encoder.encode(log)
print("\n====================\n FLIGHT LOG (ENCODED)\n====================")
print(String(data: encoded, encoding: .utf8)!)

decoder.dateDecodingStrategy = .iso8601
var flightLog = try! decoder.decode([FlightLogEntry].self, from: encoded)
print("\n====================\n FLIGHT LOG (DECODED)\n====================")
print("Log of \(flightLog.count) flights:\n" + flightLog.list())

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
