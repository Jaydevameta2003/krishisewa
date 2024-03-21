import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:krishisewa/src/features/authentication/screens/home_screen/home_screen.dart';
import 'package:krishisewa/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  // @override
  // void initState(){
  //   super.initState();
  //   onboardingScreen.isLogin(context);
  // }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            Container(
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() => isLastPage = index == 2);
                },
                children: [
                  Container(
                    padding:const EdgeInsets.all(30),
                    color: const Color(0xFFF0F1A9),
                    child: Column(
                      children: [
                        Image.asset('assets/images/on_boarding_images/weatheronboard.png',height: 300,width: 300,),
                        const SizedBox(height: 30,),
                        Text('Stay informed about the weather', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),),
                        Text('Get real-time weather updates and forecasts for your location.')
                      ],
                    ),
                  ),
                  Container(
                    padding:const EdgeInsets.all(30),
                    color: const Color(0xFFF0F1A9),
                    child: Column(
                      children: [
                        Image.asset('assets/images/on_boarding_images/news.png',height: 300,width: 300,),
                        const SizedBox(height: 30,),
                        Text('Catch up on the latest news', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),),
                        Text('Read top news stories from agriculture categories. Stay informed about current events.')
                      ],
                    ),
                  ),
                  Container(
                    padding:const EdgeInsets.all(30),
                    color: const Color(0xFFF0F1A9),
                    child: Column(
                      children: [
                        Image.asset('assets/images/on_boarding_images/blog.png',height: 300,width: 300,),
                        const SizedBox(height: 30,),
                        Text('Explore informative blog posts', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),),
                        Text('Read articles on various topics related to agriculture. Stay updated on trends and learn new things')
                      ],
                    ),
                  ),
                  Container(
                    padding:const EdgeInsets.all(30),
                    color: const Color(0xFFF0F1A9),
                    child: Column(
                      children: [
                        Image.asset('assets/images/on_boarding_images/communityonboard.png',height: 350,width: 350,),
                        Text('Connect and share with fellow farmers', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),),
                        Text('Join a vibrant community of farmers. Share knowledge, ask questions, and get support from a network of peers.')
                      ],
                    ),
                  ),
                  Container(
                    padding:const EdgeInsets.all(30),
                    color: const Color(0xFFF0F1A9),
                    child: Column(
                      children: [
                        Image.asset('assets/images/on_boarding_images/shoponboard.png',height: 300,width: 300,),
                        const SizedBox(height: 30,),
                        Text('Find nearby shops for your farm needs', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),),
                        Text('Discover stores selling fertilizers, seeds, equipment, and other agricultural supplies near your location.')
                      ],
                    ),
                  ),
                  Container(
                    padding:const EdgeInsets.all(30),
                    color: const Color(0xFFF0F1A9),
                    child: Column(
                      children: [
                        Image.asset('assets/images/on_boarding_images/machine.png',height: 300,width: 300,),
                        const SizedBox(height: 30,),
                        Text('Rent the equipment you need, when you need it', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),),
                        Text('Find and rent a variety of farming equipment from nearby providers. Save money and resources by renting instead of buying.')
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 250,
              left: 0,
              right: 0,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SmoothPageIndicator(
                  controller: controller,
                  count: 6,
                  effect: const SlideEffect(
                      dotHeight: 10.0, activeDotColor: Color(0xff272727)),
                ),
              ]),
            ),
            Positioned(
              bottom: 30,
              left: 30,
              right: 30,
              child: Container(
                padding: const EdgeInsets.only(left: 30, top: 20, bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: const Color(0xFF233d2a),
                ),
                height: 200,
                width: 250,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Krishi Sewa',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 50,
                        width: 200,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: ElevatedButton(
                            onPressed: () {
                                Get.off(() => const WelcomeScreen());},
                            child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Get Started',
                                    style: TextStyle(
                                        color: Color(0xFF233d2a), fontSize: 17),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Color(0xFF233d2a),
                                  )
                                ])),
                      )
                    ]),
              ),
            ),
          ],
        ),
      );
}
