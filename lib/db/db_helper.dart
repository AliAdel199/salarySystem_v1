import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:uuid/uuid.dart';

class DatabaseManager {
  late MySqlConnection connection;

  Future<void> connectToDatabase() async {
    try {
      connection = await MySqlConnection.connect(ConnectionSettings(
  host: 'localhost', 
  port: 3306,
  user: 'salaryAdmin',
  password: 'XaW..ZmNShhr9]sn',
  db: 'salaryEmploee'
));
      print('Connected to database');
    } catch (e) {
      print('Error connecting to database: $e');
    }
  }

  Future<Results?> executeQuery(String query) async {
   
    try {

       
      return await connection.query(query);
    } catch (e) {
      print('Error executing query: $e');
      return null;
    }
  }

  Future<void> insertEmploeeData({context,year, month, empName, empMotherName,department ,empJubNumber,jobTitle, degree, step, lastTarfia, lastAlawa, startJub, iban, accountNumber, swift, bankName, empTawald, mainSalary, maridState , mMarid,childCount , mChildren,certificate, mShhada,locationState,mNaqil, nesManseb, mManseb, nesAdaria, mAdaria, nesMihania, mMihania, nesKutora, mKutora, nesTakdeer, mTakdeer, nesTashjia, mTashjia, nesEng, mEng, nesIshaa, mIshaa, mDirasat, nesGamia, mGamia, nesTibadle1, mTibAdle1, nesTibadle2, mTibAdle2, nesDriving, mDriving, tqaud, dariba,taxState, himaia, musahmatTqaud, sumAsthqaq,astiqtaaFromSalary, sumAstiqtaa, finalSalary})async {
try{
   var uuid = Uuid();

  // ignore: unused_local_variable
  Results results =await connection.query("""

INSERT INTO emploeeData(year, month, empuuid, empName, empMotherName,department , empJubNumber,jobTitle, degree, step, lastTarfia, lastAlawa, startJub, Iban, accountNumber, swift, bankName, empTawald, mainSalary,maridState , mMarid,childCount  , mChildren,certificate, mShhada,locationState, mNaqil, nesManseb, mManseb, nesAdaria, mAdaria, nesMihania, mMihania, nesKutora, mKutora, nesTakdeer, mTakdeer, nesTashjia, mTashjia, nesEng, mEng, nesIshaa, mIshaa, mDirasat, nesGamia, mGamia, nesTibadle1, mTibAdle1, nesTibadle2, mTibAdle2, nesDriving, mDriving, tqaud, dariba, taxState, himaia, musahmatTqaud, sumAsthqaq,astiqtaaFromSalary,  sumAstiqtaa, finalSalary) VALUES (?, ? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,?,? ,? ,?,? )

""",[year, month, uuid.v8(), empName, empMotherName,department , empJubNumber,jobTitle, degree, step, lastTarfia, lastAlawa, startJub, iban, accountNumber, swift, bankName, empTawald, mainSalary,maridState , mMarid,childCount , mChildren,certificate, mShhada,locationState, mNaqil, nesManseb, mManseb, nesAdaria, mAdaria, nesMihania, mMihania, nesKutora, mKutora, nesTakdeer, mTakdeer, nesTashjia, mTashjia, nesEng, mEng, nesIshaa, mIshaa, mDirasat, nesGamia, mGamia, nesTibadle1, mTibAdle1, nesTibadle2, mTibAdle2, nesDriving, mDriving, tqaud, dariba,taxState, himaia, musahmatTqaud, sumAsthqaq,astiqtaaFromSalary,  sumAstiqtaa, finalSalary]);

          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            
            animType: AnimType.rightSlide,
            title: 'تم الحفظ:',
            desc: 'تم حفظ البيانات بنجاح',
        btnOkText: "حسناً",
            btnOkOnPress: () {},width: 300,
            btnOkColor: const Color(0xff263238),
            ).show();
}catch(e){
print("e :   $e");


}

  }
   Future<void>  updateTest()async{

     Results results =await connection.query(""" UPDATE emploeeData SET empName=? """,["ali adel test"]);
    
  }
