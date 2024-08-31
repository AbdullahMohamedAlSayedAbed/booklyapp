import 'package:booklyapp/Features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/Features/home/presentation/view/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.books});

  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: books.length,
      itemBuilder: (context, index) {
        return BestSellerListViewItem(
          bookModel: books[index],
          horizontal: 0,
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 20,
      ),
    );
  }
}
