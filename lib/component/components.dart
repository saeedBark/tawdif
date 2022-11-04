import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jobs/component/constant.dart';
import 'package:jobs/models/item.dart';
import 'package:jobs/widget/Items.dart';
import 'package:jobs/widget/category_item.dart';

Widget defaultFormFile({
  TextEditingController controller,
  Function onsubmit,
  Function validator,
  String lable,
  Function onTap,
  TextInputType type,
  IconData prefix,
  bool enable = true,
  TextStyle style,
  int maxline,
}) =>
    TextFormField(
      style: style,
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onsubmit,
      validator: validator,
      onTap: onTap,
      enabled: enable,
      maxLines: maxline,
      decoration: InputDecoration(
        labelText: lable,
        prefixIcon: Icon(prefix),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

////////////////////////////////
Widget defaultButton({
  Color color = Colors.blue,
  double width = double.infinity,
  double raduis = 0,
  bool isUpperCase = true,
  Function() onpressed,
  @required String text,
}) {
  return Container(
    height: 50,
    width: width,
    child: MaterialButton(
      onPressed: onpressed,
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        style: TextStyle(color: Colors.white),
      ),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: color,
    ),
  );
}

/////////////////////////

////////////////////////
Widget MyDiver() => Container(

  height: 5,

);
////////////////////////////

void slectCatee(String image,String number,String place) {
  CategoryItem(
    nomplace: place,
    image:
    image,
    numberJobs: number,
  );
}

/////////////////
class store {
  CollectionReference users =
  FirebaseFirestore.instance.collection(kUsersCollection);

  addJobs( Jobs job){
    users.add(
        {
          'nameJob': job.nameJob,
          'namePlace': job.namePlace,
          'experience': job.experience,
          'numberPhone': job.numberPhone,
          'gender': job.gender,
          'detail': job.detail,
        });
  }
}
/////////////////////////
