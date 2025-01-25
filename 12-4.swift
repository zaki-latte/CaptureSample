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
