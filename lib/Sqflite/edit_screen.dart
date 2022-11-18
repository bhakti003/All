import 'dart:io';

import 'package:demo/Sqflite/contect_controller.dart';
import 'package:demo/Sqflite/contect_list.dart';
import 'package:demo/get_Controller/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

import 'contect_model.dart';

class EditScreen extends StatefulWidget {
  Phones? model;
  EditScreen({Key? key,this.model}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final homeePageController = Get.put(HomePageeContorller());
  final namecontroller = TextEditingController();
  final citycontoller = TextEditingController();
  var imageshow;
  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contect List"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            CircleAvatar(
              radius: 60,
              backgroundImage: FileImage(File(widget.model!.image!)),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: namecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  hintText: widget.model!.name!
                ),
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: citycontoller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    hintText: widget.model!.city!
                ),
              ),
            ),
            SizedBox(height: 30,),
            GestureDetector(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ContectList(),));
            },
              child: Container(
                height: 50,
                width: 90,
                color: Colors.blue,
                child: Center(child: Text("Update"),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
