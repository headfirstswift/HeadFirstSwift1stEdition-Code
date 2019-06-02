//: Playground - noun: a place where people can play



func clamp(_ value: Int, min: Int, max: Int) -> Int
{
    if value < min { return min }
    if value > max { return max }
    return value
}


func clamp1(_ val: Int, min lower: Int, max upper: Int) -> Int
{
    return min(max(lower, val), upper)
}


func clamp2(_ val: Int, min: Int, max: Int) -> Int
{
    return Swift.min(Swift.max(min, val), max)
}


clamp (3, min: 5, max: 15)
clamp (7, min: 5, max: 15)
clamp (17, min: 5, max: 15)

clamp1 (3, min: 5, max: 15)
clamp1 (7, min: 5, max: 15)
clamp1 (17, min: 5, max: 15)

clamp2 (-3, min: 5, max: 15)
clamp2 (7, min: 5, max: 15)
clamp2 (17, min: 5, max: 15)
