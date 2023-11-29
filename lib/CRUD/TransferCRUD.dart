import 'package:sqflite/sqflite.dart';
import '../Models/Transfer.dart';
import 'SqlHelper.dart';

class TransferCRUD{
  static Future<bool> addTransfer(Transfer transfer) async {
    Database db = await SqlHelper.db();
    int res = await db.insert("Transfers", transfer.toJson());
    return res == 1 ? true : false;
  }
  static Future<List<Transfer>> getTransfers() async {
    Database db = await SqlHelper.db();
    List<Map<String, dynamic>> res = await db.query("Transfers");
    List<Transfer> transfers = [];
    res.forEach((element) {
      transfers.add(Transfer.fromJson(element));
    });
    return transfers;
  }
  static Future<bool> deleteTransfer(int id) async {
    Database db = await SqlHelper.db();
    int res = await db.delete("Transfers", where: "id = ?", whereArgs: [id]);
    return res == 1 ? true : false;
  }
  static Future<bool> updateTransfer(Transfer transfer) async {
    Database db = await SqlHelper.db();
    int res = await db.update("Transfers", transfer.toJson(), where: "id = ?", whereArgs: [transfer.id]);
    return res == 1 ? true : false;
  }
}