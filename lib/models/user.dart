class User {
  User(this.id, this.name, this.email, this.tel);

  int? id;
  String? name;
  String? email;
  String? tel;

	 factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'] as int?,
      json['name'] as String?,
      json['email'] as String?,
      json['tel'] as String?,
    );
  }
}
