import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>> fetchLeads() async {
  final firestore = FirebaseFirestore.instance;
  final leadsRef = firestore.collection('leadDetails');
  final leadsSnapshot = await leadsRef.get();

  List<Map<String, dynamic>> leads = [];

  if (leadsSnapshot.docs.isNotEmpty) {
    leads = leadsSnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id;  
      return data;
    }).toList();
  }

  print(leads);

  return leads;
}
