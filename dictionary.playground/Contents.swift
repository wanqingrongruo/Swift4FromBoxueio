//: Playground - noun: a place where people can play

import UIKit

var str = "SE-0165 Dictionary初始化以及常用操作的诸多改进"

// 改进的 init 方法

let numberSet = Set(1...100)
let events = numberSet.lazy.filter{ $0 % 2 == 0 }
type(of: events)

let eventSet = Set(events) // 初始化为原来的类型
eventSet.isSubset(of: numberSet)


let numberDic = ["one": 1, "two": 2, "three": 3]
let eventColl = numberDic.lazy.filter{ $0.1 % 2 == 0 }
type(of: eventColl)
// let eventDic = Dictionary(eventColl) // error

// let eventDic = Dictionary(uniqueKeysWithValues: eventColl) // 仍未实现
let eventDic = Dictionary(uniqueKeysWithValues: eventColl.map{ (key: $0.0, value: $0.1) }) // 临时解决方案


let numbers = ["ONE", "TWO", "THREE"]
var numbersDic = Dictionary(uniqueKeysWithValues: numbers.enumerated().map{ ($0.0 + 1, $0.1) })
numbersDic

numbersDic = Dictionary(uniqueKeysWithValues: zip(1..., numbers))

// 用一句话总结就是，init(uniqueKeysWithValues:)的目的，就是把各种处理过后的集合类型，重新变回标准Dictionary

// 解决数据源中的重复 key
let duplicates = [("a", 1), ("b", 2), ("a", 3), ("b", 4)]
// let letters = Dictionary(uniqueKeysWithValues: duplicates)
var  letters = Dictionary(duplicates, uniquingKeysWith: { (first, _) in first })
letters
letters = Dictionary(duplicates, uniquingKeysWith: { (first, last) in last })
letters
// uniquingKeysWith的类型是(Value, Value) throws -> Value，表示如何处理Key相同时的两个Value。在上面的例子里，我们执行的动作就是只选择第一个 或 第二个


let names = ["Aaron", "Abe", "Bain", "Bally", "Bald", "Mars", "Nacci"]
let groupNames = Dictionary(grouping: names, by: { $0.first! })
groupNames


// 带有默认值的下标操作符

let characters = "aaaabbdhsjs"
var freuencies: [Character: Int] = [:]

characters.forEach{
    if freuencies[$0] != nil {
        freuencies[$0]! += 1
    }
    else{
        freuencies[$0] = 1
    }
}

characters.forEach{
    freuencies[$0, default: 0] += 1 // 在下标操作符中使用了default，对Dictionary的访问就不再返回optional了
}

// 在Swift 3中，对Dictionary调用filter会返回一个Array<(Key, Value)>，但在Swift 4里，返回的结果，仍旧是和之前同样的Dictionary
let filtered = numberDic.filter{ $0.value % 2 == 0 }
type(of: filtered)


// 对Dictionary中的Value进行某种变换，并保持Dictionary的类型不变
let mapped = numbersDic.mapValues{ $0.lowercased() }
mapped



