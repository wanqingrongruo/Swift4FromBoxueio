//: Playground - noun: a place where people can play

import UIKit

var str = "String 又是一个集合类型了"

// SE-0163
let greeting = "Hello Roni"
greeting.count

let spaceIndex = greeting.index(of: " ")!

let substring = greeting[..<spaceIndex]

greeting.forEach{
    print($0)
}


// SE-0168 Multi-Line String Literals
// 我们可以用一对三个单引号（这叫做triple quotes）来包含任何行字符串内容,这样，无论字符串包含任何值（包括引号、各种空格、换行符等），都会原封不动的保留下来

let xmlInfo = """
<?xml version="1.0"?>
<episode id="1">
<title>String is a collection again</title>
<author>11</author>
<created_at>2017-05-18</created_at>
</episode>
"""

let jsonInfo = """
{
    "episode": {
    "title": "String is a collection",
    "author": "11",
    "created_at": "2017-05-18"
    }
}
"""

print(xmlInfo)
print(jsonInfo)


// SE-0169改进的private访问权限
/*:
 * ## 在Swift 3中，SE-0025对访问权限进行了改进，其中:
 * fileprivate：用于定义只能在当前文件中访问的符号；
 * private：用于定义只能在当前作用域以及子作用域中访问的符号
 */


/*: swift4
 * ## 严格意义上说，我们期望的private访问权限要同时满足两个限制：
  * 只在一个类型的“定义范围”中使用，这个范围同时包含了定义本身，以及类型的extension；
 *  所有的extension必须和类型定义在同一个文件中，以防止外部代码也可以直接访问private属性；
 */

class Robot {
    private var battery: Double = 0.5
}
extension Robot {
    
    func charge() {
        
        battery = 1.0 // This will fail in Swift 3
    }
}

let r = Robot()
//r.battery = 1.0 // This will fail in Swift 4

