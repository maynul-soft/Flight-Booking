import 'package:flight_booking/core/theme/text_theme.dart';
import 'package:flight_booking/core/utils/tool/gap.dart';
import 'package:flight_booking/features/common/widget/custom_flight_indicator.dart';
import 'package:flutter/material.dart';

class FlightCardDetailsWidget extends StatelessWidget {
  const FlightCardDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildDetailCard(
          context,
          cityName: 'New York',
          time: '19:00',
          shortKey: 'JKF',
          align: CrossAxisAlignment.start,
          colorScheme: colorScheme,
        ),
        CustomFlightIndiCator(
          color: colorScheme.primary,
          child: Column(
            children: [Text('7h 30min'), Gap.height(10), Text('Direct')],
          ),
        ),
        buildDetailCard(
          context,
          cityName: 'Paris',
          time: '16:30',
          shortKey: 'CDG',
          align: CrossAxisAlignment.end,
          colorScheme: colorScheme,
        ),
      ],
    );
  }

  Widget buildDetailCard(
    context, {
    required String cityName,
    required String time,
    required String shortKey,
    required CrossAxisAlignment align,
    required ColorScheme colorScheme,
  }) {
    return Column(
      crossAxisAlignment: align,
      children: [
        Gap.height(10),
        Text(
          cityName,
          style: CustomTextTheme.fontSize14regular(
            context,
          ).copyWith(color: colorScheme.onTertiary),
        ),
        Gap.height(15),
        Text(
          time,
          style: CustomTextTheme.fontSize18semiBold(
            context,
          ).copyWith(color: colorScheme.onTertiary),
        ),
        Gap.height(15),
        Text(
          shortKey,
          style: CustomTextTheme.fontSize14regular(
            context,
          ).copyWith(color: colorScheme.onTertiary),
        ),
      ],
    );
  }
}
