import Foundation

let a: Double = 13
let b: Double = 0.165

print("\(String(format: "%.0f", a)) * \(String(format: "%.6f", b)) = \(String(format: "%.6f", a * b))")


let c: Double = 25.352

print("\(String(format: "%.1f", c))")


let host = "i3-4-kr-20-1000.aioncloud.net"

let array = host.split(separator: "-")
print(array)
