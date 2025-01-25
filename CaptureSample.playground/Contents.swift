import _Concurrency

var globalCount = 0 // ()->Int という型を持つクロージャのインスタンスを作って返す関数

func maker(_ a:Int, _ b:Int) -> () -> Int {
    var localvar = a
    return { () -> Int in       // クロージャ式。型宣言は省略可能。
        globalCount += 1        // globalCountは参照されるだけ
        localvar += b           // localvar, b がキャプチャされる
        return localvar }
}

