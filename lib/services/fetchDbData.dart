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
        Map<String, dynamic> data = doc.data();
        data['id'] = doc.id;
        return data;
      }).toList();
    }


    // Function to extract 'Start Date' from 'details' array
   DateTime extractStartDate(Map<String, dynamic> lead) {
  // Get 'Start Date' directly from the lead data
  final startDateString = lead['Start Date'] as String?;

  if (startDateString == null || startDateString.isEmpty) {
    // Provide a default date if 'Start Date' is not available
    return DateTime(1970, 1, 1);
  }

  // Parse the Start Date string
  return DateFormat('yyyy-MM-dd HH:mm:ss.SSS').parse(startDateString);
}


    // Sort leads by 'Start Date' (earliest date first)
    leads.sort((a, b) {
      DateTime dateA = extractStartDate(a);
      DateTime dateB = extractStartDate(b);
      print('$dateA -- $dateB') ;

      return dateA.compareTo(dateB); // Ascending order
    });

    print(leads);

    return leads;
  } catch (e) {
    print('Error fetching leads: $e');
    return [];
  }
}
