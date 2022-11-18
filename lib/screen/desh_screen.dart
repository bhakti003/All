import 'package:demo/get_Controller/app_controller.dart';
import 'package:demo/screen/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeshScreen extends StatefulWidget {
  const DeshScreen({Key? key}) : super(key: key);

  @override
  State<DeshScreen> createState() => _DeshScreenState();
}

class _DeshScreenState extends State<DeshScreen> {
  final homePageController = Get.put(HomePageController());
  @override
  void initState() {
    homePageController.getApi();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Application"),
      ),
      body: Obx(() => Container(
        child: homePageController.user.value.appCenter == null
            ? Center(child: CircularProgressIndicator())
            : ListView.separated(
          itemCount: homePageController.user.value.appCenter!.length,
          itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.all(5),
              height:100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.yellow,
              ),
              child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                        FirstScreen(sublist: homePageController.user.value.appCenter![index].subCategory),));
                  },
                  child: Center(child: Text(homePageController.user.value.appCenter![index].name!,
                    style: TextStyle(fontSize: 20),))),
            );
          }, separatorBuilder: (context,index){
          return SizedBox(
            height: 10,
          );
        },
        ),
      ))
    );
  }
}
