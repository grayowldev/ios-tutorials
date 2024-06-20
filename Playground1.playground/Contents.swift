import UIKit

var greeting = "Hello, playground"
print(greeting)

greeting = "I can write swift"
print(greeting)

func greet(message: String) {
    print(message)
}

func add(a: Int, b: Int) -> Int {
    print(String(a) + " + " + String(b) + " is ", a + b)
    return a + b
}

greet(message: "Hello World")

add(a: 2, b: 5)


