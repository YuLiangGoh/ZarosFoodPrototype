import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:zaros_prototype/app/app_navigator.dart';
import 'package:zaros_prototype/app/app_route.dart';
import 'package:zaros_prototype/const/image_path.dart';
import 'package:zaros_prototype/const/lottie_path.dart';

class SplashScreenPage extends HookWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      initialStartUp();
      return;
    }, []);

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.1,
                child: Image.asset(
                  imageBean,
                  repeat: ImageRepeat.repeat,
                  gaplessPlayback: true,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(lottieCoffee,
                    width: 0.5.sw,
                    frameRate: FrameRate.max,
                    filterQuality: FilterQuality.medium),
                Text(
                  'Zaros',
                  style: GoogleFonts.mali(
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> initialStartUp() async {
    await Future.delayed(
      const Duration(milliseconds: 3200),
      () {
        AppNavigator.replaceAndRerouteTo(AppRoute.dashboard);
      },
    );
  }
}
