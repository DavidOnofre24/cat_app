import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarsDescription extends StatelessWidget {
  final String label;
  final int stars;
  final bool isBold;

  const StarsDescription({
    super.key,
    required this.label,
    required this.stars,
    this.isBold = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize: 14, fontWeight: (isBold) ? FontWeight.bold : null),
          ),
          RatingBar.builder(
            unratedColor: const Color(0xffd8d8d8),
            direction: Axis.horizontal,
            itemSize: 22,
            ignoreGestures: true,
            itemCount: 5,
            initialRating: stars.toDouble(),
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (_) {},
          ),
        ],
      ),
    );
  }
}
