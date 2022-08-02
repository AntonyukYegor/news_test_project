import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:news_test_project/components/constants.dart';

void showErrorDialog({required BuildContext context, required String error}) {
  SchedulerBinding.instance.addPostFrameCallback((_) => showDialog(
        context: context,
        builder: (_) => ErrorDialog(error: error),
      ));
}

class ErrorDialog extends StatelessWidget {
  final String error;

  const ErrorDialog({required this.error, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(36),
          decoration: const BoxDecoration(
            color: AppConstants.errorDialogColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  CloseButton(color: Colors.white),
                ],
              ),
              const Icon(Icons.error, color: Colors.white),
              const SizedBox(height: 12),
              Text(
                '${AppConstants.error} $error',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
