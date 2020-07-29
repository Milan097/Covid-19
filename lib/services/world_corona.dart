import 'package:http/http.dart';
import 'dart:convert';

class Corona {
  String countryName;
  String flag;
  String totalCases = "Counting...";
  String totalDeaths = "Counting...";
  String totalRecovered = "Counting...";
  String todayCases = "...";
  String todayDeaths = "...";

  Corona({this.countryName , this.flag});

  Future<void> getCases() async {
    try {
      String url;
      if(countryName == 'Global') {
        url = 'https://corona.lmao.ninja/v2/all';
      } else {
        url = 'https://corona.lmao.ninja/v2/countries/$countryName';
      }

      Response response = await get(url);
      Map data = jsonDecode(response.body.toString());

      this.totalCases = data['cases'].toString();
      this.totalDeaths = data['deaths'].toString();
      this.totalRecovered = data['recovered'].toString();
      this.todayCases = data['todayCases'].toString();
      this.todayDeaths = data['todayDeaths'].toString();


    } catch (e) {
      print('error in API $e');
      this.totalCases = 'Error';
      this.totalDeaths = 'Error';
      this.totalRecovered = 'Error';
      this.todayCases = 'Error';
      this.todayDeaths = 'Error';
    }
  }
}