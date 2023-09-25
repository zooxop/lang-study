//
//  Model.swift
//  OnBoardingExample
//
//  Created by 문철현 on 2023/09/25.
//

import SwiftUI

struct Fruit: Identifiable {
  var id = UUID()
  var title: String
  var headline: String
  var image: String
  var gradientColors: [Color]
}

let fruitsData: [Fruit] = [
  Fruit(
    title: "Blueberry",
    headline: "Blueberries are sweet, nutritious and wildly popular fruit all over the world.",
    image: "blueberry",
    gradientColors: [Color("ColorBlueberryLight"), Color("ColorBlueberryDark")]
  ),
  Fruit(
    title: "Strawberry",
    headline: "Widely appreciated for its characteristic aroma,  red color, juicy texture, and sweetness.",
    image: "strawberry",
    gradientColors: [Color("ColorStrawberryLight"), Color("ColorStrawberryDark")]
  ),
  Fruit(
    title: "Lemon",
    headline: "There's no doubt lemons are delicious, but does adding them to water make you healthier?",
    image: "lemon",
    gradientColors: [Color("ColorLemonLight"), Color("ColorLemonDark")]
  )
]
