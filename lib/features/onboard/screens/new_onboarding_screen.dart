import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stackfood_multivendor/common/widgets/build_button_widget.dart';
import 'package:stackfood_multivendor/features/language/screens/new_language_screen.dart';
import 'package:stackfood_multivendor/util/app_constants.dart';
import 'package:stackfood_multivendor/util/images.dart';

class NewOnboardingScreen extends StatefulWidget {
  const NewOnboardingScreen({super.key});

  @override
  State<NewOnboardingScreen> createState() => _NewOnboardingScreenState();
}

class _NewOnboardingScreenState extends State<NewOnboardingScreen> {
  final controller = PageController(viewportFraction: 1, keepPage: true);
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background pattern
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Images.backgroundImg), // Replace with your pattern image
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          // Skip button
          Positioned(
            top: 40,
            right: 20,
            child: GestureDetector(
              onTap: () {
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => NewLanguageScreen()));
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),

          PageView.builder(
              controller: controller,
              itemCount: AppConstants.newOnBoarList.length,
              onPageChanged: (val) {
                setState(() {
                  index = val;
                });
              },
              itemBuilder: (context,index){
                return Stack(
                  children: [
                    Positioned(
                      bottom: 150,
                      left: MediaQuery.of(context).size.width / 2.8,
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          Images.phoneImg, // Replace with your phone mockup image
                          height: 300,
                        ),
                      ),
                    ),
                    // Main content
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 300,
                        child: Container(
                          //margin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SmoothPageIndicator(
                                controller: controller,  // PageController
                                count: AppConstants.newOnBoarList.length,
                                effect: ExpandingDotsEffect(
                                    dotColor: const Color(0xff898A8E),
                                    activeDotColor: Color(0xff7C0631),
                                    dotWidth: 18,
                                    dotHeight: 7
                                ),
                              ),
                              SizedBox(height: 16,),
                              Text(
                                AppConstants.newOnBoarList[index].txt!,
                                style: TextStyle(
                                  color: Color(0xff7C0631),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                AppConstants.newOnBoarList[index].des!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              Spacer(),
                              BuildButtonWidget(txt: 'Continue',onTap: (){
                                if(index == 2){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => NewLanguageScreen()));
                                  //Navigator.pushReplacementNamed(context, Routes.loginScreen);
                                }else{
                                  controller.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
                                }
                              },),
                              SizedBox(height: 16,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              })

        ],
      ),
    );
  }
}
