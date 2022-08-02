import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_test_project/presentation/features/sorting/bloc/sorting_bloc.dart';
import 'package:news_test_project/presentation/features/sorting/bloc/sorting_event.dart';
import 'package:news_test_project/presentation/features/sorting/bloc/sorting_state.dart';

class SortDirectionSwitcher extends StatelessWidget {
  const SortDirectionSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: BlocBuilder<SortingBloc, SortingState>(
        buildWhen: (oldState, newState) =>
            oldState.isDescSorting != newState.isDescSorting,
        builder: (context, state) {
          return AnimatedCrossFade(
            duration: const Duration(milliseconds: 500),
            firstChild: const Icon(Icons.filter_list),
            secondChild: const RotatedBox(
                quarterTurns: 2, child: Icon(Icons.filter_list)),
            crossFadeState: state.isDescSorting == true
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
          );
        },
      ),
      onPressed: () {
        context.read<SortingBloc>().add(ChangeSortDirectionEvent());
      },
    );
  }
}
