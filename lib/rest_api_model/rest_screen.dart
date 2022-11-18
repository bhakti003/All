import 'dart:convert';

import 'package:demo/rest_api_model/rest_method.dart';
import 'package:demo/rest_api_model/rest_model.dart';
import 'package:flutter/material.dart';

class RestScreen extends StatefulWidget {
  const RestScreen({Key? key}) : super(key: key);

  @override
  State<RestScreen> createState() => _RestScreenState();
}

class _RestScreenState extends State<RestScreen> {
  List datalist = [];
  @override
  void initState() {
    getApi();
    super.initState();
  }
  @override
  getApi() async {
    var show = Apirepository().getalldata().then((value){
      value.fold((l){
        datalist = l.map((e)=> Model.fromJson(e)).toList();
        setState(() {});
      },(r){});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: datalist == null
              ?Center(child: CircularProgressIndicator(),)
              : ListView.separated(itemBuilder: (context,index){
            return Card(
              child: ListTile(
                leading: Text(datalist[index].flag!),
                title: Text(datalist[index].subregion),
                subtitle: Text(datalist[index].region),
              ),
            );
          }, separatorBuilder: (context,index){

            return SizedBox(height: 20,);
          }, itemCount: datalist.length),
        ),
    );
  }
}
