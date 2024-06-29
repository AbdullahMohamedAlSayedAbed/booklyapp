import 'package:booklyapp/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key,
      this.mainAxisAlignment,
      required this.rating,
      required this.count});
  final MainAxisAlignment? mainAxisAlignment;
  final double rating;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        const Icon(
          Icons.star,
          color: Color(0xffFFDD4F),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Text(
            '$rating',
            style: Styles.testStyle16,
          ),
        ),
        Opacity(
          opacity: .5,
          child: Text(
            '($count)',
            style: Styles.testStyle14.copyWith(color: const Color(0xffD8D8D8)),
          ),
        ),
      ],
    );
  }
}
