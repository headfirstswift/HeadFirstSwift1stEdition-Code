//: Playground - noun: a place where people can play



func timesTable (base n: Int, size: Int = 12)
{
    for i in 1 ... size {
        print (i * n, terminator: ", ")
    }
    print ()
}

timesTable(base: 5)

timesTable(base: 2, size: 6)
