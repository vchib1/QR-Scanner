import 'package:flutter/material.dart';

RoundedRectangleBorder topRoundedBorder() => RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(8.0),
    topRight: Radius.circular(8.0),
  ),
);

RoundedRectangleBorder bottomRoundedBorder() => RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(8.0),
    bottomRight: Radius.circular(8.0),
  ),
);

RoundedRectangleBorder roundedBorder() =>
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0));

RoundedRectangleBorder noneBorder() => RoundedRectangleBorder();
