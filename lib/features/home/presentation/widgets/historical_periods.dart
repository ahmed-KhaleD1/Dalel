import 'package:dalel/core/functions/custom_snackbar.dart';
import 'package:dalel/core/widgets/list_views/custom_horizontal_card_list_view.dart';
import 'package:dalel/core/widgets/shimmers/horizontal_card_list_view_shimmer.dart';
import 'package:dalel/features/home/presentation/view_model/home_cubit.dart';
import 'package:dalel/features/home/presentation/view_model/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetHistoricalPeriodsFailureState) {
          customSnackBar(context,
              message: state.errorMessage, backgroundColor: Colors.red);
        }
      },
      builder: (context, state) {
        return state is GetHistoricalPeriodsLoadingState
            ? const HorizontalCardListVieweShimmer()
            : CustomHorizontalCardListView(
                items: context.read<HomeCubit>().historicalPeriodsList);
      },
    );
  }
}
