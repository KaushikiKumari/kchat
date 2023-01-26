import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kchat/model/theme_model.dart';
import 'package:kchat/utills/app_colors.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
          // backgroundColor: themeNotifier.isDark
          //     ? AppColors.scaffoldDarkBgColor
          //     : AppColors.scaffoldLightBgColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: themeNotifier.isDark
                ? AppColors.darkAppbarBgColor
                : AppColors.lightAppbarBgColor,
            title: Text(themeNotifier.isDark ? "Dark Mode" : "Light Mode"),
            actions: [
              IconButton(
                  icon: Icon(themeNotifier.isDark
                      ? Icons.nightlight_round
                      : Icons.wb_sunny),
                  onPressed: () {
                    themeNotifier.isDark
                        ? themeNotifier.isDark = false
                        : themeNotifier.isDark = true;
                  })
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Email-ID',
                      hintStyle: GoogleFonts.lato(fontSize: 12)),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: GoogleFonts.lato(fontSize: 12)),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: themeNotifier.isDark
                          ? AppColors.darkBtnColor
                          : AppColors.lightBtnColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Center(
                        child: Text(
                      'Sign In',
                      style: GoogleFonts.lato(fontSize: 15),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                
              ]),
            ),
          ));
    });
  }
}
