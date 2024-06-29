import 'package:booklyapp/Features/home/presentation/view/widgets/best_seller_list_view.dart';
import 'package:booklyapp/Features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:booklyapp/Features/home/presentation/view/widgets/featured_books_list_view.dart';
import 'package:booklyapp/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              FeaturedBooksListView(),
              SizedBox(
                height: 49,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, bottom: 20),
                child: Text(
                  "Best Seller",
                  style: Styles.testStyle18,
                ),
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: BestSellerListView(),
        ),
      ],
    );
  }
}
