import 'package:flight_booking/core/asstes_path/image_paths.dart';
import 'package:flight_booking/core/theme/text_theme.dart';
import 'package:flight_booking/core/utils/tool/gap.dart';
import 'package:flight_booking/features/common/widget/custom_flight_indicator.dart';
import 'package:flight_booking/features/common/widget/flight_card_widget.dart';
import 'package:flight_booking/features/home/controller/flight_list_controller.dart';
import 'package:flight_booking/features/home/view/flight_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:intl/intl.dart';

class FlightListView extends StatefulWidget {
  const FlightListView({super.key});

  static const String name = 'flight list';

  @override
  State<FlightListView> createState() => _FlightListViewState();
}

class _FlightListViewState extends State<FlightListView> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    bool isLight = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  isLight ? ImagePaths.lightbBgJpeg : ImagePaths.darkBgJpeg,
                ),
              ),
              color: colorScheme.secondary,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Gap.height(30),
                headerSection(colorScheme, context),
                Gap.height(40),
                flightDetailsSection(colorScheme),
                Gap.height(30),
                selectDateSection(),
                Gap.height(5),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.zero,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, FlightDetails.name);
                        },
                        child: FlightCardWidget(),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 30.h,

                  child: Material(
                    elevation: 15,
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.swap_calls, size: 30),
                          Gap.width(8),
                          Text(
                            'Sort',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Gap.width(15),
                          Container(height: 30, width: 3, color: Colors.grey),
                          Gap.width(15),
                          Icon(Icons.tune, size: 30),
                          Gap.width(8),
                          Text(
                            'Filter',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget selectDateSection() {
    return Row(
      children: [
        GestureDetector(
          onTap: showDateTimePicker,
          child: dateCard(
            child: Icon(Icons.calendar_month, color: Colors.white),
          ),
        ),
        Gap.width(8),
        Container(height: 40.h, width: 1.w, color: Colors.white),
        Gap.width(10),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: dateList(),
          ),
        ),
      ],
    );
  }

  Widget dateList() {
    int selectedIndex = 0;
    DateTime now = DateTime.now();
    List<DateTime> dateList = [];
    for (int i = 0; i <= 30; i++) {
      dateList.add(now.add(Duration(days: i)));
    }

    return GetBuilder<FlightListController>(
      builder: (controller) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: dateList.asMap().entries.map((item) {
            return GestureDetector(
              onTap: () {
                selectedIndex = item.key;
                controller.update();
              },
              child: dateCard(
                color: selectedIndex == item.key
                    ? Colors.grey.withOpacity(0.3)
                    : null,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${item.value.day}',
                      style: CustomTextTheme.fontSize16medium(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                    Text(
                      DateFormat('EEE').format(item.value),
                      style: CustomTextTheme.fontSize10semiBold(
                        context,
                      ).copyWith(height: 0.6, color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget dateCard({required Widget child, Color? color}) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 50.h,
      width: 50.w,

      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: Colors.white),
      ),
      child: child,
    );
  }

  Widget flightDetailsSection(ColorScheme colorScheme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildFromToName(
          colorScheme: colorScheme,
          title: 'JKF',
          subtitle: 'new Your',
          textAlign: CrossAxisAlignment.start,
        ),
        CustomFlightIndiCator(
          child: Text(
            '1 seat economy',
            style: CustomTextTheme.fontSize14regular(
              context,
            ).copyWith(color: Colors.white),
          ),
        ),
        buildFromToName(
          colorScheme: colorScheme,
          title: 'CDG',
          subtitle: 'Paris',
          textAlign: CrossAxisAlignment.end,
        ),
      ],
    );
  }

  Widget headerSection(ColorScheme colorScheme, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: colorScheme.tertiaryFixed),
        ),
        Text(
          'Search Flight',
          style: CustomTextTheme.fontSize16semiBold(
            context,
          ).copyWith(color: colorScheme.tertiaryFixed),
        ),
        Icon(Icons.more_vert, color: colorScheme.tertiaryFixed),
      ],
    );
  }

  Widget buildFromToName({
    required ColorScheme colorScheme,
    required String title,
    required String subtitle,
    required CrossAxisAlignment textAlign,
  }) => Column(
    crossAxisAlignment: textAlign,
    children: [
      Text(
        title,
        style: CustomTextTheme.fontSize24bold(
          context,
        ).copyWith(color: colorScheme.tertiaryFixed),
      ),
      Gap.height(20),
      Text(
        subtitle,
        style: CustomTextTheme.fontSize14regular(
          context,
        ).copyWith(color: colorScheme.tertiaryFixed),
      ),
    ],
  );

  void showDateTimePicker() async {
    // DateTime now = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2024),
      lastDate: DateTime(2026),
    );
    debugPrint(pickedDate.toString());
  }
}
