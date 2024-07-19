import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'SignIn/SignIn.dart';
import 'SignIn/signin_widget.dart';
class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // Initialize any necessary data or state here
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // You can add any actions that need to be done after the first frame
      setState(() {});
    });
  }

  @override
  void dispose() {
    // Dispose any controllers or listeners here
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white, // Use a default background color
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Color(0xFF2D6A20),
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage(
                              'assets/images/medical-snake.jpg',
                            ),
                          ),
                          borderRadius: BorderRadius.circular(32),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Colors.green, // Replace with your color
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(top: 24),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Med',
                                style: GoogleFonts.inter(
                                  fontSize: 32,
                                  color: Colors.black,
                                  letterSpacing: 0,
                                ),
                              ),
                              TextSpan(
                                text: 'Genie',
                                style: GoogleFonts.inter(
                                  fontSize: 32,
                                  color: Colors.green, // Replace with your color
                                  letterSpacing: 0,
                                ),
                              ),
                            ],
                            style: GoogleFonts.inter(
                              fontSize: 32,
                              color: Colors.black,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 24, end: 24, bottom: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        Navigator.of(context).pushNamed('Onboarding_Slideshow');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Replace with your color
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          'Get Started',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => SignInWidget(), // Replace HomePage with your actual widget
                          ),
                        );

                      },
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(top: 24, bottom: 24),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Already a member?  ',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  color: Colors.black,
                                  letterSpacing: 0,
                                ),
                              ),
                              TextSpan(
                                text: 'Sign In',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  color: Colors.green, // Replace with your color
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: Colors.black,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
