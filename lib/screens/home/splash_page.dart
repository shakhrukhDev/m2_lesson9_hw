import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m2_lesson9/screens/home/login_page.dart';
import 'package:m2_lesson9/utils/app_colors.dart';
import 'package:m2_lesson9/utils/app_images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then(
          (value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_9775FA,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.splashImage),
            Text("STYLISH", style: GoogleFonts.firaSans(
                textStyle: TextStyle(
                  color: AppColors.C_FEFEFE,
                  fontSize: 50,
                  fontWeight: FontWeight.w400,
                )
            ),),
            Text("Find Your Slyle",
            style: GoogleFonts.sacramento(
              textStyle: TextStyle(
                color: AppColors.C_FEFEFE,
                fontSize: 40,
                fontWeight: FontWeight.w400,
              )
            ))
          ],
        ),
      ),
    );
  }
}
