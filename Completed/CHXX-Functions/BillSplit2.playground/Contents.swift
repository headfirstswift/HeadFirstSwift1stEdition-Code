//: Playground - noun: a place where people can play



func billSplit(_ bill: Double, diners: Int = 1, tip: Double = 15.0)
{
    let total = bill * (1 + (tip/100))
    let split = total / Double(diners)
    
    print ("Each diner pays: $\(split) (\(tip)% tip)")
    
}

billSplit(56)
billSplit(100, diners: 2)
billSplit(120, diners: 3, tip: 18)
billSplit(100, tip: 100)
