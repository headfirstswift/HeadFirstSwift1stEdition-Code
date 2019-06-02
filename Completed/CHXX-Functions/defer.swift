#!/usr/bin/env swift

import Foundation

func deferDemo(_ str: String)
{
    defer { print ("deferred first, so should print last!") }
    print (str)
    defer { print ("deferred last, so should print first...") }
}

deferDemo("Hello, World!")

