//: Playground - noun: a place where people can play


func swap(_ a: inout Int, _ b: inout Int)
{
    let temp = a
    a = b
    b = temp
}

var a = 5
var b = 9

swap(&a, &b)

a
b


func clamp(_ value: inout Int, min: Int, max: Int)
{
    if value < min { value = min }
    else if value > max { value = max }
}

var v = 16
clamp (&v, min: 5, max: 15)
v
