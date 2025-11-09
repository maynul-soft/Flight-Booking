import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flight_booking/core/asstes_path/image_paths.dart';
import 'package:flight_booking/core/theme/text_theme.dart';
import 'package:flight_booking/core/utils/tool/gap.dart';
import 'package:flight_booking/features/home/controller/home_controller.dart';
import 'package:flight_booking/features/home/view/flight_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fromTeController = TextEditingController();
  final TextEditingController _toTeController = TextEditingController();
  final TextEditingController _deperTime = TextEditingController();

  @override
  void initState() {
    super.initState();
    initDate();
  }

  initDate() {
    DateTime now = DateTime.now();
    _deperTime.text = DateFormat('EEEE, MMM dd yyyy').format(now);
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    bool isLight = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: 350.h,
              width: double.infinity,
              child: Image.asset(
                isLight ? ImagePaths.lightbBgJpeg : ImagePaths.darkBgJpeg,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                buildSearchSection(colorScheme),
                Gap.height(10),
                specialOfferSection(colorScheme),
                Gap.height(25),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget specialOfferSection(ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Special offer',
                style: CustomTextTheme.fontSize18semiBold(context),
              ),
              Spacer(),
              Text(
                'See all',
                style: CustomTextTheme.fontSize14semiBold(context),
              ),
              Gap.width(8),
              Icon(Icons.arrow_forward_ios, size: 15),
            ],
          ),
          Gap.height(20),
          CarouselSlider(
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: -250,
                          top: -100,
                          child: Image.asset('assets/plane.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Gap.height(20),
                              Text(
                                '25% OFF',
                                style: TextStyle(
                                  fontFamily: 'Schyler',
                                  color: colorScheme.tertiaryFixed,
                                  fontWeight: FontWeight.bold,
                                  wordSpacing: -7,
                                  letterSpacing: -2,
                                  fontSize: 40,
                                ),
                              ),
                              Gap.height(10),
                              Text(
                                'Get your offer\nand enjoy your tour',
                                style: CustomTextTheme.fontSize12regular(
                                  context,
                                ).copyWith(color: colorScheme.tertiaryFixed),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(height: 150.h),
          ),
        ],
      ),
    );
  }

  Center buildSearchSection(ColorScheme colorScheme) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            personDetailsSection(colorScheme),
            Gap.height(20),
            Card(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        filterButtonSection(),
                        Gap.height(20),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              customTextField(
                                controller: _fromTeController,
                                labelText: 'From',
                                colorShceme: colorScheme,
                                icon: Icons.flight_takeoff,
                              ),
                              Gap.height(20),
                              customTextField(
                                controller: _toTeController,
                                labelText: 'To',
                                colorShceme: colorScheme,
                                icon: Icons.flight_land,
                              ),
                              Gap.height(20),
                              pickDateSection(colorScheme),
                              Gap.height(20),
                              passengerAndClassSection(colorScheme),
                              Gap.height(20),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: onTapToFlightListScreen,
                                  child: Text(
                                    'Search flight',
                                    style:
                                        CustomTextTheme.fontSize15bold(
                                          context,
                                        ).copyWith(
                                          color: colorScheme.tertiaryFixed,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 90.h,
                      right: 20.w,
                      child: GestureDetector(
                        onTap: valueSwap,
                        child: CircleAvatar(
                          radius: 30,
                          child: Icon(Icons.swap_calls_outlined, size: 40),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row passengerAndClassSection(ColorScheme colorScheme) {
    return Row(
      children: [
        dropDownFromField(
          colorScheme,
          items: Get.find<HomeController>().seats,
          label: 'Passengers',
          icon: Icon(Icons.people_outline),
          onChanged: (value) {
            Get.find<HomeController>().onTapSeadSelectedIndex(value);
          },
        ),
        Gap.width(10),
        dropDownFromField(
          colorScheme,
          items: Get.find<HomeController>().classes,
          label: 'Class',
          icon: Icon(Icons.airline_seat_recline_normal),
          onChanged: (value) {
            Get.find<HomeController>().onTapClassSelectedIndex(value);
          },
        ),
      ],
    );
  }

  Widget dropDownFromField(
    ColorScheme colorScheme, {
    required List items,
    required String label,
    required Icon icon,
    required ValueChanged onChanged,
  }) {
    String? numberOfSelectedSeats;
    return Expanded(
      child: DropdownButtonFormField2(
        isExpanded: true,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: colorScheme.tertiary,
            overflow: TextOverflow.ellipsis,
            fontSize: 15,
          ),
          prefixIcon: icon,
        ),
        dropdownStyleData: const DropdownStyleData(maxHeight: 180, width: 170),
        items: items.asMap().entries.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(
              item.value,
              style: TextStyle(overflow: TextOverflow.ellipsis),
            ),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null) {
            numberOfSelectedSeats = value.toString();
            onChanged(value);
          }
        },
      ),
    );
  }

  GestureDetector pickDateSection(ColorScheme colorScheme) {
    return GestureDetector(
      onTap: onTapToPicTimeDate,
      child: GetBuilder<HomeController>(
        builder: (context) {
          return TextFormField(
            style: TextStyle(color: colorScheme.tertiary),
            controller: _deperTime,
            enabled: false,
            decoration: InputDecoration(
              labelText: 'Deperture time',
              labelStyle: TextStyle(color: colorScheme.tertiary),

              prefixIcon: Icon(
                Icons.calendar_month,
                color: colorScheme.tertiary,
              ),
            ),
          );
        },
      ),
    );
  }

  Row personDetailsSection(ColorScheme colorScheme) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25.r,
          backgroundColor: Colors.grey,
          child: Icon(Icons.person, size: 40),
        ),
        Gap.width(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Good morning',
                  style: CustomTextTheme.fontSize15bold(
                    context,
                  ).copyWith(color: colorScheme.tertiaryFixed),
                ),
                Gap.width(9),
                Icon(
                  Icons.sunny_snowing,
                  size: 17,
                  color: colorScheme.tertiaryFixed,
                ),
              ],
            ),

            Text(
              'Soton Ahmed',
              style: TextStyle(color: colorScheme.tertiaryFixed),
            ),
          ],
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 1, color: colorScheme.tertiaryFixed),
          ),
          child: Icon(
            Icons.notification_important,
            color: colorScheme.tertiaryFixed,
          ),
        ),
      ],
    );
  }

  Widget customTextField({
    required TextEditingController controller,
    required ColorScheme colorShceme,
    required String labelText,
    required IconData icon,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        labelStyle: TextStyle(color: colorShceme.tertiary),
      ),
    );
  }

  Widget filterButtonSection() {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GetBuilder<HomeController>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...['One-Way', 'Round Trip', 'Multi-City'].asMap().entries.map((
              item,
            ) {
              return GestureDetector(
                onTap: () {
                  controller.updateSelectedFilter(item.key);
                },
                child: Card(
                  elevation: 3,
                  color: controller.selectedIndex == item.key
                      ? colorScheme.primary
                      : colorScheme.surface,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 8.h,
                    ),
                    child: Text(
                      item.value,
                      style: TextStyle(
                        color: controller.selectedIndex == item.key
                            ? colorScheme.tertiaryFixed
                            : colorScheme.tertiary,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        );
      },
    );
  }

  valueSwap() {
    setState(() {
      var temp = _fromTeController.text;
      _fromTeController.text = _toTeController.text;
      _toTeController.text = temp;
    });
  }

  void onTapToPicTimeDate() async {
    DateTime now = DateTime.now();

    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2023),
      lastDate: DateTime(2027),
    );

    if (pickedDate != null) {
      String formatedDate = DateFormat('EEEE, MMM dd yyyy').format(pickedDate);
      _deperTime.text = formatedDate;
      Get.find<HomeController>().update();
    } else {
      String formatedDate = DateFormat('EEEE, MMM dd yyyy').format(now);
      _deperTime.text = formatedDate;
      Get.find<HomeController>().update();
    }
  }

  @override
  void dispose() {
    _fromTeController.dispose();
    _toTeController.dispose();
    _deperTime.dispose();
    super.dispose();
  }

  void onTapToFlightListScreen() {
    Navigator.pushNamed(context, FlightListView.name);
  }
}
