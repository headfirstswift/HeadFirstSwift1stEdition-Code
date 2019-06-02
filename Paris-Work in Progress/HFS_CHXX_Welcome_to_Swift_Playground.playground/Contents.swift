// HEAD FIRST SWIFT (1st EDITION)
// CHAPTER 1

// This code is to welcome readers to Head First Swift

let welcomeMessage = "Welcome to Head First Swift!"
var authorsArray = ["Paris Buttfield-Addison", "Mars Geldard", "Tim Nugent"]


func showWelcome(with message: String, and authors: [String]) {
    print(message)
    
    for author in authors {
        print("Your humble author, \(author), is excited you're reading!")
    }
}

showWelcome(with: welcomeMessage, and: authorsArray)

// Code with three simple errors
//let welcomeMessage = "Welcome to Head First Swift!"
//var authorsArray = ["Paris Buttfield-Addison", "Mars Geldard", "Tim Nugent"
//
//
//func showWelcome(with message: String, and authors: [String]) {
//    print(msg)
//
//    for author in authors {
//        print("Your humble author, \(author), is excited you're reading!")
//    }
//}
//
//showWelcome(with: welcomeMessage, and: authorsArray

