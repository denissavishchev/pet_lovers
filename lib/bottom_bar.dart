import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 25,
          child: Container(
            width: MediaQuery.of(context).size.width - 60,
            height: 55,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff1a2223),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(2, 2),
                )
              ],
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          top: 55,
          child: Container(
            width: MediaQuery.of(context).size.width - 60,
            height: 3,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.elliptical(8000, 80),
                  bottomRight: Radius.elliptical(8000, 80),
                  topLeft: Radius.elliptical(8000, 80),
                  bottomLeft: Radius.elliptical(8000, 80),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xffdbb504).withOpacity(0.5),
                  blurRadius: 4,
                  spreadRadius: 1
                )
              ]
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                buildNavBarItem('home', 0),
                buildNavBarItem('heart', 1),
                buildNavBarItem('share', 2),
                buildNavBarItem('tweeter', 3),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildNavBarItem(String image, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width / 8,
            height: 65,
            // color: Colors.black,
          ),
          Container(
              width: index == _selectedIndex ? 60 : 35,
              height: index == _selectedIndex ? 60 : 35,
              padding: (index == _selectedIndex
                  ? const EdgeInsets.all(8)
                  : const EdgeInsets.all(10)),
              margin: EdgeInsets.only(
                  left: 10,
                  top: index == _selectedIndex ? 5 : 35,
                  bottom: 0
              ),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffdbb504).withOpacity(0.6),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(2, 2)
                    )
                  ],
                  color: Color(0xff282d32)),
              child: Image.asset('assets/icons/$image.png'))
        ],
      ),
    );
  }
}

