import 'package:flutter/material.dart';
import 'package:news_test_project/components/constants.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text(AppConstants.notFoundPage)),
    );
  }
}
