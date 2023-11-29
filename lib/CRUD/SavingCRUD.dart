import 'package:sqflite/sqflite.dart';
import '../Models/Saving.dart';
import 'SqlHelper.dart';

class SavingCRUD{
  static Future<bool> addSaving(Saving saving) async {
    Database db = await SqlHelper.db();
    int res = await db.insert("Savings", saving.toJson());
    return res == 1 ? true : false;
  }
  static Future<List<Saving>> getSavings() async {
    Database db = await SqlHelper.db();
    List<Map<String, dynamic>> res = await db.query("Savings");
    List<Saving> savings = [];
    res.forEach((element) {
      savings.add(Saving.fromJson(element));
    });
    return savings;
  }
  static Future<bool> deleteSaving(int id) async {
    Database db = await SqlHelper.db();
    int res = await db.delete("Savings", where: "id = ?", whereArgs: [id]);
    return res == 1 ? true : false;
  }
  static Future<bool> updateSaving(Saving saving) async {
    Database db = await SqlHelper.db();
    int res = await db.update("Savings", saving.toJson(), where: "id = ?", whereArgs: [saving.id]);
    return res == 1 ? true : false;
  }
}