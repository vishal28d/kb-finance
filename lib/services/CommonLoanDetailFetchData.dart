import 'package:cloud_firestore/cloud_firestore.dart';

class CommonLoanDataFetcher {
  // Firestore collection reference
  final CollectionReference loanFormDetails = 
      FirebaseFirestore.instance.collection('LoanFormDetails');

         // Initialize lists for each loan status
      List<Map<String, dynamic>> pendingLoans = [];
      List<Map<String, dynamic>> rmAssignedLoans = [];
      List<Map<String, dynamic>> forVerificationLoans = [];
      List<Map<String, dynamic>> toCreditTeamLoans = [];
      List<Map<String, dynamic>> approvedLoans = [];
      List<Map<String, dynamic>> declinedLoans = [];
      List<Map<String, dynamic>> sanctionedLoans = [];
      List<Map<String, dynamic>> disbursedLoans = [];

  // Function to fetch all loan data and return a List<List<String>>
  Future<List<Map<String,dynamic>>> fetchAllLoanDetails() async {

       pendingLoans = [];
       rmAssignedLoans = [];
       forVerificationLoans = [];
       toCreditTeamLoans = [];
       approvedLoans = [];
       declinedLoans = [];
       sanctionedLoans = [];
       disbursedLoans = [];


    
    try {
      // Fetch all documents from the Firestore collection
      QuerySnapshot querySnapshot = await loanFormDetails.get();

      // Initialize an empty list to hold loan details for each document
      List<Map<String, dynamic>> allLoanDetails = [];

      // Iterate through the documents in the collection
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
         data["Document Id"] = doc.id; // Add document ID to the map

      String loanStatus = '';
            // Check if "Loan Status" key exists and retrieve its value
          
              loanStatus = data['Loan Status']; 
              // print(loanStatus) ;
              // print(data.containsKey('Loan Status')) ;


    // Append loan details to the corresponding list based on loan status
        switch (loanStatus) { 
          case 'Pending':
            pendingLoans.add(data);
            break;
          case 'RM Assigned':
            rmAssignedLoans.add(data);
            break;
          case 'For Verification':
            forVerificationLoans.add(data);
            break;
          case 'To Credit Team':
            toCreditTeamLoans.add(data);
            break;
          case 'Approved':
            approvedLoans.add(data);
            break;
          case 'Decline':
            declinedLoans.add(data);
            break;
          case 'Sanctioned':
            sanctionedLoans.add(data);
            break;
          case 'Disbursed':
            disbursedLoans.add(data);
            break;
          default: pendingLoans.add(data);
            break;
        }

        // Add the loan details of the current document to the list
        allLoanDetails.add(data);
      }

      print(allLoanDetails) ;

      return allLoanDetails; 
    } catch (e) {
      print("Error fetching loan details: $e");
      return [];
    }
  }
}
