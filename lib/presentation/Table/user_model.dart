class UserModel {
  final String name;
  final String email;
  final String phone;
  final String address;
  bool selected;

  UserModel(
      {required this.name,
      required this.email,
      required this.phone,
      required this.address,
      this.selected = false});
}
