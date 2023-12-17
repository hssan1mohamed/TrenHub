
import 'dart:math';

import 'package:flutter/material.dart';

List<Color> colorCate=[
  Color(0xFF3498db),
  Color(0xFF2ecc71),
];

Color getRandomColor() {
  // Create a random number generator
  Random random = Random();

  // Generate a random index within the length of the colors list
  int randomIndex = random.nextInt(colorCate.length);

  // Retrieve the color at the randomly generated index
  Color randomColor = colorCate[randomIndex];

  return randomColor;
}