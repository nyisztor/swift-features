import Foundation

@propertyWrapper
struct Box {
    private var value = 0
    
    var wrappedValue: Int {
        get { value > 50 ? value : 50 }
        set { value = newValue }
    }
}

struct Foo {
    @Box var x: Int
}


var t = Foo()
print(t.x)
// Prints: 50

t.x = 100
print(t.x)
// Prints: 100

@propertyWrapper
struct Base64Encoded {
    private var value = ""
    var wrappedValue: String {
        get { Data(value.utf8).base64EncodedString() }
        set { value = newValue }
    }
}

struct Payload {
    @Base64Encoded var text: String
}

var p = Payload()
p.text = "Property wrappers are awesome!"
print(p.text)
