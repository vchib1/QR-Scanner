import 'package:flutter/material.dart';

RoundedRectangleBorder topRoundedBorder() => const RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(16.0),
    topRight: Radius.circular(12.0),
  ),
);

RoundedRectangleBorder bottomRoundedBorder() => const RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(12.0),
    bottomRight: Radius.circular(12.0),
  ),
);

RoundedRectangleBorder roundedBorder() =>
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0));

RoundedRectangleBorder noneBorder() => const RoundedRectangleBorder();
