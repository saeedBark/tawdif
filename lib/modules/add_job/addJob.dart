import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs/component/components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobs/component/constant.dart';
import 'package:jobs/component/listCategory.dart';
import 'package:jobs/models/item.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class AddScreen extends StatefulWidget {
  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  CollectionReference users =
      FirebaseFirestore.instance.collection(kUsersCollection);

  var _nameJobController = TextEditingController();

  var _namePlaceController = TextEditingController();

  var _experienceController = TextEditingController();

  var _numberPhoneController = TextEditingController();

  var _genderController = TextEditingController();

  var _detailController = TextEditingController();

  final  _key = GlobalKey<FormState>();

  final addJobsfromStore = store();

  @override
  void dispose() {
    super.dispose();
    _nameJobController.dispose();
    _namePlaceController.dispose();
    _experienceController.dispose();
    _numberPhoneController.dispose();
    _genderController.dispose();
    _numberPhoneController.dispose();
    _detailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).archiveTasks;
        return Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: _key,
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  defaultFormFile(
                    controller: _nameJobController,
                    lable: 'أسم الوظيفة',
                    prefix: Icons.title,

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultFormFile(
                    onTap: (){
                      showTaskCategoryDialog(size);
                    },
                    controller: _namePlaceController,
                    lable: 'مكان الوظيفة',
                    prefix: Icons.place_outlined,

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultFormFile(
                    // validator: (value){
                    //   if(value.isEmpty || value.lengh < 8){
                    //     return ' الرجاء ادخال رقم التواصل';
                    //   }
                    //   else {
                    //     return null;
                    //   }
                    // },
                    controller: _numberPhoneController,
                    lable: 'رقم التواصل',
                    prefix: Icons.whatsapp,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultFormFile(
                    controller: _experienceController,
                    lable: 'الخبرة ',
                    prefix: Icons.backpack_outlined,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultFormFile(
                    controller: _genderController,
                    lable: 'الجنس ',
                    prefix: Icons.transgender,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultFormFile(
                    controller: _detailController,
                    lable: 'التفاصيل',
                    prefix: Icons.details_outlined,
                    maxline: 7,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  defaultButton(
                    onpressed: () {
                      addJobsfromStore.addJobs(
                        Jobs(
                          nameJob: _nameJobController.text,
                          namePlace: _namePlaceController.text,
                          experience: _experienceController.text,
                          numberPhone: _numberPhoneController.text,
                          gender: _genderController.text,
                          detail: _detailController.text,
                        ),
                      );
                      //    Map<String, dynamic> dataUsers = {
                      //      'nameJob': nameJobController.text,
                      //      'namePlace': namePlaceController.text,
                      //      'experience': experienceController.text,
                      //      'numberPhone': numberPhoneController.text,
                      //      'gender': genderController.text,
                      //      'detail': detailController.text,
                      //    };
                      //    //add data base
                      // users.add(dataUsers);
                    },
                    text: 'OK',
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  void showTaskCategoryDialog(size) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Task category',
              style: TextStyle(color: Colors.pink.shade300, fontSize: 20),
            ),
            content: Container(
              width: size.width * 0.9,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: Constants.taskCategoryList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _namePlaceController.text =
                          Constants.taskCategoryList[index];
                        });
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_rounded,
                            color: Colors.red[200],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              Constants.taskCategoryList[index],
                              style: TextStyle(
                                  color: Color(0xFF00325A),
                                  fontSize: 20,
                                  // fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.canPop(context) ? Navigator.pop(context) : null;
                },
                child: Text('Close'),
              ),
            ],
          );
        });
  }
}
