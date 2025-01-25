import _Concurrency

//MARK: - 12.2
/*
 var globalCount = 0 // ()->Int という型を持つクロージャのインスタンスを作って返す関数
 
 func maker(_ a:Int, _ b:Int) -> () -> Int {
 var localCount = a
 return { () -> Int in       // クロージャ式。型宣言は省略可能。
 globalCount += 1        // globalCountは参照されるだけ
 localCount += b           // localvar, b がキャプチャされる
 return localCount
 }
 }
 
 var m1 = maker(10, 1)
 print("maker関数を呼び出し、変数m1にクロージャを格納しました。")
 print("1回目のm1を実行しました。localCountは\(m1()), globalCountは\(globalCount)です")
 print("2回目のm1を実行しました。localCountは\(m1()), globalCountは\(globalCount)です")
 globalCount = 1000
 print("globalCountの値を\(globalCount)に更新しました。")
 print("3回目のm1を実行しました。localCountは\(m1()), globalCountは\(globalCount)です")
 
 var m2 = maker(50, 2)
 print("maker関数を呼び出し、変数m2にクロージャを格納しました。")
 print("1回目のm2を実行しました。localCountは\(m2()), globalCountは\(globalCount)です")
 print("4回目のm1を実行しました。localCountは\(m1()), globalCountは\(globalCount)です")
 print("2回目のm2を実行しました。localCountは\(m2()), globalCountは\(globalCount)です")
 */

//MARK: - 12.3
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
