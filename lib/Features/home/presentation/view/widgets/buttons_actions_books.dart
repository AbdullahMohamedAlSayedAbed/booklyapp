import 'package:booklyapp/Features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/core/utils/functions/launch_url.dart';
import 'package:booklyapp/core/widgets/custom_button_book.dart';
import 'package:flutter/material.dart';

class ActionBook extends StatelessWidget {
  const ActionBook({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            text: getText(bookModel, '19.99€'),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
          ),
          CustomButton(
            onPressed: ()  {
              launchCustomUrl(context,bookModel.volumeInfo?.previewLink as String);
            },
            text: getText(bookModel),
            fontSize: 16,
            backgroundColor: const Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16)),
          ),
        ],
      ),
    );
  }

  String getText(BookModel bookModel, [String text = 'Free preview']) {
    if (bookModel.volumeInfo!.previewLink == null) {
      return 'Not available';
    }
    return text;
  }
}
