import 'package:flight_booking/core/asstes_path/image_paths.dart';
import 'package:flight_booking/core/theme/text_theme.dart';
import 'package:flight_booking/core/utils/tool/gap.dart';
import 'package:flight_booking/features/common/widget/flight_card_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TicketView extends StatefulWidget {
  const TicketView({super.key});

  static const String name = 'ticket view';

  @override
  State<TicketView> createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    bool isLight = Theme.of(context).brightness == Brightness.light;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              isLight ? ImagePaths.lightbBgJpeg : ImagePaths.darkBgJpeg,
            ),
          ),
        ),
        child: Column(
          children: [
            Gap.height(60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  Text(
                    'E-Ticket',
                    style: CustomTextTheme.fontSize16bold(
                      context,
                    ).copyWith(color: Colors.white),
                  ),
                  Transform.rotate(
                    angle: 1.58,
                    child: Icon(Icons.login, color: Colors.white),
                  ),
                ],
              ),
            ),
            Gap.height(10),
            Divider(thickness: 1, color: Colors.grey),
            Gap.height(10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ClipPath(
                      clipper: TicketClipper(),
                      child: Container(
                        width: width - 50,
                        color: colorScheme.surface,
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                colorFilter: ColorFilter.mode(
                                  isLight ? Colors.black : Colors.white,
                                  BlendMode.srcIn,
                                ),
                                ImagePaths.barCodeSvg,
                                height: 250,
                                width: width - 30,
                              ),

                              Divider(thickness: 1, color: Colors.grey),
                              Gap.height(20),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.red,
                                  ),
                                  Gap.width(10),
                                  Text(
                                    'Emirates',
                                    style: CustomTextTheme.fontSize15bold(
                                      context,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Wed, Dec 27 2023',
                                    style: CustomTextTheme.fontSize15bold(
                                      context,
                                    ),
                                  ),
                                ],
                              ),
                              Gap.height(5),
                              Divider(thickness: 1, color: Colors.grey),
                              FlightCardDetailsWidget(),
                              Gap.height(20),
                              userDetailsRow(
                                title: 'Passenger Name',
                                details: 'Mr. Andrew Alinsely',
                              ),
                              Gap.height(10),
                              userDetailsRow(
                                title: 'email',
                                details: 'androalinsely@gmail.com',
                              ),
                              Gap.height(10),
                              userDetailsRow(
                                title: 'Mobile',
                                details: '+880 1762-446280',
                              ),
                              Gap.height(10),
                              userDetailsRow(
                                title: 'Booking ID',
                                details: 'BKB234AG',
                              ),
                              Gap.height(10),
                              userDetailsRow(
                                title: 'Flight Number ',
                                details: 'BKB202',
                              ),
                              Gap.height(10),
                              userDetailsRow(title: 'Gate', details: '25'),
                              Gap.height(10),
                              userDetailsRow(
                                title: 'Serial Number',
                                details: 'B2',
                              ),
                              Gap.height(15),
                              Text('Enjoy travelling around the world with us'),
                              Gap.height(5),
                              Text(
                                'www.m360id.com',
                                style: TextStyle(color: colorScheme.primary),
                              ),
                            ],
                          ),
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

  Widget userDetailsRow({required String title, required String details}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: CustomTextTheme.fontSize14regular(context)),
        Text(details, style: CustomTextTheme.fontSize14semiBold(context)),
      ],
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  final double cutHeightFactor;
  final double cornerRadius;
  final double cutRadius;

  TicketClipper({
    this.cutHeightFactor = 0.35,
    this.cornerRadius = 12.0,
    this.cutRadius = 16.0,
  });

  @override
  Path getClip(Size size) {
    final double cutHeight = size.height * cutHeightFactor;

    Path path = Path()
      ..moveTo(0, cornerRadius)
      ..arcToPoint(
        Offset(cornerRadius, 0),
        radius: Radius.circular(cornerRadius),
      )
      ..lineTo(size.width - cornerRadius, 0)
      ..arcToPoint(
        Offset(size.width, cornerRadius),
        radius: Radius.circular(cornerRadius),
      )
      ..lineTo(size.width, cutHeight - cutRadius)
      ..arcToPoint(
        Offset(size.width, cutHeight + cutRadius),
        radius: Radius.circular(cutRadius),
        clockwise: false,
      )
      ..lineTo(size.width, size.height - cornerRadius)
      ..arcToPoint(
        Offset(size.width - cornerRadius, size.height),
        radius: Radius.circular(cornerRadius),
      )
      ..lineTo(cornerRadius, size.height)
      ..arcToPoint(
        Offset(0, size.height - cornerRadius),
        radius: Radius.circular(cornerRadius),
      )
      ..lineTo(0, cutHeight + cutRadius)
      ..arcToPoint(
        Offset(0, cutHeight - cutRadius),
        radius: Radius.circular(cutRadius),
        clockwise: false,
      )
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
