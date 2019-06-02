#!/usr/bin/env swift

import Foundation

func listFile(path: String)
{
    let file = fopen(path, "r")
    guard file != nil else { return }
    defer { fclose(file) }

    var buffer: UnsafeMutablePointer<CChar>? = nil
    var capacity: Int = 0
    
    while getline(&buffer, &capacity, file) > 0 {
		let line = String(cString: buffer!)
        print (line, terminator: "")
	}
}

listFile(path: "/etc/passwd")

