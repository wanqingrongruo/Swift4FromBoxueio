//: Playground - noun: a place where people can play

import UIKit

var str = "更智能安全的Key Value Coding"

//class Foo: NSObject {
//    @objc var bar = "bar"
//    @objc var baz = [1, 2, 3, 4]
//}
//
//var foo = Foo()
//foo.bar
//
//let barKeyPath = \Foo.bar // 带有属性的类型信息
//var bar = foo[keyPath: barKeyPath]
//foo[keyPath: barKeyPath] = "BAR"

// 除了类型安全之外，新的KeyPath用法适应性也更好，我们无须要求Foo是NSObject的派生类，也不必用@objc修饰属性，把Foo改成这样，之前的代码仍旧可以正常工作
//class Foo {
//    var bar = "bar"
//    var baz = [1, 2, 3, 4]
//}

struct Foo {
    var bar = "bar"
    var baz = [1, 2, 3, 4]
}

var foo = Foo()
foo.bar

let barKeyPath = \Foo.bar // 带有属性的类型信息
var bar = foo[keyPath: barKeyPath]
foo[keyPath: barKeyPath] = "BAR"