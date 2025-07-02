import 'package:flutter/material.dart';

enum FilterItems {
  all,
  politics,
  sports,
  education,
  games,
}

extension FilterItemExtension on FilterItems {
  Color backgroundColor() {
    switch (this) {
      case FilterItems.all:
        return Colors.black;
      case FilterItems.politics:
        return Colors.red;
      case FilterItems.sports:
        return Colors.blue;
      case FilterItems.education:
        return Colors.green;
      case FilterItems.games:
        return Colors.pink;
    }
  }
}
