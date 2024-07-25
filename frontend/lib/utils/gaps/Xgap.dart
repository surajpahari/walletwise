import 'package:flutter/material.dart';

SizedBox gapY(String size) {
  switch (size) {
    case 'md':
      return const SizedBox(height: 20);
    case 'sm':
      return const SizedBox(height: 10);
    case 'lg':
      return const SizedBox(height: 30);

    default:
      return const SizedBox
          .shrink(); // Return an empty SizedBox for unrecognized sizes
  }
}
