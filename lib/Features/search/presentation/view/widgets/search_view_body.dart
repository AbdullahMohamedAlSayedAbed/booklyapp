import 'package:booklyapp/Features/search/presentation/view/widgets/custom_search_text_field.dart';
import 'package:booklyapp/Features/search/presentation/view/widgets/search_result_list_view.dart';
import 'package:booklyapp/Features/search/presentation/view_models/search_cubit/search_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_loading_indicator.dart';
import 'search_result_list_view_bloc_builder.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          CustomSearchTextField(
            onSubmitted: (value) {
              BlocProvider.of<SearchBookCubit>(context).fetchSearchBooks(
                searchBook: value,
              );
            },
            onChanged: (value) {
              BlocProvider.of<SearchBookCubit>(context).fetchSearchBooks(
                searchBook: value,
              );
            },
          ),
          const SizedBox(height: 15),
          const Expanded(child: SearchResultListViewBlocBuilder()),
        ],
      ),
    );
  }
}
