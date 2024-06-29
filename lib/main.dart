import 'package:booklyapp/Features/home/data/repos/home_repo_implemtion.dart';
import 'package:booklyapp/Features/home/presentation/view_model/feature_book_cubit/featured_books_cubit.dart';
import 'package:booklyapp/Features/home/presentation/view_model/newest_books_cubit/newset_books_cubit.dart';
import 'package:booklyapp/core/constants/constant.dart';
import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServiceLocator();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(getIt.get<HomeRepoImpl>())
            ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt.get<HomeRepoImpl>())..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            colorScheme:
                const ColorScheme.dark().copyWith(primary: Colors.white),
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
            scaffoldBackgroundColor: const Color(kPrimaryColor)),
      ),
    );
  }
}
