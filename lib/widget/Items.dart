import 'package:flutter/material.dart';
import 'package:jobs/models/item.dart';

class ItemWidget  extends StatelessWidget {

final Jobs userItem ;

  const ItemWidget({Key key, this.userItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {

      return Container(
        width: 300,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            children: [
              Text(userItem.nameJob,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(height: 5,),
              Row(
                children: [
                  Icon(
                    Icons.place_outlined,
                  ),
                  SizedBox(width: 5,),
                  Text(userItem.namePlace),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Icon(Icons.backpack_outlined),
                  SizedBox(width: 5,),
                  Text(userItem.experience),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Icon(Icons.transgender),
                  SizedBox(width: 5,),
                  Text(userItem.gender),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Icon(Icons.whatsapp),
                  SizedBox(width: 5,),
                  Text(userItem.numberPhone),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Icon(Icons.details_outlined),
                  SizedBox(width: 5,),
                  Text(userItem.detail),
                ],
              ),

            ],
          ),
        ),
      );
    }
  }

