import 'package:cloud_firestore/cloud_firestore.dart';

class CommonLoanDataFetcher {
  // Firestore collection reference
  final CollectionReference loanFormDetails = 
      FirebaseFirestore.instance.collection('LoanFormDetails');

         // Initialize lists for each loan status
      List<List<String>> pendingLoans = [];
      List<List<String>> rmAssignedLoans = [];
      List<List<String>> forVerificationLoans = [];
      List<List<String>> toCreditTeamLoans = [];
      List<List<String>> approvedLoans = [];
      List<List<String>> declinedLoans = [];
      List<List<String>> sanctionedLoans = [];
      List<List<String>> disbursedLoans = [];

  // Function to fetch all loan data and return a List<List<String>>
  Future<List<List<String>>> fetchAllLoanDetails() async {

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
      List<List<String>> allLoanDetails = [];

      // Iterate through the documents in the collection
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        // Convert the Map<String, dynamic> to a List<String>
        List<String> loanDetails = [
          "${data['name'] ?? 'N/A'}",
          "${data['mobile'] ?? 'N/A'}",
          "${data['email'] ?? 'N/A'}",
          "${data['alternateMobile'] ?? 'N/A'}",
          "${data['loanAmount'] ?? 'N/A'}",
          "${data['maritalStatus'] ?? 'N/A'}",
          "${data['currentAddress'] ?? 'N/A'}",
          "${data['currentPin'] ?? 'N/A'}",
          "${data['currentLandmark'] ?? 'N/A'}",
          "${data['houseType'] ?? 'N/A'}",
          "${data['SpouseName'] ?? 'N/A'}",
          "${data['SpouseMobile'] ?? 'N/A'}",
          "${data['yearsAtCity'] ?? 'N/A'}",
          "${data['ownershipStatus'] ?? 'N/A'}",
          "${data['permanentAddress'] ?? 'N/A'}",
          "${data['permanentLandmark'] ?? 'N/A'}",
          "${data['permanentPin'] ?? 'N/A'}",
          "${data['selectedReligion'] ?? 'N/A'}",
          "${data['selectedLoanType'] ?? 'N/A'}",
          "${data['permanentSquareFeet'] ?? 'N/A'}", //19
          "${data['loanStatus'] ?? 'N/A'}",
          doc.id, 
          "${data['SpouseDob'] ?? 'N/A'}",    //22
          "${data['motherName'] ?? 'N/A'}",
          "${data['nomineeDob'] ?? 'N/A'}",
          "${data['nomineeName'] ?? 'N/A'}",
          "${data['nomineeRelation'] ?? 'N/A'}",
          "${data['permanentOwnershipStatus'] ?? 'N/A'}",
          "${data['permanentYearsAtCity'] ?? 'N/A'}",
          "${data['selectedCaste'] ?? 'N/A'}", //29
          "${data['createdBy'] ?? 'N/A'}",

        ];


         // Append loan details to the corresponding list based on loan status
        switch (loanDetails[20]) { 
          case 'Pending':
            pendingLoans.add(loanDetails);
            break;
          case 'RM Assigned':
            rmAssignedLoans.add(loanDetails);
            break;
          case 'For Verification':
            forVerificationLoans.add(loanDetails);
            break;
          case 'To Credit Team':
            toCreditTeamLoans.add(loanDetails);
            break;
          case 'Approved':
            approvedLoans.add(loanDetails);
            break;
          case 'Decline':
            declinedLoans.add(loanDetails);
            break;
          case 'Sanctioned':
            sanctionedLoans.add(loanDetails);
            break;
          case 'Disbursed':
            disbursedLoans.add(loanDetails);
            break;
          default: pendingLoans.add(loanDetails);
            break;
        }

        // Add the loan details of the current document to the list
        allLoanDetails.add(loanDetails);
      }

      return allLoanDetails; // Return a list of loan details for all documents
    } catch (e) {
      print("Error fetching loan details: $e");
      return [];
    }
  }
}
