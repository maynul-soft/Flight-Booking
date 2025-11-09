import 'package:flight_booking/core/asstes_path/image_paths.dart';
import 'package:flight_booking/core/theme/text_theme.dart';
import 'package:flight_booking/core/utils/tool/gap.dart';
import 'package:flight_booking/features/common/widget/flight_card_widget.dart';
import 'package:flight_booking/features/common/widget/flight_details_card_widget.dart';
import 'package:flight_booking/features/home/view/confirm_payment_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlightDetails extends StatefulWidget {
  const FlightDetails({super.key});
  static const String name = 'flight details';

  @override
  State<FlightDetails> createState() => _FlightDetailsState();
}

class _FlightDetailsState extends State<FlightDetails> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    bool isLight = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        flexibleSpace: FlexibleSpaceBar(
          background: Image.asset(
            isLight ? ImagePaths.lightbBgJpeg : ImagePaths.darkBgJpeg,
            fit: BoxFit.cover,
          ),
        ),
        backgroundColor: colorScheme.secondary,
        toolbarHeight: 60,
        title: Text('Flight Details', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.bookmark, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share, color: Colors.white),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap.height(20),
            FlightCardWidget(),
            Gap.height(10),
            FlightDetailsCardWidget(),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 90.h,
        child: Card(
          color: colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TotalPrice: 1 person',
                      style: CustomTextTheme.fontSize12regular(context),
                    ),
                    Text(
                      '\$1599.00',
                      style: CustomTextTheme.fontSize16bold(
                        context,
                      ).copyWith(color: colorScheme.primary),
                    ),
                  ],
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ConfirmPaymentView.name);
                  },
                  child: Text('Confirmed'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
