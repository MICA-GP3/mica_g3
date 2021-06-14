import 'package:flutter/material.dart';
import 'package:hasta_rental/models/customer.dart';

import 'customer_profile.dart';

class CustomerVM extends CustomerProfile {
  void _editProfile(BuildContext context, int index) async {
    final _editProf = CustomerProfile(
      isEditing: true,
    );
    var _update = await Navigator.push(
        context,
        CustomerProfile.route(
          isEditing: true,
          data: _editProf.data,
        ));
    if (_update != null) {}
  }
}
