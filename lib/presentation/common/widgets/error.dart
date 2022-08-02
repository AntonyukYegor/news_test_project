import 'package:flutter/material.dart';
import 'package:news_test_project/components/constants.dart';

class Error extends StatelessWidget {
  const Error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text(AppConstants.error));
  }
}
