var m1: (() -> ())! = nil
var m2: (() -> ())! = nil

func makerW(_ a: Int) {
    var localVar = a
    m1 = {
        localVar += 1
        print("m1: \(localVar)")
    }
    m2 = {
        localVar += 5
        print("m2: \(localVar)")
    }
    
    m1()
    print("--: \(localVar)")
    m2()
    print("--: \(localVar)")
}

makerW(10)
m1()
m2()
m1()
