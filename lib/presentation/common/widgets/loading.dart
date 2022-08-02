import 'package:flutter/material.dart';
import 'package:news_test_project/components/constants.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text(AppConstants.loading));
  }
}
