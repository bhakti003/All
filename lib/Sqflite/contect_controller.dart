import 'package:demo/Sqflite/contect_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:get/get.dart';
class HomePageeContorller extends GetxController{
  var userData = <Phones>[].obs;
  Future<void> createData() async{
    String path = join(await getDatabasesPath(), "db_users");
    await openDatabase(path,version: 1,
    onCreate: (Database db , int version) async {
      printInfo(info: "db: " + db.toString());
      await db.execute('''CREATE TABLE tbl_phones(
      image TEXT NOT NULL,
      name TEXT NOT NULL,
      city TEXT NOT NULL,
      id TEXT NOT NULL
      )''');});
    getData();
  }
  Future<void> getData() async{
    userData.clear();
    String path = join(await getDatabasesPath(),"db_users");
    final db = await openDatabase(path);
    final List<Map<String,dynamic>> maps = await db.query("tbl_phones");
    userData.addAll(maps.map((e) => Phones.fromJson(e)).toList());
    print(userData.value);

  }
  addData({String? image, String? name, String? city}){
    var user = Phones(
      image: image,
      name: name,
      city: city,
      id: (userData.length + 1 ).toString()
    );
    insertData(user);
  }
  insertData(Phones user) async{
    String path = join(await getDatabasesPath(), "db_users");
    final db = await openDatabase(path);
    await db.insert("tbl_phones", user.toJson());
    print(user.toJson());
    getData();
  }
  deleteData({String? id}) async{
    String path = join(await getDatabasesPath() , "db_users");
    final db = await openDatabase(path);
    getData();
    print("Delete Recode");
    return await db.delete("tbl_phones" , where: 'id = ?' , whereArgs: [id]);

  }
  updateData(Phones user) async{
    print(user.id);
    String path = join(await getDatabasesPath(),"db_users");
    final db = await openDatabase(path);
    getData();
    print("Update Recode");
    return await db.update("tbl_phones", user.toJson(), where: 'id = ?' , whereArgs: [user.id]);

  }
}