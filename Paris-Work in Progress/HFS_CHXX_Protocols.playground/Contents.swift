// Head First Swift (1st Edition)
// Code Sample Playground
// CHAPTER: Protocols
// COMMENTS: This chapter covers Protocols.

// ########## BOOK COMMENTS ##########
/* We mentioned earlier that there are a few named types in Swift.
 This is one of them! Protocols!
 
 Protocols don't really define anything that you can use, create (instantiate) directly, but let you create a blueprint that can be adhered (conformed) to.
 
 Basically, protocols lets you create a custom, common set of properties and methods that you can go and implement in later-created types.
 */
// ########## BOOK COMMENTS ##########

// Let's define a protocol!
protocol CargoPod {
    func loadCargo()
    func unloadCargo()
}

/* ########## BOOK COMMENTS ##########
 The keyword protocol is followed by its name, and then we open some curly braces and put the members of our new protocol inside.
 
 You'll note that there's no implementation here!
 ########## BOOK COMMENTS ########## */

// This won't work
// var myPod = CargoPod() // no accessible initialisers

/* ########## BOOK COMMENTS ##########
Protocols are used to enforce specific methods, properties and such, on other types that are created.
 ########## BOOK COMMENTS ########## */

// A protocol can be adopted by a class, struct, or enum:
class FuelPod: CargoPod {
    var fuelQuantity = 10
    
    func unloadCargo() {
        // perform fuel unload
    }
    
    func loadCargo() {
        // perform fuel lod
    }
}

// In this exmaple we conform our new class FuelPod to the CargoPod protocol.
// Comment out the implementation of loadCargo() above, and watch Swift throw an error!

