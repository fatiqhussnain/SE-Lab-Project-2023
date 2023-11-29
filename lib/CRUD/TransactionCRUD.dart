import 'package:sqflite/sqflite.dart';
import '../Models/Transaction.dart';
import 'SqlHelper.dart';

class TransactionCRUD{

  static Future<bool> addTransaction(TransactionBL transaction) async {
    Database db = await SqlHelper.db();
    int res = await db.insert("Transactions", transaction.toJson());
    return res == 1 ? true : false;
  }
  static Future<List<TransactionBL>> getTransactions() async {
    Database db = await SqlHelper.db();
    List<Map<String, dynamic>> res = await db.query("Transactions");
    List<TransactionBL> transactions = [];
    res.forEach((element) {
      transactions.add(TransactionBL.fromJson(element));
    });
    return transactions;
  }
  static Future<bool> deleteTransaction(int id) async {
    Database db = await SqlHelper.db();
    int res = await db.delete("Transactions", where: "id = ?", whereArgs: [id]);
    return res == 1 ? true : false;
  }
  static Future<bool> updateTransaction(TransactionBL transaction) async {
    Database db = await SqlHelper.db();
    int res = await db.update("Transactions", transaction.toJson(), where: "id = ?", whereArgs: [transaction.id]);
    return res == 1 ? true : false;
  }
}