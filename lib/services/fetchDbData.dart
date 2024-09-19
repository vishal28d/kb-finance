import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

Future<List<Map<String, dynamic>>> fetchLeads() async {
  try {
    final firestore = FirebaseFirestore.instance;
    final leadsRef = firestore.collection('leadDetails');

    // Fetch all documents
    final leadsSnapshot = await leadsRef.get();

    List<Map<String, dynamic>> leads = [];

    if (leadsSnapshot.docs.isNotEmpty) {
      leads = leadsSnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        return data;
      }).toList();
    }

    // Function to extract 'Start Date' from 'details' array
    DateTime extractStartDate(Map<String, dynamic> lead) {
      final details = lead['details'] as List<dynamic>;
      final startDateString = details.firstWhere(
        (detail) => detail.startsWith('Start Date: '),
        orElse: () => 'Start Date: 1970-01-01 00:00:00.000',
      ).substring('Start Date: '.length);
      
      return DateFormat('yyyy-MM-dd HH:mm:ss.SSS').parse(startDateString);
    }

    // Sort leads by 'Start Date'
    leads.sort((a, b) {
      DateTime dateA = extractStartDate(a);
      DateTime dateB = extractStartDate(b);

      return dateA.compareTo(dateB); // increasing order
    });

    print(leads);

    return leads;
  } catch (e) {
    print('Error fetching leads: $e');
    return [];
  }
}
