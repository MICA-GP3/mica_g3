class Customer {
  int _id;
  String _username;
  String _fullname;
  String _ic;
  String _matricNo;
  String _phone;
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
    required String username,
    required String fullname,
    required String ic,
    required String matricNo,
    required String phone,
    required String email,
    required String password,
  })  : _id = id,
        _username = username,
        _fullname = fullname,
        _ic = ic,
        _matricNo = matricNo,
        _phone = phone,
        _email = email,
        _password = password;

  Customer.copy(Customer from)
      : this(
            id: from.id,
            username: from.username,
            fullname: from.fullname,
            ic: from.ic,
            matricNo: from.matricNo,
            phone: from.phone,
            email: from.email,
            password: from.password);

  Customer.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _username = json['username'],
        _fullname = json['fullname'],
        _ic = json['ic'],
        _matricNo = json['matricNo'],
        _phone = json['phone'],
        _email = json['email'],
        _password = json['password'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'fullname': fullname,
        'ic': ic,
        'matricNo': matricNo,
        'phone': phone,
        'email': email,
        'password': password
      };
}
