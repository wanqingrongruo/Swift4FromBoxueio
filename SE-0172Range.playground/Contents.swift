//: Playground - noun: a place where people can play

import UIKit

var str = "SE-0172 - 更方便的单边Range"

// in swift3
let s = "hello world"
var i = s.index(of: " ")!
//let greeting = s[s.startIndex ..<  i]
//i = s.index(i, offsetBy: 1)
//let name = s[i ..< s.endIndex]

//let greeting = s.prefix(upTo: i)
//let grertingWithSpace = s.prefix(through: i)
//i = s.index(i, offsetBy: 1)
//let name = s.suffix(from: i)


// in swift4

let greeting = s[ ..<i]
let greetingWithSpace = s[ ...i]

i = s.index(i, offsetBy: 1)
let name = s[i...]


// 更方便的表达无穷序列

Array(s.enumerated())
Array(zip(1..., s))

Array(zip(s, 1...))


// 更方便的 pattern matching
let n = 10
switch n {
case 6...:
    print(">= 6")
default:
    break
}

// protocol RangeExpression
