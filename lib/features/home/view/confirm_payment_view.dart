import 'package:flight_booking/core/asstes_path/image_paths.dart';
import 'package:flight_booking/core/theme/text_theme.dart';
import 'package:flight_booking/core/utils/tool/gap.dart';
import 'package:flight_booking/features/common/widget/flight_card_widget.dart';
import 'package:flight_booking/features/common/widget/flight_details_card_widget.dart';
import 'package:flight_booking/features/home/view/pay_now_view.dart';
import 'package:flutter/material.dart';

class ConfirmPaymentView extends StatefulWidget {
  const ConfirmPaymentView({super.key});

  static const String name = 'comfirm payment';

  @override
  State<ConfirmPaymentView> createState() => _ConfirmPaymentViewState();
}

class _ConfirmPaymentViewState extends State<ConfirmPaymentView> {
  TextEditingController passengerdDetailsController = TextEditingController();
  TextEditingController seatNumberController = TextEditingController();

  @override
  void initState() {
    passengerdDetailsController.text = 'Mr Andrew Ainsley';
    seatNumberController.text = 'Mr Andrew Ainsley';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            headerSection(isLight, context, colorScheme),
            Gap.height(10),
            FlightCardWidget(),
            Gap.height(10),
            FlightDetailsCardWidget(),
            Gap.height(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  contactDetailsSection(colorScheme, context),
                  Gap.height(10),
                  passengerDetailsSection(colorScheme),
                  Gap.height(10),
                  seatNumberSection(colorScheme),
                  Gap.height(10),
                  priceDetailsSection(colorScheme),
                  Gap.height(10),
                  confirmButtonSection(context),
                ],
              ),
            ),
            Gap.height(30),
          ],
        ),
      ),
    );
  }

  SizedBox confirmButtonSection(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, PayNowView.name);
        },
        child: Text('Continue'),
      ),
    );
  }

  Widget priceDetailsSection(ColorScheme colorScheme) {
    return detailsCard(
      colorScheme,
      title: 'Price Details',
      prefixIcon: Icons.attach_money,
      child: Column(
        children: [
          Gap.height(10),
          Divider(thickness: 1, color: Colors.grey),
          priceRow(title: 'Emerits (Adult)x1', price: '\$1599.00'),
          Gap.height(9),
          priceRow(title: 'Tavel Insurance', price: '\$45.00'),
          Gap.height(9),
          priceRow(title: 'Tax', price: '\$25.00'),
          Gap.height(9),
          Divider(thickness: 1, color: Colors.grey),
          priceRow(title: 'Total Price', price: '\$1699.00'),
        ],
      ),
    );
  }

  Card seatNumberSection(ColorScheme colorScheme) {
    return detailsCard(
      colorScheme,
      title: 'Seat Number',
      suffixIocn: Icons.arrow_forward_ios,
      prefixIcon: Icons.chair,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap.height(10),
          TextFormField(
            controller: seatNumberController,
            decoration: InputDecoration(
              suffix: Text('B2', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Card passengerDetailsSection(ColorScheme colorScheme) {
    return detailsCard(
      colorScheme,
      title: 'Passenger(s) Details',
      suffixIocn: Icons.add,
      prefixIcon: Icons.people,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap.height(10),
          TextFormField(
            controller: passengerdDetailsController,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.arrow_drop_down, size: 30),
            ),
          ),
        ],
      ),
    );
  }

  Card contactDetailsSection(ColorScheme colorScheme, BuildContext context) {
    return detailsCard(
      colorScheme,
      title: 'Contact Details',
      suffixIocn: Icons.edit,
      prefixIcon: Icons.person_outline,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap.height(15),
          Text(
            'Andro anisley',
            style: CustomTextTheme.fontSize16semiBold(context),
          ),
          Gap.height(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'androa...ly@gmail.com',
                style: CustomTextTheme.fontSize12regular(context),
              ),
              Text(
                '+88 01762-446280',
                style: CustomTextTheme.fontSize12regular(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container headerSection(
    bool isLight,
    BuildContext context,
    ColorScheme colorScheme,
  ) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: isLight
              ? AssetImage(ImagePaths.lightbBgJpeg)
              : AssetImage(ImagePaths.darkBgJpeg),
          fit: BoxFit.cover,
        ),
      ),
      child: truckSection(context, colorScheme),
    );
  }

  Widget priceRow({required String title, required String price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: CustomTextTheme.fontSize14regular(context)),
        Text(price, style: CustomTextTheme.fontSize14semiBold(context)),
      ],
    );
  }

  Card detailsCard(
    ColorScheme colorScheme, {
    required String title,
    IconData? suffixIocn,
    required IconData prefixIcon,
    required Widget child,
  }) {
    return Card(
      color: colorScheme.surface,

      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(prefixIcon),
                Gap.width(10),
                Text(title, style: CustomTextTheme.fontSize16bold(context)),
                Spacer(),
                Icon(suffixIocn, color: colorScheme.primary),
              ],
            ),
            child,
          ],
        ),
      ),
    );
  }

  Widget truckSection(BuildContext context, ColorScheme colorScheme) {
    return Column(
      children: [
        Gap.height(60),
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.white),
            ),
            Gap.width(90),
            Text(
              'Fill in details',
              style: CustomTextTheme.fontSize16semiBold(
                context,
              ).copyWith(color: Colors.white),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pointCard(
              colorScheme,
              title: 'Book',
              count: '1',
              bgColor: Colors.white,
              textColor: colorScheme.primary,
            ),
            Gap.width(10),
            Container(width: 50, height: 2, color: colorScheme.primary),
            Gap.width(10),
            Column(
              children: [
                pointCard(
                  colorScheme,
                  title: 'Pay',
                  count: '2',
                  bgColor: colorScheme.primary,
                  textColor: Colors.white,
                ),
              ],
            ),
            Gap.width(10),
            Container(width: 50, height: 2, color: colorScheme.primary),
            Gap.width(10),
            pointCard(
              colorScheme,
              title: 'E-ticket',
              count: '3',
              bgColor: colorScheme.primary,
              textColor: Colors.white,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap.width(5),
            Text('Book', style: TextStyle(color: Colors.white)),
            Gap.width(75),
            Text('Pay', style: TextStyle(color: Colors.white)),
            Gap.width(70),
            Text('E-ticket', style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    );
  }

  Widget pointCard(
    ColorScheme colorScheme, {
    required String count,
    required String title,
    required Color bgColor,
    required Color textColor,
  }) {
    return CircleAvatar(
      backgroundColor: bgColor,
      child: Text(
        count,
        style: CustomTextTheme.fontSize16medium(
          context,
        ).copyWith(color: textColor),
      ),
    );
  }
}
