import 'dart:developer';

import 'rest_service.dart';
import '../models/customer.dart';

class CustomerService {
  static Future<Customer> getUserByLoginAndPassword(
      {String login, String password}) async {
    final logins = await Rest.get('users?username=$login&password=$password');
    //not finish
    var show = logins.map((json) => Customer.fromJson(json)).toList();
    //print(show[0].id);
    //print('show N= ${show[0].name}');

    if (show.length != 0) {
      return Customer(
          id: show[0].id,
          username: show[0].username,
          fullname: show[0].fullname,
          ic: show[0].ic,
          matricNo: show[0].matricNo,
          phone: show[0].phone,
          email: show[0].email,
          password: show[0].password); //
    } else {
      return null;
    }
  }
}
