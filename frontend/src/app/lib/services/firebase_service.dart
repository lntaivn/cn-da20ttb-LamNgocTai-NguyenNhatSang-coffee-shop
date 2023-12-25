// class FirebaseService {
//   final databaseReference = FirebaseDatabase.instance.reference();

//   Future<List<Map<String, dynamic>>> getTableData() async {
//     DataSnapshot snapshot = await databaseReference.child('Table').once();
//     List<Map<String, dynamic>> data = [];
//     Map<dynamic, dynamic> values = snapshot.value;
//     if (values != null) {
//       values.forEach((key, value) {
//         data.add({'table_id': key, 'table_name': value['table_name']});
//       });
//     }
//     return data;
//   }
// }
