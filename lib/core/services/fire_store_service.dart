import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/services/data_base_service.dart';

class FireStoreService implements DataBaseService{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(String path, Map<String, dynamic> data) async{
    await firestore.collection(path).add(data);
  }

}