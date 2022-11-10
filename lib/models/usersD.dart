class UsersD {
  late String name;
  late int phoneNumber;
  late String? firebaseId;

UsersD({
  required this.name,
  required this.phoneNumber,
  required this.firebaseId,
});

factory UsersD.fromFirebase(String id, Map map) {
final usersD = UsersD(
  name: map['Name'] ?? '-',
  phoneNumber: (map['Phone number'] ?? 0),
  firebaseId: (map['Phone number'] ?? 0),


);
usersD.firebaseId = id;
return usersD;
}
}

