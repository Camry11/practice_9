import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/models/User.dart';
import 'package:flutter_application_1/screens/UserDetailScreen.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

//объявление переменной списка с типом данных User
List<Users> usersList = [
  Users(
      age: 18,
      firstName: 'Привет',
      lastName: 'Андрей',
      phone: '85642534300',
      email: 'cglen@mail.ru',
      avatar:
          'https://sun9-west.userapi.com/sun9-14/s/v1/ig2/EU5gB0odIiS-zdRn6cqsI8K1onelTTnk-owO-O9cYQPm1HQvV09tnPMsdYyMwDuCX7WlruFIx7rl2sCCgh8-xmsM.jpg?size=200x200&quality=95&type=album'),
  Users(
      age: 18,
      firstName: 'Вадим',
      lastName: 'Олегович',
      phone: '777777',
      email: 'bar@mail.ru',
      avatar:
          'https://sun1.userapi.com/sun1-16/s/v1/ig2/bz1iQjf8PGje4qBNi5_A_oXf5tyCb6c0UK265Bkb36e9lQXEcrPqUcH8EgZac2B1YdkQAVYw7rEBY_9M0Jn6xRgr.jpg?size=400x400&quality=96&crop=861,7,1698,1698&ava=1'),
  Users(
      age: 16,
      firstName: 'Camry',
      lastName: '3.5',
      phone: 'Camry',
      email: 'Toyota@mail.ru',
      avatar:
          'https://sun2.sibirix.userapi.com/s/v1/ig2/ZVbNiyx13ymYDVmX61YtP2nD9gvtqgbFbcVMBMn7pN42pJVm4frQcZv5boy6qREZjfwxb_UVrACR6eBhaC3SJmpJ.jpg?size=1440x1920&quality=96&type=album'),
];

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: usersList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailScreen(
                    user: usersList[index],
                  ),
                ),
              );
            },
            child: Card(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 100.0,
                      width: 100.0,
                      child: usersList[index].avatar == ''
                          ? Image.network(
                              'http://i.mycdn.me/i?r=AzG9h-PeeFwI7g8EySOer1-5IaPpSz7hPLjY1DX2KoyJsUL8lfk1kn5YvpGmR5lwJWk')
                          : Image.network(usersList[index].avatar,
                              fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Имя: ' + usersList[index].firstName,
                            textAlign: TextAlign.left,
                          ),
                          Text('Фамилия: ' + usersList[index].lastName),
                          Text('Возраст: ' + usersList[index].age.toString()),
                          Text('Телефон: ' + usersList[index].phone),
                          Text('Почта: ' + usersList[index].email),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )),
          );
        });
  }
}
