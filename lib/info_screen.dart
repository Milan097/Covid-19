import 'package:coronav2/my_header.dart';
import 'package:coronav2/constant.dart';
import 'package:coronav2/screen_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoScreen extends StatelessWidget {
  final Function updateState;
  final Status screen;
  const InfoScreen({Key key, this.updateState, this.screen}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
              img: 'assets/icons/coronadr.svg',
              topText: 'Get to know',
              bottomText: 'About Covid-19.',
              updateState: updateState,
              screen: screen,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Symptoms',
                    style: TitleTextstyle,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MySymptoms(
                        image: 'assets/images/headache.png',
                        symName: 'Headache',
                        isActive: true,
                      ),
                      MySymptoms(
                        image: 'assets/images/fever.png',
                        symName: 'Fever',
                        isActive: true,
                      ),
                      MySymptoms(
                        image: 'assets/images/caugh.png',
                        symName: 'Caugh',
                        isActive: true,
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'Preventions',
                    style: TitleTextstyle,
                  ),
                  SizedBox(height: 20,),
                  MyPreventions(
                    img: 'assets/images/wear_mask.png',
                    title: 'Wear the mask',
                    text: 'Since the start of coronavirus outbreak some places have fully embraced wearing facemarks.',
                  ),
                  MyPreventions(
                    img: 'assets/images/wash_hands.png',
                    title: 'Wash your hands',
                    text: 'Since the start of coronavirus outbreak its always preferable to wash hands regularly.',
                  ),
                  SizedBox(height: 50,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyPreventions extends StatelessWidget {
  final String img;
  final String title;
  final String text;
  const MyPreventions({
    Key key, this.img, this.title, this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0,8),
                    blurRadius: 30,
                    color: ShadowColor,
                  )
                ]
              ),
            ),
            Image.asset(img,),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15 ),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: TitleTextstyle.copyWith(fontSize: 16),
                    ),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset('assets/icons/forward.svg'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MySymptoms extends StatelessWidget {
  final String image;
  final String symName;
  final bool isActive;
  const MySymptoms({
    Key key, this.image, this.symName,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive ?
          BoxShadow(
            offset: Offset(0,10),
            blurRadius: 30,
            color: ActiveShadowColor,
          ) : BoxShadow(
            offset: Offset(0,3),
            blurRadius: 6,
            color: ShadowColor,
          )
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.asset(image,height: 90,),
          Text(
            symName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
