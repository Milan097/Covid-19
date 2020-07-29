import 'package:coronav2/screen_status.dart';
import 'package:coronav2/services/world_corona.dart';
import 'package:flutter/material.dart';

import 'constant.dart';


class Locations extends StatefulWidget {

  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {

  List<Corona> locations = [
    Corona(countryName: 'Afghanistan' , flag : 'afghan.png'),
    Corona(countryName: 'Albania' , flag : 'alban.png'),
    Corona(countryName: 'Algeria' , flag : 'alger.png'),
    Corona(countryName: 'Andorra' , flag : 'andor.png'),
    Corona(countryName: 'Argentina' , flag : 'argen.png'),
    Corona(countryName: 'Australia' , flag : 'australia.png'),
    Corona(countryName: 'Austria' , flag : 'austria.png'),
    Corona(countryName: 'Bangladesh' , flag : 'bangla.png'),
    Corona(countryName: 'Belgium' , flag : 'belg.png'),
    Corona(countryName: 'Bermuda' , flag : 'berm.png'),
    Corona(countryName: 'Bhutan' , flag : 'bhutan.png'),
    Corona(countryName: 'Brazil' , flag : 'brazil.png'),
    Corona(countryName: 'Bulgaria' , flag : 'bulg.png'),
    Corona(countryName: 'Canada' , flag : 'canada.png'),
    Corona(countryName: 'China' , flag : 'china.png'),
    Corona(countryName: 'Colombia' , flag : 'colomb.png'),
    Corona(countryName: 'Denmark' , flag : 'denm.png'),
    Corona(countryName: 'Egypt' , flag : 'egypt.png'),
    Corona(countryName: 'Finland' , flag : 'finl.png'),
    Corona(countryName: 'France' , flag : 'france.png'),
    Corona(countryName: 'Germany' , flag : 'german.png'),
    Corona(countryName: 'Greece' , flag : 'greece.png'),
    Corona(countryName: 'Greenland' , flag : 'greenl.png'),
    Corona(countryName: 'Guinea' , flag : 'guinea.png'),
    Corona(countryName: 'Hong Kong' , flag : 'hong.png'),
    Corona(countryName: 'Hungary' , flag : 'hung.png'),
    Corona(countryName: 'Iceland' , flag : 'ice.png'),
    Corona(countryName: 'India' , flag : 'india.png'),
    Corona(countryName: 'Indonesia' , flag : 'indo.png'),
    Corona(countryName: 'Iran' , flag : 'iran.png'),
    Corona(countryName: 'Iraq' , flag : 'iraq.png'),
    Corona(countryName: 'Ireland' , flag : 'irel.png'),
    Corona(countryName: 'Israel' , flag : 'israel.png'),
    Corona(countryName: 'Italy' , flag : 'italy.png'),
    Corona(countryName: 'Japan' , flag : 'japan.png'),
    Corona(countryName: 'Kenya' , flag : 'kenya.png'),
    Corona(countryName: 'Malaysia' , flag : 'malesiya.png'),
    Corona(countryName: 'Maldives' , flag : 'maldi.png'),
    Corona(countryName: 'Mexico' , flag : 'mex.png'),
    Corona(countryName: 'Mongolia' , flag : 'mongo.png'),
    Corona(countryName: 'Myanmar' , flag : 'myan.png'),
    Corona(countryName: 'Namibia' , flag : 'namibia.png'),
    Corona(countryName: 'Nepal' , flag : 'nepal.png'),
    Corona(countryName: 'Netherlands' , flag : 'nether.png'),
    Corona(countryName: 'New Zealand' , flag : 'newz.png'),
    Corona(countryName: 'Nigeria' , flag : 'nigiria.png'),
    Corona(countryName: 'Norway' , flag : 'norway.png'),
    Corona(countryName: 'Oman' , flag : 'oman.png'),
    Corona(countryName: 'Pakistan' , flag : 'pak.png'),
    Corona(countryName: 'Papua New Guinea' , flag : 'papua.png'),
    Corona(countryName: 'Philippines' , flag : 'philip.png'),
    Corona(countryName: 'Poland' , flag : 'poland.png'),
    Corona(countryName: 'Portugal' , flag : 'port.png'),
    Corona(countryName: 'Qatar' , flag : 'qatar.png'),
    Corona(countryName: 'Russia' , flag : 'rus.png'),
    Corona(countryName: 'S. Korea' , flag : 'skorea.png'),
    Corona(countryName: 'San Marino' , flag : 'sanmar.png'),
    Corona(countryName: 'Saudi Arabia' , flag : 'souarab.png'),
    Corona(countryName: 'Serbia' , flag : 'serbia.png'),
    Corona(countryName: 'Singapore' , flag : 'singa.png'),
    Corona(countryName: 'South Africa' , flag : 'safrica.png'),
    Corona(countryName: 'Spain' , flag : 'spain.png'),
    Corona(countryName: 'Sri Lanka' , flag : 'slanka.png'),
    Corona(countryName: 'Switzerland' , flag : 'switzer.png'),
    Corona(countryName: 'Taiwan' , flag : 'taiwan.png'),
    Corona(countryName: 'Thailand' , flag : 'thail.png'),
    Corona(countryName: 'Turkey' , flag : 'turk.png'),
    Corona(countryName: 'UAE' , flag : 'uae.png'),
    Corona(countryName: 'UK' , flag : 'uk.png'),
    Corona(countryName: 'USA' , flag : 'usa.png'),
    Corona(countryName: 'Uganda' , flag : 'uganda.png'),
    Corona(countryName: 'Zimbabwe' , flag : 'zimba.png'),
  ];

  void updateCases(index) async {
    Corona instance = locations[index];
    await instance.getCases();
    // Navigate to home screen with updated data
    Navigator.pop(context, {
      'country' : instance.countryName,
      'flag' : instance.flag,
      'totalcases' : instance.totalCases,
      'totaldeaths' : instance.totalDeaths,
      'totalrecovered' : instance.totalRecovered,
      'todaycases' : instance.todayCases,
      'todaydeaths' : instance.todayDeaths,
    });
//    widget.updateState(Status.home);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor,
      body: Stack(
        children: <Widget> [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.purple,
                  Color(0xFF3383CD),
                  Color(0xFF11249F),
                ],
              ),
            ),
          ),

          ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  SizedBox(height: 8,),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 1.5, horizontal: 10.0),
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
                    child: ListTile(
                      onTap: () {
                        updateCases(index);
                      },
                      title: Text(
                          locations[index].countryName,
                          style: TitleTextstyle
                      ),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/${locations[index].flag}'),
                      ),
                    ),
                  ),
                  SizedBox(height: 5,)
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
