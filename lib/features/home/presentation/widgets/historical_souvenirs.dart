import 'package:dalel/core/functions/custom_snackbar.dart';
import 'package:dalel/core/widgets/list_views/custom_vertical_card_list_view.dart';
import 'package:dalel/core/widgets/shimmers/vertical_card_list_view_shimmer.dart';
import 'package:dalel/features/home/presentation/view_model/home_cubit.dart';
import 'package:dalel/features/home/presentation/view_model/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoricalSouvenirs extends StatelessWidget {
  const HistoricalSouvenirs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeFailureState) {
          customSnackBar(context,
              message: state.errorMessage, backgroundColor: Colors.red);
        }
      },
      builder: (context, state) {
        return state is HomeLoadingState
            ? const VerticalCardListViewShimmer()
            : CustomVerticalCardListView(
                items: context.read<HomeCubit>().historicalSouvenirList);
      },
    );
  }
}
