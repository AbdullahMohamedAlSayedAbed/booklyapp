import 'package:booklyapp/Features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:booklyapp/Features/home/presentation/view_model/similar_books_cubit.dart/similar_books_cubit.dart';
import 'package:booklyapp/core/widgets/custom_error_widget.dart';
import 'package:booklyapp/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * .15,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.bookModel.length,
              itemBuilder: (context, index) {
                return  CustomBookImage(
                  imageUrl:state.bookModel[index].volumeInfo?.imageLinks?.thumbnail??'',
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 10),
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
