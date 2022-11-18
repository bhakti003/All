import 'dart:convert';

import 'package:demo/api_model/model_demo.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomePageController extends GetxController{
  var user = Demo().obs;
  getApi() async {
    print("Call Api");
    var show = await http.get(Uri.parse("http://vasundharaapps.com/artwork_apps/api/AdvertiseNewApplications/17/""com.latest.status.message.text.jokes.funny"));
    if(show.statusCode == 200){
      print("Display ${show.body}");
      user.value = Demo.fromJson(jsonDecode(show.body));
      print("Sceessfull Data");
    }
  }
}
class PageController extends GetxController{
  var demo = Demo().obs;
  getApicall() async {
    var res = await http.get(Uri.parse("http://vasundharaapps.com/artwork_apps/api/AdvertiseNewApplications/17/""com.latest.status.message.text.jokes.funny"));
 if(res.statusCode == 200){
   demo.value = Demo.fromJson(jsonDecode(res.body));
 }
  }


}
