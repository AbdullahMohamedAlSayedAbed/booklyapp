import 'package:booklyapp/Features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/Features/home/presentation/view/widgets/custom_book_rating.dart';
import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/core/widgets/custom_loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem(
      {super.key, this.horizontal, required this.bookModel});
  final double? horizontal;
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.bookDetailsView,extra: bookModel);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontal ?? 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 125,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 2.5 / 4,
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ??
                        'http://books.google.com/books/content?id=lESCCXkdy3YC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
                    placeholder: (context, url) => const CustomLoadingIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookModel.volumeInfo?.title ?? 'no name',
                    style: Styles.testStyle20,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 3),
                  Opacity(
                      opacity: .7,
                      child: Text(
                        bookModel.volumeInfo?.authors?[0] ?? 'no author',
                        style: Styles.testStyle14,
                      )),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Free",
                        style: Styles.testStyle20
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                       BookRating(count: bookModel.volumeInfo?.pageCount?? 0,rating: 4,)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
