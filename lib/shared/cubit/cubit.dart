import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs/component/constant.dart';
import 'package:jobs/models/item.dart';
import 'package:jobs/widget/Items.dart';
import 'package:sqflite/sqflite.dart';
import 'package:jobs/shared/cubit/states.dart';

import '../../modules/add_job/addJob.dart';
import '../../modules/category_jobs/categoryJob.dart';
import '../../modules/all_jobs/allJobs.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());
  Database database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screen = [
    AllJobsScreen(),
    CategoryScreen(),
    AddScreen(),
  ];
  List<String> titles = [
    'جميع الوظائف ',
    'فئات الوظائف ',
    'إضافة وظيفة ',
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNabBarState());
  }

  //////////////////////





///////////////////////////
//get data category from firestore
//   List<Jobs> userss ;
//   List<Jobs> getCategoryByJobs( String Knameplace){
//     List<Jobs> jobsList = [];
//     for( var jobsCategory in userss){
//       if(jobsCategory.namePlace == Knameplace){
//         jobsList.add(jobsCategory);
//       }
//     }
//     return jobsList;
//   }
/////////////////// get data
//   void getUsers() async{
//     final user = await FirebaseFirestore.instance.collection(kUsersCollection).get();
//     for (var messge in user.docs){
//       print(messge.data());
//     }
//   }

//   void createDatabase() {
//     openDatabase('todo_app.db', version: 1,
//         onCreate: (database, version) {
//
//           print('database created ');
//           database
//               .execute(
//               'CREATE TABLE tasks( id INTEGER PRIMARY KEY, title TEXT , date TEXT , time TEXT , status TEXT)')
//               .then((value) {
//             print('table created');
//           }).catchError((error) {
//             print('Error when Creating Table ${error.toString()}');
//           });
//         }, onOpen: (database) {
//            getDataFromDatabase(database);
//           print('database opened');
//         },
//     ).then((value) {
//           database = value;
//           emit(AppCreatDatabaseState());
//     });
//   }
//
//    insertToDatabase({
//     @required String title,
//     @required String time,
//     @required String date,
//   }) async {
//      await database.transaction((txn) {
//       txn.rawInsert(
//           'INSERT INTO tasks (title,date,time,status)VALUES("$title","$date","$time","new")').then((value) {
//         print('$value insert successful');
//         emit(AppInsertDatabaseState());
//         getDataFromDatabase(database);
//       }).catchError((error) {
//         print('Error when insert ${error.toString()}');
//       });
//       return null;
//     });
//   }
//
// void getDataFromDatabase(database)  {
//   newTasks = [];
//   doneTasks = [];
//   archiveTasks = [];
//
//
//   emit(AppGetDatabaseLoadingState());
//       database.rawQuery('SELECT * FROM tasks').then((value)  {
//
//         value.forEach((element)
//         {
//
//           if(element['status'] == 'new') {
//             newTasks.add(element);
//           }
//           else if(element['status'] == 'done') {
//             doneTasks.add(element);
//           }
//            else
//              archiveTasks.add(element);
//
//         });
//
//         emit(AppGetDatabaseState());
//       });
//   }
//
//  void updateData({
//    @required String status,
//    @required int id,
//  }) async{
//  database.rawUpdate(
//         'UPDATE tasks SET status = ?  WHERE id = ?',
//         ['$status  ', id],
//  ).then((value) {
//    getDataFromDatabase(database);
//    emit(AppUpdateDatabaseState());
//  });
//
//   }
//   void deleteData({
//     @required int id,
//   }) async{
//     database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]
//     ).then((value) {
//       getDataFromDatabase(database);
//       emit(AppDeleteDatabaseState());
//     });
//
//   }
//
//   bool isbuttomSheetshow = false;
//   IconData fabIcon = Icons.edit;
//
//   void ChangeBottomSheetState({@required bool isshow,@required IconData icon}){
//
//     isbuttomSheetshow = isshow;
//     fabIcon = icon;
//     emit(AppChangeSheetState());
//   }
}
