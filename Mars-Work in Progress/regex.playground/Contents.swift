import Foundation

extension NSRegularExpression {
    func matches(in text: String) -> [NSTextCheckingResult] {
        return self.matches(in: text, range: NSRange(text.startIndex..., in: text))
    }
}

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

let helloGreetings: RegEx = "(Hello|Hi|Howdy)"
let goodbyeGreetings: RegEx = "(Goodbye|Bye|Ciao)"
let greeting = "Bye"

switch greeting {
    case helloGreetings: print("Hello!")
    case goodbyeGreetings: print("Goodbye!")
    default: print("Sorry, I didn't get that!")
}
