
import 'package:credit_app/views/BankerForm/Banker_form_Controller.dart';
import 'package:credit_app/views/Login/register.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BankerFormScreen extends GetView<BankerFormController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Banker Information'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Select Bank TextFieldSearch
            SizedBox(height: 5,),

            Text('In Which Company You are Working?', style: Theme.of(context).textTheme.bodyLarge),
            TextField(
              controller: controller.bankTextController,
              onChanged: (query) {
              // Call the function to filter the banks when text changes
              controller.filterBanks(query);

              // Clear the selected bank if the user is typing something else
              if (query.isEmpty) {
                controller.selectedBank.value = '';
              }
            },
          decoration: InputDecoration(
            labelText: "Search Bank or NBFC",
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 4),

     
// Display the filtered results
Obx(() {
  // Show the SizedBox only if there are filtered results or the user is typing
  if (controller.filteredBanks.isEmpty &&
      controller.bankTextController.text.isNotEmpty) {
    return const SizedBox(height: 4); 
  }

  // If no filtered banks and no text, don't display anything
  if (controller.filteredBanks.isEmpty && controller.bankTextController.text.isEmpty) {
    return SizedBox(); // Nothing to display
  }

  return SizedBox(
    height: 200,
    child: Obx(() {
      // Show the ListView only if no bank is selected
      if (controller.selectedBank.value.isEmpty) {
        return ListView.builder(
          itemCount: controller.filteredBanks.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.filteredBanks[index]),
              onTap: () {
                // Update the selected bank and set the text field's value
                controller.selectedBank.value = controller.filteredBanks[index];
                controller.bankTextController.text = controller.filteredBanks[index];

                // Clear the filter once the bank is selected
                controller.filteredBanks.clear();
              },
            );
          },
        );
      } else {
        // If a bank is selected, hide the list
        return SizedBox(); // Hide ListView
      }
    }),
  );
}),

          SizedBox(height: 10),
            Obx(() {
                return (controller.selectedBank.value == 'OTHER' || controller.selectedBank.value=='OTHER '  )
                  ? TextField(
                      controller: controller.yourEnteredBank  ,
                      decoration: InputDecoration(
                        labelText: 'Enter your company name.',
                        border: OutlineInputBorder(),
                      ),
                    )
                  : SizedBox.shrink();  // This ensures that nothing is rendered when the condition is false
              }),

          SizedBox(height: 10,) ,

          // Display the selected bank
          Obx(() => Text(
            "Selected Bank: ${controller.selectedBank.value}",
            style: TextStyle(fontSize: 16, color:  Colors.black45),
          )),
          SizedBox(height: 10),

              // Designation Input
              Text('Enter your designation ?', style: Theme.of(context).textTheme.bodyLarge),
              TextField(
                controller: controller.designationController,
                decoration: InputDecoration(
                  labelText: 'Designation',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              // Full Name Input
              Text('Enter your full name.', style: Theme.of(context).textTheme.bodyLarge),
              TextField(
                controller: controller.fullNameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              // Email ID Input
              Text('Enter Email Id', style: Theme.of(context).textTheme.bodyLarge),
              TextField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  labelText: 'Email ID',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              // Select State Dropdown

              Text('Select State', style: Theme.of(context).textTheme.bodyLarge),
              Obx(
                () => DropdownButtonFormField<String>(
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                  value: controller.selectedState.value.isEmpty
                      ? null
                      : controller.selectedState.value,
                  hint: Text("Select State"),
                  onChanged: (newValue) {
                    controller.selectedState.value = newValue!;
                    controller.selectedDistrict.value =
                        ''; // Reset district when state changes
                  },
                  items: controller.states.map((state) {
                    return DropdownMenuItem(
                      value: state,
                      child: Text(state),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 16),
              // Select District Dropdown (based on selected state)
              Text('Select District', style: Theme.of(context).textTheme.bodyLarge),
              Obx(() {
                // Only show this dropdown if a state is selected
                if (controller.selectedState.value.isNotEmpty) {
                  return DropdownButtonFormField<String>(
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                    value: controller.selectedDistrict.value.isEmpty
                        ? null
                        : controller.selectedDistrict.value,
                    hint: Text("Select District"),
                    onChanged: (newValue) {
                      controller.selectedDistrict.value = newValue!;
                    },
                    items: controller
                        .districts[controller.selectedState.value]!
                        .map((district) {
                      return DropdownMenuItem(
                        value: district,
                        child: Text(district),
                      );
                    }).toList(),
                  );
                }
                return SizedBox.shrink(); // Don't show anything if no state is selected
              }),
              SizedBox(height: 16),
              // Pincode Input
              Text('Enter PinCode', style: Theme.of(context).textTheme.bodyLarge),
              TextField(
                controller: controller.pincodeController,
                decoration: InputDecoration(
                  labelText: 'Pincode',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              // Submit Button
              Center(
                child: PrimaryTextButton(
                  voidCallback: () {
                    if (controller.isFormValid()) {
                      
                    controller.insertBankersDetail() ;
                  
                      Get.to(() => RegistrationScreen());

                      controller.clearForm();
                    } else {
                      Get.snackbar("Error", "Please fill all fields",
                          backgroundColor: Colors.red[400]);
                    }
                  },
                  text: "Submit",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
