import 'package:bookly_app/Features/home/presentaion/manager/featured_books_cuibt/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentaion/views/widgets/fetured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocBuilder extends StatelessWidget {
  const FeaturedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return const FeaturedBooksListView();
        }else if(state is FeaturedBooksFailure){
          return Text(state.errorMessage);
        }else{
          return const CircularProgressIndicator();
        }
      },
    );
  }
}