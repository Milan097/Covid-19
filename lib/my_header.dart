import 'package:coronav2/screen_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'constant.dart';

class MyHeader extends StatelessWidget {
  final String img;
  final String topText;
  final String bottomText;
  final Status screen;
  final Function updateState;
  const MyHeader({
    Key key, this.img, this.topText, this.bottomText, this.screen, this.updateState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(top: 50, left: 40, right: 20,),
        width: double.infinity,
        height: 350,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF3383CD),
              Color(0xFF11249F),
            ],
          ),
          image: DecorationImage(
            image: AssetImage('assets/images/virus.png'),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  if(screen == Status.info) {
                    updateState(Status.home);
                  } else if(screen == Status.home) {
                    updateState(Status.info);
                  }
                },
                child: SvgPicture.asset('assets/icons/menu.svg'),
              ),
            ),

            SizedBox(height: 20.0,),

            Expanded(
              child: Stack(
                children: <Widget>[
                  SvgPicture.asset(
                    img,
                    width: 230,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                  Positioned(
                    top: 20,
                    left: 150,
                    child: Text(
                      '$topText \n$bottomText.',
                      style: HeadingTextStyle.copyWith(
                          color: Colors.white
                      ),
                    ),
                  ),
                  Container(),

                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height-80);
    path.quadraticBezierTo(size.width/2, size.height, size.width, size.height-80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

}
