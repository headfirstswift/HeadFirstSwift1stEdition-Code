//: Playground - noun: a place where people can play



func timesTable (base n: Int, size: Int = 12)
{
    print ("called first definition")
}


func timesTable (base n: Int, dummy: Int = 10, size: Int = 12)
{
    print ("called second definition")
}


timesTable(base: 5, size: 12)