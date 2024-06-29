import 'package:booklyapp/Features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/Features/home/data/repos/home_repo_implemtion.dart';
import 'package:booklyapp/Features/home/presentation/view/book_detailes_view.dart';
import 'package:booklyapp/Features/home/presentation/view/home_view.dart';
import 'package:booklyapp/Features/home/presentation/view_model/similar_books_cubit.dart/similar_books_cubit.dart';
import 'package:booklyapp/Features/search/presentation/view/search_view.dart';
import 'package:booklyapp/Features/splash/presentation/view/splash_view.dart';
import 'package:booklyapp/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const homeView = '/homeView';
  static const bookDetailsView = '/bookDetailsView';
  static const search = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: bookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child:  BookDetailsView(bookModel: state.extra as BookModel,),
        ),
      ),
      GoRoute(
        path: search,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
