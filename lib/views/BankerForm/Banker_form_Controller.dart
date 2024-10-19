import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:credit_app/constants/listOfBanks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BankerFormController extends GetxController {
  // Controllers for TextFields
  var designationController = TextEditingController();
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var pincodeController = TextEditingController();
  var bankTextController = TextEditingController();

  // Observable variables for dropdown selections
  var selectedState = ''.obs;
  var selectedDistrict = ''.obs;

  var filteredBanks = <String>[].obs;
  var selectedBank = ''.obs;
  var yourEnteredBank = TextEditingController() ;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> insertBankersDetail() async {
  try {
    // Collecting values from controllers and observables
    String designation = designationController.text.trim();
    String fullName = fullNameController.text.trim();
    String email = emailController.text.trim();
    String pincode = pincodeController.text.trim();
    String bank = selectedBank.trim();
    
    String state = selectedState.value;
    String district = selectedDistrict.value;
    String selectedBankValue = selectedBank.value;

    // Check if all required fields are filled before inserting
    if (designation.isEmpty || fullName.isEmpty || email.isEmpty || pincode.isEmpty || 
        state.isEmpty || district.isEmpty || selectedBankValue.isEmpty) {
      Get.snackbar('Error', 'Please fill in all the required fields');
      return;
    }

    // Prepare the data to be inserted as a map
    Map<String, dynamic> bankersDetailData = {
      'designation': designation,
      'fullName': fullName,
      'email': email,
      'pincode': pincode,
      'state': state,
      'district': district,
      'selectedBank': selectedBankValue,
      'yourEnteredBank': yourEnteredBank.text ,
      'createdAt': FieldValue.serverTimestamp(),  
    };

    // Insert the data into the 'bankersDetail' collection
    await _firestore.collection('bankersDetail').add(bankersDetailData);

    // If successful, show a success message
    Get.snackbar('Success', 'Bankers detail added successfully!', backgroundColor: Colors.green[400]);
  } catch (e) {
    // In case of an error, show an error message
    Get.snackbar('Error', 'Failed to add bankers detail: $e');
  }
}



  // Lists for dropdown options
  List<String> ListOfAllBankss = [
    'Andhra Pradesh Grameena Vikas Bank',
    'Andhra Pragathi Grameena Bank',
    'American Express Bank',
    'Au Small Finance Bank',
    'Airtel Payments Bank',
    'Axis Bank',
    'Bangiya Gramin Vikash Bank',
    'Bandhan Bank',
    'Barclays Bank',
    'Bajaj Finance Ltd.',
    'Bank of Baroda',
    'Bank of India',
    'Bank of Maharashtra',
    'Canara Bank',
    'Capital Small Finance Bank',
    'Central Bank of India',
    'Citibank',
    'City Union Bank',
    'Corporation Bank',
    'DBS Bank',
    'DCB Bank',
    'Deutsche Bank',
    'Dhanlaxmi Bank',
    'Equitas Small Finance Bank',
    'ESAF Small Finance Bank',
    'Federal Bank',
    'Fullerton India Credit Company Ltd.',
    'HDFC Bank',
    'HDFC Ltd.',
    'HSBC',
    'ICICI Bank',
    'ICICI Home Finance Company Ltd.',
    'IDBI Bank',
    'IDFC FIRST Bank',
    'India Post Payments Bank',
    'IndusInd Bank',
    'Jammu & Kashmir Bank',
    'Jana Small Finance Bank',
    'Jio Payments Bank',
    'Karur Vysya Bank',
    'Karnataka Bank',
    'Kotak Mahindra Bank',
    'LIC Housing Finance Ltd.',
    'Manappuram Finance Ltd.',
    'Muthoot Finance Ltd.',
    'Nainital Bank',
    'NSDL Payments Bank',
    'Paytm Payments Bank',
    'PNB Housing Finance Ltd.',
    'Punjab National Bank',
    'Punjab & Sind Bank',
    'RBL Bank',
    'South Indian Bank',
    'Standard Chartered Bank',
    'State Bank of India',
    'Tata Capital Financial Services Ltd.',
    'Tamilnad Mercantile Bank',
    'UCO Bank',
    'Union Bank of India',
    'YES Bank'
  ];


List<String> nbfc = [
  'Bajaj Finance Ltd.',
  'HDFC Ltd.',
  'LIC Housing Finance Ltd.',
  'Muthoot Finance Ltd.',
  'Shriram Transport Finance Company Ltd.',
  'Manappuram Finance Ltd.',
  'PNB Housing Finance Ltd.',
  'ICICI Home Finance Company Ltd.',
  'Tata Capital Financial Services Ltd.',
  'Fullerton India Credit Company Ltd.',
];


  final List<String> states = [
    "Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh",
    "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jammu and Kashmir",
    "Jharkhand", "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra",
    "Manipur", "Meghalaya", "Mizoram", "Nagaland", "Orissa", "Punjab",
    "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura",
    "Uttar Pradesh", "Uttaranchal", "West Bengal", "Andaman and Nicobar Islands",
    "Chandigarh", "Dadra and Nagar Haveli", "Daman and Diu", "Delhi",
    "Lakshadweep", "Pondicherry"
  ];



 final Map<String, List<String>> districts = {
    "Andhra Pradesh": ["Anantapur", "Chittoor", "Cuddapah", "East Godavari", "Guntur", "Krishna", "Kurnool", "Nellore", "Prakasam", "Srikakulam", "Vishakapatnam", "Vizianagaram", "West Godavari"],
    "Arunachal Pradesh": ["Anjaw", "Changlang", "Dibang Valley", "East Kameng", "East Siang", "Kra Daadi", "Kurung Kumey", "Lohit", "Longding", "Lower Dibang Valley", "Lower Subansiri", "Namsai", "Papum Pare", "Siang", "Tawang", "Tirap", "Upper Siang", "Upper Subansiri", "West Kameng", "West Siang"],
    "Assam": ["Baksa", "Barpeta", "Bongaigaon", "Cachar", "Chirang", "Darrang", "Dhemaji", "Dhubri", "Dibrugarh", "Dima Hasao", "Goalpara", "Golaghat", "Hailakandi", "Jorhat", "Kamrup M", "Kamrup R", "Karbi Anglong", "Karimganj", "Kokrajhar", "Lakhimpur", "Marigaon", "Nagaon", "Nalbari", "Sibsagar", "Sonitpur", "Tinsukia", "Udalguri"],
    "Bihar": ["Araria", "Arwal", "Aurangabad", "Banka", "Begusarai", "Bhagalpur", "Bhojpur", "Buxar", "Darbhanga", "East Champaran", "Gaya", "Gopalganj", "Jamui", "Jehanabad", "Kaimur Bhabua", "Katihar", "Khagaria", "Kishanganj", "Lakhisarai", "Madhepura", "Madhubani", "Munger", "Muzaffarpur", "Nalanda", "Nawada", "Patna", "Purnia", "Rohtas", "Saharsa", "Samastipur", "Saran", "Sheikhpura", "Sheohar", "Sitamarhi", "Siwan", "Supaul", "Vaishali", "West Champaran"],
    "Chhattisgarh": ["Balod", "Baloda Bazar", "Balrampur", "Bastar", "Bemetra", "Bijapur", "Bilaspur", "Dantewada", "Dhamtari", "Durg", "Gariyaband", "Janjgir Champa", "Jashpur", "Kanker", "Kawardha", "Kondagaon", "Korba", "Koriya", "Mahasamund", "Mungeli", "Narayanpur", "Raigarh", "Raipur", "Rajnandgaon", "Sukma", "Surajpur", "Surguja"],
    "Goa": ["North Goa", "South Goa"],
    "Gujarat": ["Ahmedabad", "Amreli", "Anand", "Aravalli", "Banas Kantha", "Bharuch", "Bhavnagar", "Botad", "Chhotaudepur", "Dahod", "Devbhumi Dwarka", "Gandhinagar", "Gir Somnath", "Jamnagar", "Junagadh", "Kachchh", "Kheda", "Mahesana", "Mahisagar", "Morbi", "Narmada", "Navsari", "Panch Mahals", "Patan", "Porbandar", "Rajkot", "Sabar Kantha", "Surat", "Surendranagar", "Tapi", "The Dangs", "Vadodara", "Valsad"],
    "Haryana": ["Ambala", "Bhiwani", "Faridabad", "Fatehabad", "Gurgaon", "Hisar", "Jhajjar", "Jind", "Kaithal", "Karnal", "Kurukshetra", "Mahendragarh", "Mewat", "Palwal", "Panchkula", "Panipat", "Rewari", "Rohtak", "Sirsa", "Sonipat", "Yamunanagar"],
    "Himachal Pradesh": ["Bilaspur", "Chamba", "Hamirpur", "Kangra", "Kinnaur", "Kullu", "Lahul Spiti", "Mandi", "Shimla", "Sirmaur", "Solan", "Una"],
    "Jammu and Kashmir": ["Anantnag", "Badgam", "Bandipora", "Baramula", "Doda", "Ganderbal", "Jammu", "Kargil", "Kathua", "Kishtwar", "Kulgam", "Kupwara", "Leh Ladakh", "Poonch", "Pulwama", "Rajouri", "Ramban", "Reasi", "Samba", "Shopian", "Srinagar", "Udhampur"],
    "Jharkhand": ["Bokaro", "Chatra", "Deoghar", "Dhanbad", "Dumka", "Garhwa", "Giridih", "Godda", "Gumla", "Hazaribagh", "Jamtara", "Khunti", "Kodarma", "Latehar", "Lohardaga", "Pakaur", "Palamu", "Pashchimi Singhbhum", "Purbi Singhbhum", "Ramgarh", "Ranchi", "Sahibganj", "Saraikela", "Simdega"],
    "Karnataka": ["Bagalkote", "Bangalore Rural", "Bangalore Urban", "Belgaum", "Bellary", "Bidar", "Bijapur", "Chamrajnagar", "Chikkaballapur", "Chikmagalur", "Chitradurga", "Dakshina Kannada", "Davanagere", "Dharwad", "Gadag", "Gulbarga", "Hassan", "Haveri", "Kodagu", "Kolar", "Koppal", "Mandya", "Mysore", "Raichur", "Ramanagar", "Shimoga", "Tumkur", "Udupi", "Uttara Kannada", "Yadgir"],
    "Kerala": ["Alappuzha", "Ernakulam", "Idukki", "Kannur", "Kasaragod", "Kollam", "Kottayam", "KOZHIKKODE", "Malappuram", "Palakkad", "Pathanamthitta", "Thiruvananthapuram", "Thrissur", "Wayanad"],
    "Madhya Pradesh": ["Agar Malwa", "Alirajpur", "Anuppur", "Ashok Nagar", "Balaghat", "Barwani", "Betul", "Bhind", "Bhopal", "Burhanpur", "Chhatarpur", "Chhindwada", "Damoh", "Datia", "Dewas", "Dhar", "Dindori", "Guna", "Gwalior", "Harda", "Hoshangabad", "Indore", "Jabalpur", "Jhabua", "Katni", "Khandwa", "Khargone", "Mandla", "Mandsaur", "Morena", "Narsinghpur", "Neemuch", "Panna", "Raisen", "Rajgarh", "Ratlam", "Rewa", "Sagar", "Satna", "Sehore", "Seoni", "Shahdol", "Shajapur", "Sheopur", "Shivpuri", "Sidhi", "Singroli", "Tikamgarh", "Ujjain", "Umaria", "Vidisha"],
    "Maharashtra": ["Ahmednagar", "Akola", "Amravati", "Aurangabad", "Bhandara", "Bid", "Brihan Mumbai", "Buldana", "Chandrapur", "Dhule", "Gadchiroli", "Gondiya", "Hingoli", "Jalgaon", "Jalna", "Kolhapur", "Latur", "Nagpur", "Nanded", "Nandurbar", "Nashik", "Osmanabad", "Palghar", "Parbhani", "Pune", "Raigarh", "Ratnagiri", "Sangli", "Satara", "Sindhudurg", "Solapur", "Thane", "Wardha", "Washim", "Yavatmal"],
    "Manipur": ["Bishnupur", "Chandel", "Churachandpur", "Imphal East", "Imphal West", "Senapati", "Tamenglong", "Thoubal", "Ukhrul"],
    "Meghalaya": ["East Garo Hills", "East Jaintia Hills", "East Khasi Hills", "North Garo Hills", "Ri Bhoi", "South Garo Hills", "South West Garo Hills", "South West Khasi Hills", "West Garo Hills", "West Jaintia Hills", "West Khasi Hills"],
    "Mizoram": ["Aizawl East", "Aizawl West", "Champhai", "Kolasib", "Lawngtlai", "Lunglei", "Mamit", "Saiha", "Serchhip"],
    "Nagaland": ["Dimapur", "Kiphire", "Kohima", "Longleng", "Mokokchung", "Mon", "Peren", "Phek", "Tuensang", "Wokha", "Zunheboto"],
    "Orissa": ["Anugul", "Balangir", "Baleshwar", "Bargarh", "Baudh", "Bhadrak", "Cuttack", "Deogarh", "Dhenkanal", "Gajapati", "Ganjam", "Jagatsinghpur", "Jajapur", "Jharsuguda", "Kalahandi", "Kandhamal", "Kendrapara", "Keonjhar", "Khordha", "Koraput", "Malkangiri", "Mayurbhanj", "Nabarangapur", "Nayagarh", "Nuapada", "Puri", "Rayagada", "Sambalpur", "Sonapur", "Sundargarh"],
    "Punjab": ["Amritsar", "Barnala", "Bathinda", "Faridkot", "Fatehgarh Sahib", "Fazilka", "Firozpur", "Gurdaspur", "Hoshiarpur", "Jalandhar", "Kapurthala", "Ludhiana", "Mansa", "Moga", "Mohali SAS Nagar", "Muktsar", "Nawanshahr", "Pathankot", "Patiala", "Rupnagar", "Sangrur", "Tarn Taran"],
    "Rajasthan": ["Ajmer", "Alwar", "Banswara", "Baran", "Barmer", "Bharatpur", "Bhilwara", "Bikaner", "Bundi", "Chittaurgarh", "Churu", "Dausa", "Dhaulpur", "Dungarpur", "Ganganagar", "Hanumangarh", "Jaipur", "Jaisalmer", "Jalor", "Jhalawar", "Jhunjhunun", "Jodhpur", "Karauli", "Kota", "Nagaur", "Pali", "Pratapgarh", "Rajsamand", "Sawai Madhopur", "Sikar", "Sirohi", "Tonk", "Udaipur"],
    "Sikkim": ["East", "North", "South", "West"],
    "Tamil Nadu": ["Ariyalur", "Chennai", "Coimbatore", "Cuddalore", "Dharmapuri", "Dindigul", "Erode", "Kancheepuram", "Kanniyakumari", "Karur", "Krishnagiri", "Madurai", "Nagapattinam", "Namakkal", "Nilgiris", "Perambalur", "Pudukkottai", "Ramanathapuram", "Salem", "Sivaganga", "Thanjavur", "Theni", "Thiruvallur", "Thiruvarur", "Tiruchirappalli", "Tirunelveli", "Tirupur", "Tiruvanamalai", "Toothukudi", "Vellore", "Viluppuram", "Virudhunagar"],
    "Telangana": ["Adilabad", "Hyderabad", "Karim Nagar", "Khammam", "Mahbubnagar", "Medak", "Nalgonda", "Nizamabad", "Ranga Reddy", "Warangal Urban"],
    "Tripura": ["Dhalai", "Gomati", "Khowai", "North Tripura", "Sipahijala", "South Tripura", "Unakoti", "West Tripura"],
    "Uttar Pradesh": ["Agra", "Aligarh", "Allahabad", "Ambedkar Nagar", "Auraiya", "Azamgarh", "Bagpat", "Bahraich", "Ballia", "Balrampur", "Banda", "Barabanki", "Bareilly", "Basti", "Bijnor", "Budaun", "Bulandshahar", "C S M Nagar", "Chandauli", "Chitrakoot", "Deoria", "Etah", "Etawah", "Faizabad", "Farrukhabad", "Fatehpur", "Firozabad", "Gautam Buddha Nagar", "Ghaziabad", "Ghazipur", "Gonda", "Gorakhpur", "Hamirpur", "Hapur", "Hardoi", "Hathras", "Jalaun", "Jaunpur", "Jhansi", "Jyotiba Phule Nagar", "Kannauj", "Kanpur Dehat", "Kanpur Nagar", "Kashi Ram Nagar", "Kaushambi", "Kushinagar", "Lakhimpur Kheri", "Lalitpur", "Lucknow", "Maharajganj", "Mahoba", "Mainpuri", "Mathura", "Maunathbhanjan", "Meerut", "Mirzapur", "Moradabad", "Muzaffarnagar", "Pilibhit", "Pratapgarh", "Rae Bareli", "Rampur", "Saharanpur", "Sambhal", "Sant Kabir Nagar", "Sant Ravidas Nagar", "Shahjahanpur", "Shamli", "Shrawasti", "Siddharth Nagar", "Sitapur", "Sonbhadra", "Sultanpur", "Unnav", "Varanasi"],
    "Uttaranchal": ["Almora", "Bageshwar", "Chamoli", "Champawat", "Dehradun", "Garhwal", "Hardwar", "Nainital", "Pithoragarh", "Rudraprayag", "Tehri Garhwal", "Udham Singh Nagar", "Uttarkashi"],
    "West Bengal": ["Alipurduar", "Bankura", "Barddhaman", "Birbhum", "Dakshin Dinajpur", "Darjiling", "Haora", "Hugli", "Jalpaiguri", "Koch Bihar", "Maldah", "Murshidabad", "Nadia", "North Twenty Four Parganas", "Paschim Medinipur", "Purba Medinipur", "Puruliya", "South Twenty Four Parganas", "Uttar Dinajpur"],
    "Andaman and Nicobar Islands": ["Nicobar", "North and Middle Andaman", "South Andaman"],
    "Chandigarh": ["Chandigarh"],
    "Dadra and Nagar Haveli": ["Dadra and Nagar Haveli"],
    "Daman and Diu": ["Daman", "Diu"],
    "Delhi": ["Central", "East", "New Delhi", "North", "North East", "North West", "Shahdara", "South", "South East", "South West", "West"],
    "Lakshadweep": ["Lakshadweep"],
    "Pondicherry": ["Karaikal", "Mahe", "Pondicherry", "Yanam"],
  }.obs;


  int binarySearch(List<String> sortedList, String query) {
  int low = 0;
  int high = sortedList.length - 1;

  while (low <= high) {
    int mid = (low + high) ~/ 2;
    String midValue = sortedList[mid].toLowerCase();

    if (midValue.startsWith(query.toLowerCase())) {
      // Found a match, return the starting index
      return mid;
    } else if (midValue.compareTo(query.toLowerCase()) < 0) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }
  return -1; // No match found
}


List<String> ListOfAllBanks = ListOfBanks().ListOfBank ;


 void filterBanks(String query) {
  // Sort the banks list first if not already sorted
 
  int startIndex = binarySearch(ListOfAllBanks, query);

  // If a match is found, filter banks starting from the matched index
  if (startIndex != -1) {
    List<String> matchedBanks = [];
    for (int i = startIndex; i < ListOfAllBanks.length; i++) {
      if (ListOfAllBanks[i].toLowerCase().startsWith(query.toLowerCase())) {
        matchedBanks.add(ListOfAllBanks[i]);
      } else {
        break; // Stop once banks no longer match the query
      }
    }
    filteredBanks.value = matchedBanks;
  } else {
    filteredBanks.value = []; // No matches found
  }
}


  // Validation for form submission
  bool isFormValid() {
    return selectedBank.isNotEmpty &&
        fullNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        selectedState.isNotEmpty &&
        selectedDistrict.isNotEmpty &&
        pincodeController.text.isNotEmpty;
  }

  // Clear form inputs
  void clearForm() {
    designationController.clear();
    fullNameController.clear();
    emailController.clear();
    pincodeController.clear();
    selectedBank.value = '';
    selectedState.value = '';
    selectedDistrict.value = '';
  }



}
