import 'package:flight_booking/core/theme/text_theme.dart';
import 'package:flight_booking/core/utils/tool/gap.dart';
import 'package:flight_booking/features/common/widget/custom_flight_indicator.dart';
import 'package:flight_booking/features/common/widget/flight_card_details_widget.dart';
import 'package:flutter/material.dart';

class FlightCardWidget extends StatelessWidget {
  const FlightCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Card(
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      elevation: 3,
      color: colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(radius: 15, backgroundColor: Colors.red),
                Gap.width(10),
                Text(
                  'Emerits',
                  style: CustomTextTheme.fontSize16semiBold(
                    context,
                  ).copyWith(color: colorScheme.onTertiary),
                ),
                Spacer(),
                Text(
                  '\$1599.00',
                  style: CustomTextTheme.fontSize16semiBold(
                    context,
                  ).copyWith(color: colorScheme.primary),
                ),
                Text(
                  '/pax',
                  style: CustomTextTheme.fontSize14regular(
                    context,
                  ).copyWith(color: Colors.grey),
                ),
              ],
            ),
            Gap.height(10),
            Divider(thickness: 1, color: Colors.grey),
            Gap.height(10),
            FlightCardDetailsWidget(),
          ],
        ),
      ),
    );
  }
}
