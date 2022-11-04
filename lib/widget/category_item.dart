import 'package:flutter/material.dart';
import 'package:jobs/component/constant.dart';
import 'package:jobs/layout/detail_category/detailCategory.dart';

class CategoryItem extends StatelessWidget {
  final String nomplace;
  final String image;
  final String numberJobs;
  final Function onTaps;
  //final AllJobsCategory category;
static const screenRouter = 'allJobsCategory';

   const CategoryItem({Key key, this.nomplace, this.image, this.numberJobs, this.onTaps,

  //  this.category
  })
      : super(key: key);
  void selectCategory(BuildContext context){
    Navigator.of(context).pushNamed(
        CategoryItem.screenRouter,
        arguments: {
          'nomplace' :nomplace,
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child:
            Image.network(image,fit: BoxFit.cover,
                height: 250,
                width: 250,
            ),
          ),
          Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  nomplace,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'وظائف',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    Text(
                      numberJobs,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
