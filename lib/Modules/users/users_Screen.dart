import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserModel
{
  final int id;
  final String name;
  final String phone;

  UserModel({
   @required this.id :0,
   @required this.name:'',
   @required this.phone:'',
  });
}

class UsersScreen extends StatelessWidget {
  List<UserModel>users =[
    UserModel(
      id: 1,
      name: 'Marwa',
      phone: '+1012548684',
    ),
    UserModel(
      id: 2,
      name: 'Marwa Alesh',
      phone: '+101254868524',
    ),
    UserModel(
      id: 3,
      name: 'Mohammad',
      phone: '+101254448684',
    ),
    UserModel(
      id: 4,
      name: 'Douaa',
      phone: '+155612548684',
    ),
    UserModel(
      id: 1,
      name: 'Marwa',
      phone: '+1012548684',
    ),
    UserModel(
      id: 2,
      name: 'Marwa Alesh',
      phone: '+101254868524',
    ),
    UserModel(
      id: 3,
      name: 'Mohammad',
      phone: '+101254448684',
    ),
    UserModel(
      id: 4,
      name: 'Douaa',
      phone: '+155612548684',
    ),
    UserModel(
      id: 3,
      name: 'Mohammad',
      phone: '+101254448684',
    ),
    UserModel(
      id: 4,
      name: 'Douaa',
      phone: '+155612548684',
    ),
    UserModel(
      id: 1,
      name: 'Marwa',
      phone: '+1012548684',
    ),
    UserModel(
      id: 2,
      name: 'Marwa Alesh',
      phone: '+101254868524',
    ),
    UserModel(
      id: 3,
      name: 'Mohammad',
      phone: '+101254448684',
    ),
    UserModel(
      id: 4,
      name: 'Douaa',
      phone: '+155612548684',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        shadowColor: Colors.green,
        elevation: 5.5,
        leading: Icon(
        Icons.menu,
        color:Colors.black,
    ),
    title:Text('Users' , style: TextStyle
    (
    color:Colors.black,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    ),
    ),

    ),
      body:
        ListView.separated(itemBuilder:(context ,index)=>buildUserItem(users[index]),
            separatorBuilder:(context ,index)=>
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 20,
                end: 20,
              ),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.greenAccent,
              ),
            ),
            itemCount: users.length,)
    );
  }
  Widget buildUserItem(UserModel user)=>Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 20,
          child: Text('${user.id}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),

        ),
        SizedBox(
          width: 20,
        ),
        Column(
          mainAxisSize:MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${user.name}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Text('${user.phone}',
              style: TextStyle(
                color:Colors.grey,

              ),
            )
          ],
        ),
      ],
    ),
  );

}
