import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentPage = 0;
  late Timer _timer;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 3) {
        _currentPage++;
      }else{
        _currentPage = 0;
      }
      _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOutCubic);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List quotes = ['You Pet get gona love this App. Let\'s go...',
                    'What Pet do you preffer?...',
                    'It doesn\'t matter!..',
                      'They only eat, sleep and love you!'];

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'assets/images/bg.png',
            ),
            fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                const Color(0xfff4c903).withOpacity(0.8),
                const Color(0xff333a2e),
                const Color(0xff43452a).withOpacity(0.9),
              ],
              begin: const Alignment(1, -1),
              end: const Alignment(-1, 1),
              transform: const GradientRotation(3.14 * 2.2),
              stops: const [0.5, 0.5, 0.7]),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 60),
              child: SizedBox(
                width: size.width,
                height: size.height,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        const Color(0xffdbb504).withOpacity(0.7),
                                    blurRadius: 3,
                                    spreadRadius: 3,
                                    offset: const Offset(1, 1)),
                              ]),
                          width: 250,
                          height: 60,
                          child: TextField(
                            cursorColor: Colors.black,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xff43452a).withOpacity(0.1),
                              isDense: true,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black.withOpacity(0.4),
                                size: 30,
                              ),
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black.withOpacity(0.4)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(18),
                                  ),
                                  borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.1),
                                      width: 3)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(18),
                                  ),
                                  borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.1),
                                      width: 2)),
                            ),
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.all(12),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(18)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.4),
                                      blurRadius: 2,
                                      spreadRadius: 2,
                                      offset: const Offset(2, 2))
                                ]),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xffdbb504)
                                            .withOpacity(0.6),
                                        blurRadius: 20,
                                        spreadRadius: 4,
                                      )
                                    ]),
                                child: Image.asset('assets/icons/list.png')))
                      ],
                    ),
                    SizedBox(height: size.height * 0.07,),
                    Container(
                      width: 280,
                      height: 220,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.6),
                            spreadRadius: 4,
                            blurRadius: 16,
                            offset: const Offset(3, 0),
                          )
                        ],
                        gradient: const LinearGradient(
                            colors: [
                              Colors.black,
                              Color(0xffdbb504),
                            ],),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(80),
                            bottomLeft: Radius.circular(80),
                            topRight: Radius.elliptical(100, 80),
                            bottomRight: Radius.elliptical(240, 200)
                        ),
                      ),
                      child: Container(
                        width: 280,
                        height: 220,
                        margin: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(80),
                              bottomLeft: Radius.circular(80),
                              topRight: Radius.elliptical(100, 80),
                              bottomRight: Radius.elliptical(240, 200)
                          ),
                        ),
                        child: Center(
                            child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('PET LOVERS', style: TextStyle(
                                color: Color(0xffdbb504),
                                fontWeight: FontWeight.bold, fontSize: 24),),
                            const SizedBox(height: 10,),
                            ClipRRect(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                child: PageView.builder(
                                  controller: _pageController,
                                  itemCount: 4,
                                    itemBuilder: (context, index) {
                                    return Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: Alignment.topCenter,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                              child: Text(quotes[index], style: TextStyle(
                                                  color: Colors.white.withOpacity(0.6),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),),
                                            )),
                                        const SizedBox(height: 10,),
                                      ],
                                    );
                                    }),
                              ),
                            ),
                            SizedBox(
                              width: 42,
                              height: 8,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:
                                  List.generate(4, (index) {
                                    return Container(
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                          color: _currentPage == index ? const Color(0xffdbb504) : Colors.white,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                    );
                                  })
                              ),
                            ),
                          ],
                        ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.01,),
                    Stack(
                      children: [
                        Container(
                          width: 280,
                          height: 220,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xffdbb504).withOpacity(0.4),
                                spreadRadius: 6,
                                blurRadius: 20,
                                offset: const Offset(-3, 0),
                              )
                            ],
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xffdbb504),
                                const Color(0xffdbb504).withOpacity(0.1),
                              ],),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(80),
                                bottomRight: Radius.circular(80),
                                bottomLeft: Radius.elliptical(100, 80),
                                topLeft: Radius.elliptical(240, 200)
                            ),
                          ),
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            width: 280,
                            height: 220,
                            margin: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(80),
                                  bottomRight: Radius.circular(80),
                                  bottomLeft: Radius.elliptical(100, 80),
                                  topLeft: Radius.elliptical(240, 200)
                              ),
                            ),
                            child: Image.asset('assets/images/dog.png', fit: BoxFit.cover,),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(50)),
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.transparent,
                              child: Stack(
                                children: [
                                  BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 4,
                                      sigmaY: 4,
                                    ),
                                    child: Container(),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(50)),
                                        border: Border.all(color: Colors.black.withOpacity(0.13)),
                                        boxShadow: [
                                          BoxShadow(color: Colors.black.withOpacity(0.1),
                                          blurRadius: 20,
                                          spreadRadius: 20)
                                        ],
                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Colors.white.withOpacity(0.15),
                                              Colors.white.withOpacity(0.05),
                                            ]
                                        )
                                    ),
                                  ),
                                  Center(
                                    child: Text('EXPLORE', style: TextStyle(
                                        fontSize: 16, 
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white.withOpacity(0.5)),),
                                  )
                                ],
                              )
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: size.height * 0.04,),
                    SizedBox(
                      width: size.width,
                      height: 80,
                      child: const BottomBar()
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
