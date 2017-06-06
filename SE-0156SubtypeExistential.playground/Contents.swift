//: Playground - noun: a place where people can play

import UIKit

var str = "SE-0156 Subtype existential"

// 用AnyObject约束任意遵从protocol的类

protocol P {}
struct S: P {}
class C: P{}

class D{}


let u: AnyObject & P = C()
let v: P & AnyObject = C() // AnyObject 和 P 先后并没有关系

//let t: AnyObject & P = S() //  error: 'S' is not a class
//let w: AnyObject & P = D() //  error: 'S' does not conform to specified type 'P'


// 用具体的类名约束遵从protocol的类以及派生类

class E: D, P {}

let w: D & P = E()

// 不能限制struct类型的protocol约束
// let q: S & P = S() // error: non-protocol, non-class type 'S' cannot be used within a protocol-constrained type
