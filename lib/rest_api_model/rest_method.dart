import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';


class Apirepository {
  getalldata() async {
    try {
      var response = await http.get(Uri.parse('https://restcountries.com/v3.1/all'));
      if (response.statusCode == 200) {
        return Left(json.decode(response.body));
      } else {
        return Right('Something went wrong');
      }
    } on SocketException catch(e) {
      return Right('Check Internet Connection');
    } catch (e) {
      return Right('Something went wrong');
    }
  }
}




