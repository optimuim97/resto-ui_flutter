import 'package:flutter/cupertino.dart';

class RatingStars extends StatelessWidget {
  final int rating;

  RatingStars(this.rating);

  @override
  Widget build(BuildContext context) {
    String star = '';
    for (int i = 0; i < rating; i++) {
      star += '🌟 ';
    }

    return Text(star);
  }
}
