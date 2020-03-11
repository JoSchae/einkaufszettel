import 'package:cloud_firestore/cloud_firestore.dart';

class Api {
  final Firestore _db = Firestore.instance;
  final String path;
  CollectionReference ref;

  Api(this.path) {
    ref = _db.collection(path);
  }

  Future<QuerySnapshot> getDataCollection() => ref.getDocuments();

  Stream<QuerySnapshot> streamDataCollection() => ref.orderBy("created").snapshots();

  Future<DocumentSnapshot> getDocumentById(String id) => ref.document(id).get();

  Future<void> removeDocument(String id) => ref.document(id).delete();

  Future<DocumentReference> addDocument(Map data) => ref.add(data);

  Future<void> updateDocument(Map data, String id) => ref.document(id).updateData(data);
}