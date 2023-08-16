import Foundation


var value: [UInt8] = [13, 1, 1, 114, 101, 103, 105, 115, 116, 32, 111, 107]

// 맨 앞의 2바이트를 Int16로 변환
let int16Bytes = value.prefix(2)
let int16Value = Int16(int16Bytes[0]) << 8 | Int16(int16Bytes[1])

// 나머지 바이트를 문자열로 변환
let stringBytes = value.dropFirst(2)
let stringValue = String(bytes: stringBytes, encoding: .utf8)

print("Int16 Value: \(int16Value)")
if let stringValue = stringValue {
    print("String Value: \(stringValue)")
} else {
    print("Error converting bytes to string.")
}

