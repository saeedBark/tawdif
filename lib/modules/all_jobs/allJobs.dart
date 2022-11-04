import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs/component/components.dart';
import 'package:jobs/component/constant.dart';
import 'package:jobs/models/item.dart';
import 'package:jobs/shared/cubit/cubit.dart';
import 'package:jobs/shared/cubit/states.dart';
import 'package:jobs/widget/Items.dart';

class AllJobsScreen extends StatelessWidget {
  CollectionReference users =
      FirebaseFirestore.instance.collection(kUsersCollection);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //   print(snapshot.data.docs[0]['numberPhone']);
          final jobs = snapshot.data.docs;
          List<Jobs> jobList = [];
          for (var job in jobs) {
           // final messgeid = messge.get('id');
            final messgeNomJob = job.get('nameJob');
            final messgeNomPlace = job.get('namePlace');
            final messgeexperience = job.get('experience');
            final messgenumberPhone = job.get('numberPhone');
            final messgegender = job.get('gender');
            final messgedetail = job.get('detail');
            final messgeWidget = Jobs(
             // id: messgeid,
              nameJob: messgeNomJob,
              namePlace: messgeNomPlace,
              experience: messgeexperience,
              numberPhone: messgenumberPhone,
              gender: messgegender,
              detail: messgedetail,
            );
            jobList.add(messgeWidget);
          }
          return Padding(
            padding: const EdgeInsets.all(40),
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => ItemWidget(
                userItem: jobList[index],
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 30,
              ),
              itemCount: jobList.length,
            ),
          );
        } else {
          return Text('Loading......');
        }
      },
    );
  }
}

// void getUsersStream() async {
//   await for (var snapshot
//       in FirebaseFirestore.instance.collection(kUsersCollection).snapshots()) {
//     for (var userMessage in snapshot.docs) {
//       print(userMessage.data());
//     }
//   }
// }

//   List<dynamic> itemList = [];
//   for(int i = 0 ; i < snapshot.data.docs.length ; i++)
//     {
//       itemList.add(Item.fromJson( snapshot.data.docs[i]));
//     }

//   BlocConsumer<AppCubit, AppState>(
//   listener: (context, state) {},
//   builder: (context, state) {
//     var tasks = AppCubit.get(context).newTasks;

//
//   },
// );
