//: Playground - noun: a place where people can play

import UIKit

var str = "为什么要新增一个swapAt方法？"

// 在SE-0173中，为MutableCollection添加了一个新的方法：swapAt，它接受一个集合中的两个Index位置，并直接在原集合对象上交换对应位置的元素

var numbers = [0, 1, 2, 3, 4, 5]
numbers.swapAt(0, 5)

// in swift 3
swap(&numbers[0], &numbers[5])
numbers
// 之所以要添加swapAt方法，简单来说，是因为之前的swap方法违背了Swift Ownership Manifesto中的约定，在一个函数里，同一个变量不能传递给两个inout参数。因此，在未来的Swift版本里，swap方法会被标记为过期，让开发者过渡到swapAt方法