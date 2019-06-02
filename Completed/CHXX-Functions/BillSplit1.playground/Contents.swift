//: Playground - noun: a place where people can play



func billSplit(_ bill: Double, diners: Int, tip: Double)
{
    let total = bill * (1 + (tip/100))
    let split = total / Double(diners)
    
    print ("Each diner pays: $\(split) (\(tip)% tip)")
    
}

billSplit(56, diners: 1, tip: 15)
billSplit(100, diners: 2, tip: 15)
billSplit(120, diners: 3, tip: 18)
billSplit(100, diners: 1, tip: 100)

