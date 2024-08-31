import 'package:booklyapp/Features/search/presentation/view/widgets/search_result_list_view.dart';
import 'package:booklyapp/Features/search/presentation/view_models/search_cubit/search_book_cubit.dart';
import 'package:booklyapp/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListViewBlocBuilder extends StatelessWidget {
  const SearchResultListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBookCubit, SearchBookState>(
      builder: (context, state) {
        if (state is SearchBookSuccess) {
          return SearchResultListView(
            books: state.books,
          );
        } else if (state is SearchBookFailure) {
          print(state.errMessage);
          return const SizedBox();
        } else if (state is SearchBookFailure) {
          return const Center(child: CustomLoadingIndicator());
        }
        return SizedBox();
      },
    );
  }
}
