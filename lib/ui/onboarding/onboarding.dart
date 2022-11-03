import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:helpa/helpa_widget.dart';

import '../log_in_screen.dart';

String description = '    Schedule appointments from verified\n'
    'service professionals or post a job to earn\n '
    '             money from your expertise';
String image = 'images/svgs/onboarding_circle.svg';

var descriptionStyle = const TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 14,
);

var titleStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Color(0xFFFEAE0D)
);

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {

  List<OnboardingContent> contents = [
    OnboardingContent(
      image:  image,
      title: 'Onboarding 1',
      description:  description
    ),
    OnboardingContent(
      image: image,
      title: "Onboardng 2",
      description: description
    ),
    OnboardingContent(
      image: image,
      title: "Onboardng 3",
      description:  description
    ),
  ];

  int currentIndex = 0;
  PageController _controller = PageController();

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
          controller: _controller,
          itemCount: contents.length,
          onPageChanged: (int index){
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (_, index){
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children:  [
                    Padding(
                      padding: const EdgeInsets.only(left: 66, right: 67, top: 110),
                      child: SvgPicture.asset(
                        contents[index].image
                      ),
                    ),
                   const SizedBox(height: 72,),
                   Text(
                      contents[index].title,
                    style: titleStyle
                  ),
                  const SizedBox(height: 9,),
                  Text(
                     contents[index].description,
                    style: descriptionStyle,
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        contents.length,
                            (index) => buildDot(index, context),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40,),
                  HelpaWidget.PositiveButton(
                      context, "LOG IN",
                          () {login(context);}
                  ),
                  ///Extract row widgets
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      const Text('New Here?'),
                      const SizedBox(width: 5,),
                      TextButton(
                          onPressed: (){},
                          child: const Text(
                              'Sign Up',
                            style: TextStyle(color: Colors.black),
                          )
                      )
                    ],),
                  )
                ],
              ),
            );
          }
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 20 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.orange,
      ),
    );
  }
  void login(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}

class OnboardingContent{
  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
  });
  String image;
  String title;
  String description;
}

