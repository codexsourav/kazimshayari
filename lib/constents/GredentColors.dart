import 'package:flutter/material.dart';
import 'dart:math';

Gradient gcolor1 = const LinearGradient(
  colors: [
    Color.fromARGB(255, 54, 130, 244),
    Color.fromARGB(255, 208, 33, 243),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.0, 1.0],
  tileMode: TileMode.repeated,
);
Gradient gcolor2 = const LinearGradient(
  colors: [
    Color.fromARGB(255, 24, 138, 113),
    Color.fromARGB(255, 141, 80, 10),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.0, 1.0],
  tileMode: TileMode.repeated,
);

Gradient gcolor3 = const LinearGradient(
  colors: [
    Color.fromARGB(255, 138, 24, 90),
    Color.fromARGB(255, 10, 41, 141),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.0, 1.0],
  tileMode: TileMode.clamp,
);
Gradient gcolor4 = const LinearGradient(
  colors: [
    Color.fromARGB(255, 55, 119, 39),
    Color.fromARGB(255, 10, 93, 141),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.0, 1.0],
  tileMode: TileMode.clamp,
);

Gradient gcolor5 = const LinearGradient(
  colors: [
    Color.fromARGB(255, 167, 17, 104),
    Color.fromARGB(255, 141, 89, 10),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.0, 1.0],
  tileMode: TileMode.clamp,
);

Gradient gcolor6 = const LinearGradient(
  colors: [
    Color.fromARGB(255, 0, 136, 141),
    Color.fromARGB(255, 173, 5, 5),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.0, 1.0],
  tileMode: TileMode.clamp,
);
Gradient gcolor7 = const LinearGradient(
  colors: [
    Color.fromARGB(255, 194, 0, 0),
    Color.fromARGB(255, 173, 134, 5),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.0, 1.0],
  tileMode: TileMode.clamp,
);

List gcolors = [gcolor1, gcolor2, gcolor3, gcolor4, gcolor5, gcolor6, gcolor7];

int random(int min, int max) {
  return min + Random().nextInt(max - min);
}

Gradient getGcolor() {
  return gcolors[random(0, 6)];
}
