import UIKit


// map
let names = ["kim", "lee", "min", "john"]

let names1 = names.map { (name) in
    return name + "님"
}

let names2 = names.map { $0 + "님" }

let names3 = names.map { $0.count }

names1
names2
names3


// filter
let filterNames = names.filter { (name) -> Bool in
    name.count > 3
}
let filterNames2 = names.filter { $0.count > 3 }
filterNames2


// reduce
let reduceNames = names.reduce("text: ") { (first, second) -> String in
    first + second
}


let numberArr = [1, 2, 3, 4, 5]
let sumNum = numberArr.reduce(0) { $0 + $1 }
sumNum


// compactMap
let numberArr2 = [1, 2, 3, 4, 5, nil, 7, nil, 9]
let compactMapNum = numberArr2.compactMap { (num) in
    return num
}
compactMapNum

// flatmap
let numbers2 = [[1,2,3], [4,5,6]]
let flatNum = numbers2.flatMap { ($0) }
flatNum


let numbers3 = [[[1, 2, 3], [4, 5, 6]], [[7, 8, 9], [10, 11, 12]]]
let flatNum3 = numbers3.flatMap { ($0) }
flatNum3
