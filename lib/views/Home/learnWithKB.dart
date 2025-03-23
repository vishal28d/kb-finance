import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart'; // Import InAppWebView

class WebViewScreen extends StatefulWidget {
  final String url;
  final String title;

  WebViewScreen({required this.url, required this.title});

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  InAppWebViewController? webViewController;
  bool isLoading = true; // To show a loading spinner

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest:
                URLRequest(url: WebUri.uri(Uri.parse(widget.url))),
            onWebViewCreated: (controller) {
              webViewController = controller;
            },
            onLoadStop: (controller, url) async {
              setState(() {
                isLoading =
                    false; // Stop showing the loading indicator once the page is loaded
              });
            },
            onLoadStart: (controller, url) {
              setState(() {
                isLoading = true; // Show loading when a page starts loading
              });
            },
          ),
          if (isLoading)
            Center(child: CircularProgressIndicator()), // Loading spinner
        ],
      ),
    );
  }
}

class LearnWithKb extends StatelessWidget {
  final List<String> loanNames = [
    'Loan Documents',
    'How to Sell Loans',
    'How to DL Statement',
    'How to Read Docs'
  ];

  final List<String> iconList = [
    'assets/loan_icons/loan_document.png',
    'assets/loan_icons/sell_loan.png',
    'assets/loan_icons/demand_loan.png',
    'assets/loan_icons/read_docs.png',
  ];

  final List<String> urlList = [
    'https://kbfinance.in/blog/', // Blogs
    'https://kbfinance.in/educational-videos/', // Educational Videos
    'https://kbfinance.in/faqs/', // FAQs
    'https://kbfinance.in/job-openings/' // Career
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        color: Color(0xFFC63437),
        margin: EdgeInsets.only(top: 0, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 5),
              child: Text(
                'Learn With KB',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 25),
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisSpacing: 0,
                mainAxisSpacing: 20,
                crossAxisCount: 4,
                children: List.generate(
                  loanNames.length,
                  (index) => GestureDetector(
                    onTap: () {
                      // Navigate to WebViewScreen on tap
                      Get.to(
                        () => WebViewScreen(
                          url: urlList[index],
                          title: loanNames[index],
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          margin: EdgeInsets.only(left: 1, right: 1),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey.shade500,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: 10, right: 10, top: 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 1, vertical: 1),
                                  width: 32,
                                  child: Image.asset(
                                    iconList[index %
                                        iconList
                                            .length], // Reusing icons cyclically
                                    height: 45,
                                    // color: Color(0xFFC63437), // Applying color to SVG icons
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Expanded(
                          child: Container(
                            child: Text(
                              '${loanNames[index]}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
