
import 'dart:io';

import 'package:demo/Sqflite/add_screen.dart';
import 'package:demo/Sqflite/contect_controller.dart';
import 'package:demo/Sqflite/contect_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'edit_screen.dart';
class ContectList extends StatefulWidget {
  const ContectList({Key? key}) : super(key: key);

  @override
  State<ContectList> createState() => _ContectListState();
}

class _ContectListState extends State<ContectList> {
  var homePageController = Get.put(HomePageeContorller());
  @override
  void initState() {
    homePageController.createData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ContectList"),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddScreen(),));
            },
            child: Icon(Icons.add,size: 30,))],
      ),
      body: Column(
        children: [
         Obx(() =>  Container(
           child: ListView.separated(
               shrinkWrap: true,
               itemBuilder: (context,index){
                 return Dismissible(background: Container(color: Colors.yellow,child: Icon(Icons.delete),),
                   key: ValueKey(index),
                   onDismissed: (DismissDirection direction){
                   homePageController.deleteData(id: homePageController.userData[index].id);

                   },
                   child: Card(
                     borderOnForeground: true,
                     color: Colors.grey,
                     child: ListTile(
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => EditScreen(model: homePageController.userData[index],),));
                       },
                       leading:CircleAvatar(
                         radius: 25,
                         backgroundImage: FileImage(File(homePageController.userData[index].image!)),
                       ),
                       title: Column(
                         children: [
                           Text(homePageController.userData[index].name!),
                           Text(homePageController.userData[index].city!),
                         ],
                       ),
                       trailing: Icon(Icons.edit),
                     ),
                   ),
                 );
               },
               separatorBuilder: (context,index){
                 return SizedBox(height: 20,);
               }, itemCount: homePageController.userData.length),
         ),)
        ],
      ),

    );
  }
}
