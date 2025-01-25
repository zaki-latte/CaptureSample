class Friend {
    //MARK: Property
    let name: String
    
    //MARK: Initializer
    init(name: String) {
        self.name = name
    }
    
    //MARK: Deinitializer
    deinit {
        print("deinit",  name)
    }
    
    //MARK: Function
    func sayName() {
        print("私は\(name)です。")
    }
    func sayHello(to f: Friend) {
        print("こんにちは、\(f.name)さん。\(name)です。")
    }
}

let closure1: (String) -> Friend = Friend.init //Friendクラスのイニシャライザを、クロージャとして定数に格納
var closure2: (Friend) -> ()

do{
    let friend1 = closure1("烏丸")
    closure2 = friend1.sayHello(to:)
    friend1.sayName()
}//クロージャを利用してFriendクラスをインスタンス化

let friend2 = Friend(name: "久我山")
closure2(friend2)
closure2 = friend2.sayHello
