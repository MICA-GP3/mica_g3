class Customer {
  int _id;
  String _username;
  String _fullname;
  String _ic;
  String _matricNo;
  int _phone;
  String _email;
  String _password;

  get id => this._id;
  set id(value) => this._id = value;

  get username => _username;
  set username(value) => _username = value;

  get fullname => _fullname;
  set fullname(value) => _fullname = value;

  get ic => _ic;
  set ic(value) => _ic = value;

  get matricNo => _matricNo;
  set matricNo(value) => _matricNo = value;

  get phone => _phone;
  set phone(value) => _phone = value;

  get email => _email;
  set email(value) => _email = value;

  get password => _password;
  set password(value) => _password = value;

  Customer({
    int id = 0,
    String username,
    String fullname,
    String ic,
    String matricNo,
    int phone,
    String email,
    String password,
  })  : _id = id,
        _username = username,
        _fullname = fullname,
        _ic = ic,
        _matricNo = matricNo,
        _phone = phone,
        _email = email,
        _password = password;
}
