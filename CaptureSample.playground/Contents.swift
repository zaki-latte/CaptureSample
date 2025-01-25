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
/*
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
 */

//MARK: - 12.4
/*
class MyInt{
    var value = 0
    init(_ v: Int) {
        value = v
    }
    deinit {
        print("deinit: \(value)")
    }
}

func makerZ(_ a: MyInt, _ s: String) -> (() -> ()){
    let localVar = a
    return {
        localVar.value += 1
        print("\(s): \(localVar.value)")
    }
}


var obj1: MyInt! = MyInt(10) //１つ目のMyIntクラスのインスタンスを作成
var m1: (()->())! = makerZ(obj1, "m1") //obj1を使って1つ目のクロージャを作成し、変数m1に格納
m1()

var m2: (()->())! = makerZ(obj1, "m2") //obj1を使って2つ目のクロージャを作成し、変数m2に格納
obj1 = nil
print("変数obj1はすでにnilですが、obj1に格納していたMyIntインスタンスはまだ解放されていません。他から強参照を受けていると考えられます。")

m2()
m1()
m1 = nil
print("変数m1はすでにnilですが、obj1に格納していたMyIntインスタンスはまだ解放されていません。他から強参照を受けていると考えられます。")

m2()
m2 = nil
print("変数m2をnilにしました。obj1に格納していたMyIntインスタンスに対する強参照がなくなったため、メモリが解放されました。")
*/