Future<void> EditEmploeeDataWhere({context,empuuid, department ,jobTitle, degree, step, lastTarfia, lastAlawa, startJub, empTawald, mainSalary, maridState , mMarid,childCount , mChildren,certificate, mShhada,locationState,mNaqil,  mManseb,  mAdaria,  mMihania, mKutora,  mTakdeer, mTashjia,  mEng,  mIshaa, mDirasat,  mGamia, mTibAdle1,  mTibAdle2, mDriving, tqaud, dariba,taxState, himaia, musahmatTqaud, sumAsthqaq,astiqtaaFromSalary, sumAstiqtaa, finalSalary})async {
try{


  Results results =await connection.query("""

UPDATE emploeeData SET department =?, jobTitle=?, degree=?, step=?, lastTarfia=?, lastAlawa=?, startJub=?, empTawald=?, mainSalary=?,maridState =?, mMarid=?,childCount  =?, mChildren=?,certificate=?, mShhada=?,locationState=?, mNaqil=?,  mManseb=?,  mAdaria=?,  mMihania=?, mKutora=?,  mTakdeer=?, mTashjia=?,  mEng=?,  mIshaa=?, mDirasat=?,  mGamia=?, mTibAdle1=?,  mTibAdle2=?, mDriving=?, tqaud=?, dariba=?, taxState=?, himaia=?, musahmatTqaud=?, sumAsthqaq=?,astiqtaaFromSalary=?,  sumAstiqtaa=?, finalSalary=? WHERE empuuid=?

""",[department , jobTitle, degree, step, lastTarfia, lastAlawa, startJub, empTawald, mainSalary,maridState , mMarid,childCount , mChildren,certificate, mShhada,locationState, mNaqil,  mManseb,  mAdaria,  mMihania, mKutora,  mTakdeer, mTashjia,  mEng,  mIshaa, mDirasat,  mGamia, mTibAdle1,  mTibAdle2, mDriving, tqaud, dariba,taxState, himaia, musahmatTqaud, sumAsthqaq,astiqtaaFromSalary,  sumAstiqtaa, finalSalary,empuuid]);

          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            
            animType: AnimType.rightSlide,
            title: 'تم الحفظ:',
            desc: 'تم حفظ البيانات بنجاح',
        btnOkText: "حسناً",
            btnOkOnPress: () {},width: 300,
            btnOkColor: const Color(0xff263238),
            ).show();
}catch(e){
print("e :   $e");


}

  }


  Future<List<Map<String, dynamic>>> fetchDataWhere(String query,List arg) async {
    try {
      Results results = await connection.query(query,arg);
      return results.map((row) => row.fields).toList();
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> fetchData(String query) async {
    try {
      Results results = await connection.query(query);
      return results.map((row) => row.fields).toList();
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }

  Future<void> closeConnection() async {
    await connection?.close();
    print('Connection closed');
  }

  Future<void> deleteData(String tableName, int id) async {
    try {
      await connection.query('DELETE FROM $tableName WHERE id = ?', [id]);
      print('Data deleted successfully');
    } catch (e) {
      print('Error deleting data: $e');
    }
  }

  Future<void> updateData(String tableName, int id, Map<String, dynamic> newData) async {
    try {
      String setClause = '';
      newData.forEach((key, value) {
        setClause += '$key = ?, ';
      });
      setClause = setClause.substring(0, setClause.length - 2); // Remove the last comma and space

      List<dynamic> values = newData.values.toList();
      values.add(id);

      await connection.query('UPDATE $tableName SET $setClause WHERE id = ?', values);
      print('Data updated successfully');
    } catch (e) {
      print('Error updating data: $e');
    }
  }

  Future<void> refreshData(String tableName) async {
    try {
      await connection.query('ALTER TABLE $tableName FORCE');
      print('Data refreshed successfully');
    } catch (e) {
      print('Error refreshing data: $e');
    }
  }
}




