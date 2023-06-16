import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/presentaion/manager/featured_books_cuibt/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentaion/views/widgets/featured_books_list_view_loading_indecator.dart';
import 'package:bookly_app/Features/home/presentaion/views/widgets/fetured_list_view.dart';
import 'package:bookly_app/core/utils/funnctions/build_error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewConsumerBuilder extends StatefulWidget {
  const FeaturedBooksListViewConsumerBuilder({
    super.key,
  });

  @override
  State<FeaturedBooksListViewConsumerBuilder> createState() =>
      _FeaturedBooksListViewConsumerBuilderState();
}

class _FeaturedBooksListViewConsumerBuilderState
    extends State<FeaturedBooksListViewConsumerBuilder> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        } else if (state is FeaturedBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorSnackBar(state.errorMessage),
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return FeaturedBooksListView(
            books: books,
          );
        } else if (state is FeaturedBooksFailure) {
          return Text(state.errorMessage);
        } else {
          return const FeaturedBooksListViewLoadingIndicator();
        }
      },
    );
  }

}
