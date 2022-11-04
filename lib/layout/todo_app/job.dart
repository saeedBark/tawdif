//import 'package:conditional_builder/conditional_builder.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs/shared/cubit/cubit.dart';
import 'package:jobs/shared/cubit/states.dart';
import '../../modules/all_jobs/allJobs.dart';

class HomeLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (BuildContext context, AppState state) {
          if(state is AppInsertDatabaseState){
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, AppState state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.grey.shade200,
            key: scaffoldKey,
            appBar: AppBar(
              toolbarHeight: 70,
              centerTitle: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(50),
                ),
              ),
              title: Text(cubit.titles[cubit.currentIndex],),
            ),
            body: ConditionalBuilder(
              condition: state is! AppGetDatabaseLoadingState,
              builder: (context) => cubit.screen[cubit.currentIndex],
              fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            ),


            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
                // setState(() {
                //   currentIndex = index;
                // });
                print(index);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'جميع الوظائف'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category_outlined), label: 'الفيئات'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add), label: 'إضافة وظيفة'),
              ],
            ),
          );
        },
      ),
    );
  }

//
// Future<String> getName() async {
//   return 'saeed bark';
// }

// create database and table
}
