import 'dart:io';

import 'package:demo/Sqflite/contect_controller.dart';
import 'package:demo/Sqflite/contect_list.dart';
import 'package:demo/Sqflite/contect_model.dart';
import 'package:demo/get_Controller/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class AddScreen extends StatefulWidget {
  Phones? data;
  AddScreen({Key? key,this.data}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final homeePageController = Get.put(HomePageeContorller());
  final ImagePicker _picker = ImagePicker();
 final namecontroller = TextEditingController();
 final citycontoller = TextEditingController();
  var imageshow;
  @override
  void initState() {
    super.initState();
    if(widget.data != null){
      namecontroller.text = widget.data!.name!;
      citycontoller.text = widget.data!.city!;
      imageshow  = widget.data!.image!;
    }
  }
  void dispose(){
    super.initState();
    namecontroller.clear();
    citycontoller.clear();
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
              child: ClipOval(
                child: imageshow !=null
                  ? Image.file(File(imageshow))
               : GestureDetector(
                    onTap: () async {
                      final XFile? image = await _picker.pickImage(
                          source: ImageSource.gallery);
                      setState(() {
                        imageshow = image!.path;
                        print("image${imageshow}");
                      });
                    },
                    child: Icon(Icons.camera_alt)),
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: namecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    labelText: 'Enter Name',
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
                  labelText: 'Enter City',
                ),
              ),
            ),
            SizedBox(height: 30,),
            GestureDetector(onTap: (){
              Navigator.pop(context);
              if(widget.data != null){
                homeePageController.updateData(Phones(id: widget.data!.id,
                name: namecontroller.text,
                  city: citycontoller.text,
                ));
              }
              else{
                homeePageController.addData(image: imageshow,name: namecontroller.text,city: citycontoller.text);
              }


            },
              child: Container(
                height: 50,
                width: 90,
                color: Colors.blue,
                child: Center(child: Text(widget.data == null ? 'add' : 'update'),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
