

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jobs/component/components.dart';
import 'package:jobs/component/constant.dart';
import 'package:jobs/models/item.dart';
import 'package:jobs/widget/Items.dart';
import 'package:jobs/widget/streamBulider.dart';

class AllJobsCategory extends StatefulWidget {
final String categoryItmes;
  final String Categoryes;
  final String place;

  AllJobsCategory({Key key, this.Categoryes, this.place, this.categoryItmes}) : super(key: key);

  @override
  State<AllJobsCategory> createState() => _AllJobsCategoryState();
}

class _AllJobsCategoryState extends State<AllJobsCategory> {
  CollectionReference users =
      FirebaseFirestore.instance.collection(kUsersCollection);

  List<Jobs> userss;

  @override
  Widget build(
    BuildContext context,
  ) {
    // final argemntCategory =
    //     ModalRoute.of(context).settings.arguments as Map<String, String>;
    // final Categorynameplace = argemntCategory['nomplace'];

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            //Categorynameplace,
            ('welcome'),
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: users.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //   print(snapshot.data.docs[0]['numberPhone']);
              final messges = snapshot.data.docs;
              List<Jobs> messageList = [];
              for (var messge in messges) {
                //    if(messge['nomplace'] == 'نواكشوط') {
                // final messgeid = messge.get('id');
                final messgeNomJob = messge.get('nameJob');
                final messgeNomPlace = messge.get('namePlace');
                final messgeexperience = messge.get('experience');
                final messgenumberPhone = messge.get('numberPhone');
                final messgegender = messge.get('gender');
                final messgedetail = messge.get('detail');
                final messgeWidget = Jobs(
                  // id: messgeid,
                  nameJob: messgeNomJob,
                  namePlace: messgeNomPlace,
                  experience: messgeexperience,
                  numberPhone: messgenumberPhone,
                  gender: messgegender,
                  detail: messgedetail,
                );
                messageList.add(messgeWidget);
                //  }

                userss = [...messageList];
                messageList.clear();
                for (var jobsCategory in userss) {
                  if (jobsCategory.namePlace == 'نواكشوط') {
                    messageList.add(jobsCategory);
                  }
                }
              }
              return Padding(
                padding: const EdgeInsets.all(40),
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => ItemWidget(
                    userItem: messageList[index],
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 30,
                  ),
                  itemCount: messageList.length,
                ),
              );
            } else {
              return Text('Loading......');
            }
          }),
    );
  }
}
