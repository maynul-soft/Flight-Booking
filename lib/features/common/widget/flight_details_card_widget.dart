import 'package:flight_booking/core/theme/text_theme.dart';
import 'package:flight_booking/core/utils/tool/gap.dart';
import 'package:flutter/material.dart';

class FlightDetailsCardWidget extends StatelessWidget {
  const FlightDetailsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        color: colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  Transform.rotate(
                    angle: 20,
                    child: Icon(Icons.airplanemode_active, size: 50),
                  ),
                  Gap.width(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Original',
                        style: CustomTextTheme.fontSize16bold(
                          context,
                        ).copyWith(color: colorScheme.tertiary),
                      ),
                      Row(
                        children: [
                          Text(
                            '\$1599.00 ',
                            style: CustomTextTheme.fontSize16bold(
                              context,
                            ).copyWith(color: colorScheme.primary),
                          ),

                          Text(
                            '/pax',
                            style: CustomTextTheme.fontSize12regular(
                              context,
                            ).copyWith(color: colorScheme.tertiary),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Gap.height(10),
              Divider(thickness: 1, color: Colors.grey),
              Gap.height(15),
              detailsRow(
                icon: Icons.shopping_bag_outlined,
                title: 'Cabin Baggage 1x7kg',
              ),
              Gap.height(15),
              detailsRow(icon: Icons.luggage, title: 'Baggage 1x20kg'),
              Gap.height(15),
              detailsRow(
                icon: Icons.calendar_month,
                title: 'Rescheduled Available',
              ),
              Gap.height(15),
              detailsRow(
                icon: Icons.monetization_on_outlined,
                title: 'Refundable',
              ),
              Gap.height(15),
              detailsRow(
                icon: Icons.monetization_on_outlined,
                title: 'Travel Insurance Included',
              ),
              Gap.height(15),
              Divider(thickness: 1, color: Colors.grey),
              Gap.height(15),
              Row(
                children: [
                  Icon(Icons.coffee),
                  Gap.width(10),
                  Icon(Icons.tv_outlined),
                  Gap.width(10),
                  Icon(Icons.wifi_outlined),
                  Gap.width(10),
                  Icon(Icons.power),
                  Gap.width(10),
                  Spacer(),
                  Text(
                    'Details',
                    style: CustomTextTheme.fontSize14regular(
                      context,
                    ).copyWith(color: colorScheme.primary),
                  ),
                  Gap.width(10),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: colorScheme.primary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget detailsRow({required IconData icon, required String title}) {
    return Row(children: [Icon(icon), Gap.width(5), Text(title)]);
  }
}
