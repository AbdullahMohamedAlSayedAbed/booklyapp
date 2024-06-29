import 'package:booklyapp/Features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/Features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:booklyapp/Features/home/presentation/view/widgets/custom_book_rating.dart';
import 'package:booklyapp/Features/home/presentation/view_model/similar_books_cubit.dart/similar_books_cubit.dart';
import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/core/widgets/custom_error_widget.dart';
import 'package:booklyapp/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return Column(
            children: [
              const SizedBox(
                height: 34,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .17),
                child: CustomBookImage(
                    imageUrl:
                        bookModel.volumeInfo?.imageLinks?.thumbnail ?? ''),
              ),
              const SizedBox(height: 40),
              Text(
                bookModel.volumeInfo?.title ?? '',
                style: Styles.testStyle30,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              Opacity(
                opacity: .7,
                child: Text(
                  bookModel.volumeInfo?.authors?[0] ?? '',
                  style: Styles.testStyle18.copyWith(
                      fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 18),
              BookRating(
                count: bookModel.volumeInfo?.pageCount ?? 0,
                rating: 0.0,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              const SizedBox(height: 37),
            ],
          );
        } else if (state is SimilarBooksFailure) {
        return  CustomErrorWidget(errMessage: state.errMessage);
        }
        return const CustomLoadingIndicator();
      },
    );
  }
}
