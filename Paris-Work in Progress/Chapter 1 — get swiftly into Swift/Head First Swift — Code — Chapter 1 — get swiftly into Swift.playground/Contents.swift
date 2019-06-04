// Head First Swift (1st Edition)
// Code Sample Playground
// CHAPTER: get swiftly into Swift
// COMMENTS: This chapter covers the very basics of Swift, the the environment, as a taster to get excited about the rest of Swift, and the book!
// --------------------------------------------------------------
// ⬇ This code is to welcome readers to Head First Swift:
// --------------------------------------------------------------
let welcomeMessage = "Welcome to Head First Swift!"
var authorsArray = ["Paris Buttfield-Addison", "Mars Geldard", "Tim Nugent"]


func showWelcome(with message: String, and authors: [String]) {
    print(message)
    
    for author in authors {
        print("Your humble author, \(author), is excited you're reading!")
    }
}

showWelcome(with: welcomeMessage, and: authorsArray)
// --------------------------------------------------------------
// ⬇ Code with three simple errors
// --------------------------------------------------------------
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
// --------------------------------------------------------------
// ⬇ Going loopy... but not too loopy
// --------------------------------------------------------------
// what you might find in other languages
//for (i = 1; i <= 10; i++) {
//    print(i);
//}
// OUTPUT: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

// But Swift makes it cleaner, and easier
for n in 1...10 {
    print(n)
}
// for-in collection example
let numbers = [5, 10, 15, 20, 25, 30]

for number in numbers {
    print(number+1)
}
// --------------------------------------------------------------
// ⬇ Be the Playground Exercise
// --------------------------------------------------------------
// Program 1 (Be the Playground Exercise)
for n in 1...10 {
    print(n)
}

// Program 2 (Be the Playground Exercise)
var myMessage = "It's a great day to write some Swift!"
print(myMessage)
myMessage = "I still love Swift!"
print(myMessage)

// Program 3 (Be the Playground Exercise)
// TODO
// --------------------------------------------------------------

