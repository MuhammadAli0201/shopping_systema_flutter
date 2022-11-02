import 'package:asg12_shoping_system/Modules/Model/User.dart';
import 'package:get/get.dart';

class signInController {
  RxList<User> users = <User>[
    User(email: "abc@gmail.com".obs, password: "12345678".obs),
    User(email: "abcd@gmail.com".obs, password: "12345678".obs),
    User(email: "test@gmail.com".obs, password: "12345678".obs),
    User(email: "test1@gmail.com".obs, password: "12345678".obs),
    User(email: "ali@gmail.com".obs, password: "12345678".obs),
  ].obs;

  bool? signIn(User user) {
    var temp;
    for (int i = 0; i < users.length; i++) {
      if (users[i].email == user.email&&users[i].password==user.password) {
        temp= true;
        break;
      } else {
        temp= false;
      }
    }
    return temp;
  }
}
