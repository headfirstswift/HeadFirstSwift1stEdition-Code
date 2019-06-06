import Foundation

// just doing it with a string?

extension NSRegularExpression {
    func matches(in text: String) -> [NSTextCheckingResult] {
        return self.matches(in: text, range: NSRange(text.startIndex..., in: text))
    }
}

extension String {
    func matches(regex pattern: String) throws -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: pattern)
            let matches = regex.matches(in: self)
            return matches.map({ String(self[Range($0.range, in: self)!]) })
        } catch {
            throw error as Error
        }
    }
}

let letters = try? "Planet!".matches(regex: "[A-Za-z]") // cool!

// what about a switch approach?

struct RegEx: ExpressibleByStringLiteral {
    private let string: String
    let pattern: NSRegularExpression?
    
    init(stringLiteral value: String) {
        self.string = value
        self.pattern = try? NSRegularExpression(pattern: value)
    }
}

func ~= (pattern: RegEx, value: String) -> Bool {
    if let regex = pattern.pattern {
        let results = regex.matches(in: value)
        return results.count > 0
    }
    
    return false
}

// it fiddly but still good!
let greeting = "Bye"

switch greeting {
    case RegEx("(Hello|Hi|Howdy)"): print("Hello!")
    case RegEx("(Goodbye|Bye|Ciao)"): print("Goodbye!")
    default: print("Sorry, I didn't get that!")
}
