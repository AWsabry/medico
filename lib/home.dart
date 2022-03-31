import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:medico_app/constants.dart';
import 'package:medico_app/coustom_bottom_nav_bar.dart';

import 'package:medico_app/doctorCard.dart';
import 'package:medico_app/enums.dart';
import 'package:medico_app/models/Product.dart';
import 'package:medico_app/otp/otp_screen.dart';
import 'package:medico_app/section_title.dart';
import 'package:medico_app/size_config.dart';
import 'package:medico_app/slider.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(
        selectedMenu: MenuState.home,
      ),
      drawer: const Drawer(),
      appBar: AppBar(
        actions: [
          GestureDetector(
            onDoubleTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => OtpScreen()));
            },
            child: IconButton(
                icon: SvgPicture.asset("assets/icons/ambulance.svg",
                    color: kPrimaryColor),
                onPressed: () {}),
          ),
        ],
        title: Row(
          children: [
            Image.asset(
              "assets/images/m.png",
              fit: BoxFit.contain,
              height: 60,
            ),
          ],
        ),
        toolbarHeight: 60,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenWidth(10)),
              const Sliders(),
              SizedBox(height: getProportionateScreenWidth(20)),
              Column(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/11.jpg'),
                    radius: 60,
                  ),
                  SizedBox(height: getProportionateScreenWidth(30)),
                  const Text(
                    "Don't know your Case ?",
                    style: TextStyle(
                      fontSize: 14,
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Know Your Case'),
                    style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor,
                        textStyle: const TextStyle(
                            // fontWeight: FontWeight.bold,
                            ),
                        fixedSize: const Size(200, 35),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ],
              ),

              SizedBox(height: getProportionateScreenWidth(15)),

              // Categories(),
              // SpecialOffers(),
              SizedBox(height: getProportionateScreenWidth(30)),
              Image.asset('assets/images/00.jpg'),
              SizedBox(height: getProportionateScreenWidth(10)),

              Stack(
                children: <Widget>[
                  // Stroked text as border.
                  Text(
                    'JOIN OUR Competition',
                    style: TextStyle(
                      fontSize: 30,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 6
                        ..color = kPrimaryColor,
                    ),
                  ),
                  // Solid text as fill.
                  const Text(
                    'JOIN OUR Competition',
                    style: TextStyle(
                      fontSize: 30,
                      color: kSecondaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenWidth(30)),
              // Image.asset('assets/images/11.jpg'),

              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20)),
                    child: const SectionTitle(
                      title: "Advices for you",
                    ),
                  ),
                  SizedBox(height: getProportionateScreenWidth(20)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          demoProducts.length,
                          (index) {
                            if (demoProducts[index].isPopular) {
                              return DoctorCard(product: demoProducts[index]);
                            }

                            return const SizedBox
                                .shrink(); // here by default width and height is 0
                          },
                        ),
                        SizedBox(width: getProportionateScreenWidth(50)),
                      ],
                    ),
                  )
                ],
              ),

              // Container(
              //   alignment: Alignment.topCenter,
              //   margin: EdgeInsets.only(top: 20),
              //   child: Chip(
              //     avatar: const CircleAvatar(
              //       child: Icon(Icons.account_circle),
              //       backgroundColor: Colors.green,
              //     ),
              //     label: Text("Codesinsider"),
              //     onDeleted: () {},
              //     deleteIconColor: Colors.green,
              //     side: BorderSide(
              //         color: Colors.green, width: 1, style: BorderStyle.solid),
              // ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
