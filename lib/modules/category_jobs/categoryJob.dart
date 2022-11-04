import 'package:flutter/material.dart';
import 'package:jobs/component/constant.dart';
import 'package:jobs/layout/detail_category/detailCategory.dart';
import 'package:jobs/models/item.dart';
import 'package:jobs/widget/Items.dart';
import 'package:jobs/widget/category_item.dart';
import '../../modules/all_jobs/allJobs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../component/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class CategoryScreen extends StatefulWidget {
  final CategoryItem cate;
  final Jobs userItem;
   final AllJobsCategory categor;
  static const screenRouter = 'allJobsCategory';
  final String nomplace;

  CategoryScreen({
    Key key,
    this.userItem,
    this.cate,
    this.userful,
    this.nomplace, this.categor,
  }) : super(key: key);
  final CategoryItem userful;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  CollectionReference users =
      FirebaseFirestore.instance.collection(kUsersCollection);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryScreen.screenRouter, arguments: {
      'nomplace': widget.nomplace,
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final cityName = snapshot.data.docs[0]['namePlace'];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 100, left: 7, right: 7, bottom: 30),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {

                              });

                              return selectCategory(context);
                            },
                            child: CategoryItem(
                              // onTaps: (){
                              //   return cate.selectCategory(context);
                              // },
                              nomplace: 'cairo',
                              image:
                                  'https://www.travellwd.com/wp-content/uploads/2022/01/tourism-in-Nouakchott-Mauritania.jpg',
                              numberJobs: '5',
                            ),
                          ),
                          CategoryItem(
                            nomplace: 'نواذيبوا',
                            image:
                                'https://mediaaws.almasryalyoum.com/news/large/2018/01/05/764272_0.jpg',
                            numberJobs: '15',
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CategoryItem(
                            nomplace: cityName,
                            image:
                                'https://www.aljazeera.net/wp-content/uploads/2014/11/a39db2ea-6287-40f1-b1a6-a9d7e26f6c71.jpeg?resize=686%2C513',
                            numberJobs: '14',
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7, right: 7),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          CategoryItem(
                            nomplace: cityName,
                            image:
                                'https://images.squarespace-cdn.com/content/v1/54810531e4b0eecc3c1a3cbc/1573849216742-TN1M0T26HYAUR75I6JDG/AdobeStock_199942193.png',
                            numberJobs: '5',
                          ),
                          CategoryItem(
                            nomplace: 'البرمجة',
                            image:
                                'https://abunawaf.com/wp-content/uploads/2020/03/learn-programming.jpg',
                            numberJobs: '12',
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CategoryItem(
                            nomplace: 'مطعم',
                            image:
                                'https://www.bayut.sa/blog/wp-content/uploads/2020/06/%D9%85%D8%B7%D8%B9%D9%85_%D8%B5%D9%8A%D9%86%D9%8AAR06032020-420x230.jpg',
                            numberJobs: '14',
                          ),
                        ],
                      )),
                ),
              ],
            ),
          );
        } else {
          return Text('Loading......');
        }
      },
    );
  }
}

//   StreamBuilder<QuerySnapshot>(
//   stream: users.snapshots(),
//   builder: (context, snapshot) {
//     if (snapshot.hasData) {
//       final cityName = snapshot.data.docs[0]['namePlace'];
//       // final messges = snapshot.data.docs;
//       // List<Jobs> messageList = [];
//       //
//       // for (var messge in messges) {
//       //   // final messgeid = messge.get('id');
//       //   final messgeNomJob = messge.get('nameJob');
//       //   final messgeNomPlace = messge.get('namePlace');
//       //   final messgeexperience = messge.get('experience');
//       //   final messgenumberPhone = messge.get('numberPhone');
//       //   final messgegender = messge.get('gender');
//       //   final messgedetail = messge.get('detail');
//       //   final messgeWidget = Jobs(
//       //     // id: messgeid,
//       //     nameJob: messgeNomJob,
//       //     namePlace: messgeNomPlace,
//       //     experience: messgeexperience,
//       //     numberPhone: messgenumberPhone,
//       //     gender: messgegender,
//       //     detail: messgedetail,
//       //   );
//       //   messageList.add(messgeWidget);
//       // }
//       return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 7),
//         child: InkWell(
//           onTap: () {
//             return selectCategory(context);
//           },
//           splashColor: Theme.of(context).primaryColor,
//           borderRadius: BorderRadius.circular(15),
//           child: Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(15),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 100, left: 7, right: 7, bottom: 30),
//                       child: SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: Row(
//                             children: <Widget>[
//                               CategoryItem(
//                                 nomplace: cityName,
//                                 image:
//                                     'https://www.travellwd.com/wp-content/uploads/2022/01/tourism-in-Nouakchott-Mauritania.jpg',
//                                 numberJobs: '5',
//                               ),
//                               CategoryItem(
//                                 nomplace: cityName,
//                                 image:
//                                     'https://mediaaws.almasryalyoum.com/news/large/2018/01/05/764272_0.jpg',
//                                 numberJobs: '12',
//                               ),
//                               SizedBox(
//                                 height: 30,
//                               ),
//                               CategoryItem(
//                                 nomplace: cityName ,
//                                 image:
//                                     'https://www.aljazeera.net/wp-content/uploads/2014/11/a39db2ea-6287-40f1-b1a6-a9d7e26f6c71.jpeg?resize=686%2C513',
//                                 numberJobs: '14',
//                               ),
//                             ],
//                           )),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 7, right: 7),
//                       child: SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: Row(
//                             children:  <Widget>[
//                               CategoryItem(
//                                 nomplace: cityName,
//                                 image:
//                                     'https://images.squarespace-cdn.com/content/v1/54810531e4b0eecc3c1a3cbc/1573849216742-TN1M0T26HYAUR75I6JDG/AdobeStock_199942193.png',
//                                 numberJobs: '5',
//                               ),
//                               CategoryItem(
//                                 nomplace: cityName,
//                                 image:
//                                     'https://abunawaf.com/wp-content/uploads/2020/03/learn-programming.jpg',
//                                 numberJobs: '12',
//                               ),
//                               SizedBox(
//                                 height: 30,
//                               ),
//                               CategoryItem(
//                                 nomplace: cityName,
//                                 image:
//                                     'https://www.bayut.sa/blog/wp-content/uploads/2020/06/%D9%85%D8%B7%D8%B9%D9%85_%D8%B5%D9%8A%D9%86%D9%8AAR06032020-420x230.jpg',
//                                 numberJobs: '14',
//                               ),
//                             ],
//                           )),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     } else {
//       return Text('Loading......');
//     }
//   },
// );

// BlocConsumer<AppCubit , AppState>(
//   listener: (context , state){},
//   builder: (context , state)
//   {
//     var tasks = AppCubit.get(context).doneTasks;
//     return Container();
//   },
// );



// final messges = snapshot.data.docs;
// List<Jobs> messageList = [];
//
// for (var messge in messges) {
//   // final messgeid = messge.get('id');
//   final messgeNomJob = messge.get('nameJob');
//   final messgeNomPlace = messge.get('namePlace');
//   final messgeexperience = messge.get('experience');
//   final messgenumberPhone = messge.get('numberPhone');
//   final messgegender = messge.get('gender');
//   final messgedetail = messge.get('detail');
//   final messgeWidget = Jobs(
//     // id: messgeid,
//     nameJob: messgeNomJob,
//     namePlace: messgeNomPlace,
//     experience: messgeexperience,
//     numberPhone: messgenumberPhone,
//     gender: messgegender,
//     detail: messgedetail,
//   );
//   messageList.add(messgeWidget);
// }