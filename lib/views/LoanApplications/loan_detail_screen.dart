import 'dart:io';
import 'package:credit_app/views/LoanApplications/viewDocumentScreen.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoanDetailScreen extends StatelessWidget {
  final TabController? _tabController;
  final File? photo;
  final Map<String, dynamic> loanDetails;

  LoanDetailScreen({Key? key, required this.loanDetails})
      : _tabController = null,
        photo = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define the document links for the uploaded documents
    List<Map<String, String>> documentLinks = [] ;
       // Iterate through each key in loanDetails
        loanDetails.forEach((loanDetailKey, loanDetailValue) {
          
          if (loanDetailValue is String && loanDetailValue.startsWith('https')) {
          
            documentLinks.add({
              "title": loanDetailKey, 
              "value": loanDetailValue
            });
          }
        });


    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: MyCustomAppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        height: 80,
        appbarPadding: 0,
        title: Text('Loan Detail'),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.grey,
              labelColor: Theme.of(context).primaryColor,
              labelStyle: Theme.of(context).textTheme.headlineSmall,
              tabs: [
                Tab(child: Text('Basic Details')),
                Tab(child: Text('Uploaded Documents')),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Build the ListView for loan details
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: loanDetails.length,
                            itemBuilder: (context, index) {
                              // Get the loan detail key and value
                              final loanDetailKey = loanDetails.keys.elementAt(index);
                              final loanDetailValue = loanDetails[loanDetailKey] ?? 'N/A';

                              // Skip empty values
                            if (loanDetailValue.isEmpty || (loanDetailValue is String && loanDetailValue.startsWith('https') || loanDetailKey== 'Document Id' )) {
                              return SizedBox.shrink(); 
                            }

                              return Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      loanDetailKey,
                                      style: Theme.of(context).textTheme.headlineSmall,
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(left: 0, top: 5),
                                      child: Text(
                                        loanDetailValue,
                                        style: Theme.of(context).primaryTextTheme.titleLarge,
                                      ),
                                    ),
                                  ),
                                  Divider(height: 1, thickness: 1),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Pass document links to DocumentView
                  DocumentView(documentLinks: documentLinks),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
