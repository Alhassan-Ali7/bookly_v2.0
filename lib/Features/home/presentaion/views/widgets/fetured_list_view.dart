import 'package:bookly_app/Features/home/presentaion/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2762,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(left: 15,),
              child: CustomBookImage(),
            );
          },
        ),
      ),
    );
  }
}
