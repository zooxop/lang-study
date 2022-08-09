import UIKit

struct ImageType {
    var name = ""
    func someFunc() {
        
    }
}

var imageType1 = ImageType()
var imageType2 = imageType1

imageType1.name = "jpg"
imageType2.name = "png"

print(imageType1.name)
print(imageType2.name)
