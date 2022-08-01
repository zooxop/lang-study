import Swift

var shoppingList = ["Eggs", "Milk"]

shoppingList.append("Apple")

shoppingList.append(contentsOf: ["Potato", "Melon"])

shoppingList += ["Pork", "Chicken"]

shoppingList.insert("Beer", at: 1)

var test = shoppingList.remove(at: 0)
print(test)
print(shoppingList.removeLast())
print(shoppingList.removeFirst())

shoppingList

print(shoppingList.removeAll())


shoppingList = ["Eggs", "Milk"]

var count = shoppingList.count

print(shoppingList.isEmpty)


for item in shoppingList {
    print(item)
}

for (index, item) in shoppingList.enumerated() {
    print(index, item)
}


var names2: Set = ["lee", "kim", "min"]

names2.isEmpty

var letters = Set<Character>()
letters.insert("a")
letters = []


shoppingList = ["Eggs", "Milk", "Milk", "Milk", "Milk"]
var shoppingSet = Set(shoppingList)
if let removed = shoppingSet.remove("Eggs"){
    print(removed)
} else {
    print("??")
}

shoppingSet.remove("Eggs")



var namesOfIntegers = [Int: String]()

namesOfIntegers[16] = "sixteen"
print(namesOfIntegers)

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
var sample1 = ["a":1, "b":2, "c":3]
airports["ICN"] = "Incheon"

print(airports)
print(sample1)

print(airports["YYZ", default: ""])
print(airports["YYZ"])

print(airports.keys)
print(airports.values)

for dict in airports {
    print(dict.key, dict.value)
}
