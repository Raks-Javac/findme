import 'package:flutter/material.dart';

class PS {
  BuildContext? context;
  PS(this.context);

  double get screenWidth {
    return MediaQuery.of(context!).size.width;
  }

  double get screenHeight {
    return MediaQuery.of(context!).size.height;
  }
}
