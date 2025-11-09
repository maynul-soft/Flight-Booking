import 'package:flight_booking/core/asstes_path/image_paths.dart';
import 'package:flight_booking/core/theme/text_theme.dart';
import 'package:flight_booking/core/utils/tool/gap.dart';
import 'package:flight_booking/features/common/widget/flight_card_widget.dart';
import 'package:flight_booking/features/home/controller/pay_now_controller.dart';
import 'package:flight_booking/features/home/view/ticket_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PayNowView extends StatefulWidget {
  const PayNowView({super.key});

  static const String name = 'pay now';

  @override
  State<PayNowView> createState() => _PayNowViewState();
}

class _PayNowViewState extends State<PayNowView> {
  @override
  Widget build(BuildContext context) {
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            headerSection(isLight, context, colorScheme),
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                children: [
                  FlightCardWidget(),
                  paymentMethodInfoSection(colorScheme),
                  Gap.height(10),
                  walletSection(colorScheme),
                  Gap.height(10),
                  discountVoucherSection(colorScheme),
                  Gap.height(10),
                  priceDetailsSection(colorScheme),
                  Gap.height(10),
                  payNowButtonSection(),
                  Gap.height(10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget payNowButtonSection() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, TicketView.name);
        },
        child: Text('Pay Now'),
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
          Gap.height(10),
          priceRow(title: 'Emerits (Adult)x1', price: '\$1599.00'),
          Gap.height(12),
          priceRow(title: 'Tavel Insurance', price: '\$45.00'),
          Gap.height(12),
          priceRow(title: 'Tax', price: '\$25.00'),
          Gap.height(12),
          priceRow(title: 'Point Used', price: '-\$64.50'),
          Gap.height(12),
          priceRow(title: 'Discount 25%', price: '-\$399.75'),
          Gap.height(12),
          Divider(thickness: 1, color: Colors.grey),
          priceRow(title: 'Total Price', price: '\$1699.00'),
        ],
      ),
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

  Widget discountVoucherSection(ColorScheme colorScheme) {
    List<String> vouchers = ['VXCED', 'ERCDX'];
    return detailsCard(
      colorScheme,
      title: 'Discount / Vouchars',
      prefixIcon: Icons.local_offer,
      suffixIocn: Icons.arrow_forward_ios,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap.height(10),
          Divider(thickness: 1, color: Colors.grey),
          Gap.height(10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: GetBuilder<PayNowController>(
              builder: (controller) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...vouchers.asMap().entries.map((item) {
                      return Card(
                        margin: EdgeInsets.all(5),
                        color: colorScheme.primary,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Text(
                                item.value,
                                style: TextStyle(color: Colors.white),
                              ),
                              Gap.width(8),
                              GestureDetector(
                                onTap: () {
                                  vouchers.removeAt(item.key);
                                  controller.update();
                                },
                                child: Icon(
                                  Icons.cancel_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget walletSection(ColorScheme colorScheme) {
    return Card(
      color: colorScheme.surface,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.storage),
            Gap.width(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'You Have 6,450.00 Points',
                    style: CustomTextTheme.fontSize15bold(context),
                  ),
                  Gap.height(10),
                  Text(
                    '100 points equal \$1.00. you will get 1000 points for this booking',
                  ),
                ],
              ),
            ),
            Gap.width(10),
            GetBuilder<PayNowController>(
              builder: (controller) {
                return Switch(
                  value: controller.defaultValue,
                  onChanged: controller.onChangeSwithcValue,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget paymentMethodInfoSection(ColorScheme colorScheme) {
    return detailsCard(
      colorScheme,
      title: 'Payment Method',
      prefixIcon: Icons.payment,
      suffixIocn: Icons.arrow_forward_ios,
      child: Column(
        children: [
          Gap.height(10),
          Divider(thickness: 1, color: Colors.grey),
          Gap.height(10),
          Row(
            children: [
              Icon(Icons.wallet, color: colorScheme.primary),
              Gap.width(10),
              Text('My Wallet', style: CustomTextTheme.fontSize15bold(context)),
              Spacer(),
              Text(
                '\$29,846.00',
                style: CustomTextTheme.fontSize15bold(
                  context,
                ).copyWith(color: colorScheme.primary),
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
            Container(width: 50, height: 2, color: Colors.white),
            Gap.width(10),
            Column(
              children: [
                pointCard(
                  colorScheme,
                  title: 'Pay',
                  count: '2',
                  bgColor: Colors.white,
                  textColor: colorScheme.primary,
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
        Gap.height(10),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.timer_outlined, color: Colors.white),
            Gap.width(10),
            Text(
              'Complete Payment in 01 : 59 : 46',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        Gap.height(10),
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
}
