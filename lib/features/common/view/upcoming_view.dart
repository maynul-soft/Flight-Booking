import 'package:flight_booking/core/asstes_path/image_paths.dart';
import 'package:flight_booking/core/utils/tool/gap.dart';
import 'package:flutter/material.dart';

class UpcomingView extends StatefulWidget {
  const UpcomingView({super.key});

  static const String name = 'upcoming view';

  @override
  State<UpcomingView> createState() => _UpcomingViewState();
}

class _UpcomingViewState extends State<UpcomingView> {
  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              isLight ? ImagePaths.lightbBgJpeg : ImagePaths.darkBgJpeg,
            ),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Upcoming',
                style: TextStyle(fontSize: 50, fontFamily: 'Schyler'),
              ),

              Gap.height(20),

              Text(
                'Check the Dark and light view \n option on account tab',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontFamily: 'Schyler'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
