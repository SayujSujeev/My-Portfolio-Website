
import 'package:flutter/material.dart';

scrollToSection(BuildContext context) {
  Scrollable.ensureVisible(
    context,
    duration: Duration(milliseconds: 600),
  );
}

