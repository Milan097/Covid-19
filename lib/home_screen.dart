import 'package:coronav2/constant.dart';
import 'package:coronav2/my_header.dart';
import 'package:coronav2/screen_status.dart';
import 'package:coronav2/services/world_corona.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'counter.dart';

class HomeScreen extends StatefulWidget {
  final Function updateState;
  final Status screen;
  Corona curCorona;
  bool isDataRetrieved = false;
  HomeScreen({Key key, this.updateState, this.screen, this.curCorona}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    if(widget.curCorona.countryName == 'Global')
      updateCases(widget.curCorona);
    return Scaffold(
      body: Column(
        children: <Widget>[
          MyHeader(
            img: 'assets/icons/Drcorona.svg',
            topText: 'All you need',
            bottomText: 'is to stay home',
            updateState: widget.updateState,
            screen: widget.screen,
          ),

          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "Click on country to change location",
                      style: SubTextStyle.copyWith(fontSize: 15),
                  ),
                ]
              ),
            ),
          ),

          SizedBox(height: 10,),

          GestureDetector(
            child: Container(
              height: 56,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0,8),
                    blurRadius: 30,
                    color: ShadowColor,
                  ),
                ]
              ),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(left: 105.0),
                  child: Text(
                      widget.curCorona.countryName,
                      style: HeadingTextStyle
                  ),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/${widget.curCorona.flag}'),
                ),
              ),
            ),
            onTap: () async{
              dynamic result = await Navigator.pushNamed(context, '/locations');
              setState(() {
                if(result != null) {
                  widget.curCorona.countryName = result['country'];
                  widget.curCorona.flag = result['flag'];
                  widget.curCorona.totalCases = result['totalcases'];
                  widget.curCorona.totalDeaths = result['totaldeaths'];
                  widget.curCorona.totalRecovered = result['totalrecovered'];
                  widget.curCorona.todayCases = result['todaycases'];
                  widget.curCorona.todayDeaths = result['todaydeaths'];
                }
              });
            },
          ),

          SizedBox(height: 20,),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Case Update\n",
                              style: TitleTextstyle
                          ),
                          TextSpan(
                              text: "It will take around 30 seconds to fetch data.",
                              style: SubTextStyle.copyWith(fontSize: 11.0),
                          ),
                        ]
                      ),
                    ),
                    Spacer(),
                    Text(
                      "See Updates",
                      style: TextStyle(
                        color: PrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20,),

                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0,4),
                        blurRadius: 30,
                        color: ShadowColor,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Counter(number: widget.curCorona.totalCases, title: 'Infected', color: InfectedColor,),
                      Counter(number: widget.curCorona.totalDeaths, title: 'Deaths', color: DeathColor,),
                      Counter(number: widget.curCorona.totalRecovered, title: 'Recovered', color: Recovercolor,),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Spread of Virus',
                      style: TitleTextstyle,
                    ),
                    Text(
                      'See details',
                      style: TextStyle(
                        color: PrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(20),
                  height: 178,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0,10),
                          blurRadius: 30,
                          color: ShadowColor,
                        ),
                      ]
                  ),
                  child: Image.asset(
                    'assets/images/map.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }



  Future<void> updateCases(Corona select) async {
    Corona instance = select;
    await instance.getCases();
    setState(() {});
  }

}