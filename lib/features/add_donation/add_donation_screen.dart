import 'package:flutter/material.dart';
import 'package:nafi3_project/core/utils/app_colors.dart';
import 'package:nafi3_project/core/widget/navbar.dart';

class AddDonationScreen extends StatefulWidget {
  const AddDonationScreen({super.key});

  @override
  State<AddDonationScreen> createState() => _AddDonationScreenState();
}

class _AddDonationScreenState extends State<AddDonationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor:AppColors.backgroundColor,
      appBar: AppBar(
     backgroundColor:AppColors.backgroundColor,
        title: Text(
          'Nafi3',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Publish Donation",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text("Share what you can spare with those who need it most."),
              SizedBox(height: 20),

              appuploadphoto(),
              SizedBox(height: 10),
              SizedBox(height: 10),
              Text(
                "Donation Tittle",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              apptexttittle(),
              SizedBox(height: 10),
              Text(
                "Category",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),

              SizedBox(height: 10),

              appdropdown(),
              SizedBox(height: 10),

              Text(
                "Description",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),

              SizedBox(height: 10),

              appdescription(),
              SizedBox(height: 10),

              Text(
                "Pick-Up Location",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              applocationfield(),
              SizedBox(height: 20),

              appelevatedbutton(),
              const SizedBox(height: 20),

              Text(
                "Thank you for your generosity! Your donation will be reviewed and published shortly.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 13, height: 1.5),
              ),
              const SizedBox(height: 22),
            ],
          ),
        ),
      ),

      bottomNavigationBar: const Navbar( currentIndex: 1,),
    );
  }

  /////////////////Custom Widget//////////////////////////////////////
  ////////////////////////////////////////////////////////////////////
  GestureDetector appuploadphoto() {
    return GestureDetector(
      onTap: null,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          height: 220,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.add_a_photo_outlined, size: 55),
              SizedBox(height: 10),
              Text("Tap to upload high-quality photo"),
              Text(
                "Max size 5MB (JPG, PNG)",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton appelevatedbutton() {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Donation published successfully 🎉"),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkgreen,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 66),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 5,
      ),
      child: const Text(
        "Publish Donation",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  TextFormField apptexttittle() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "e.g. Warm Winter Coat",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.green, width: 2),
        ),
      ),
    );
  }

  DropdownButtonFormField<String> appdropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: "Select Category",
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.green, width: 2),
        ),
      ),
      items: const [
        DropdownMenuItem(value: "Clothes", child: Text("Clothes")),
        DropdownMenuItem(value: "Food", child: Text("Food")),
        DropdownMenuItem(value: "Books", child: Text("Books")),
        DropdownMenuItem(value: "Medicine", child: Text("Medicine")),
        DropdownMenuItem(value: "Skills", child: Text("Skills")),
      ],
      onChanged: (value) {},
    );
  }

  TextFormField appdescription() {
    return TextFormField(
      maxLines: 5,
      decoration: InputDecoration(
        hintText:
            "Describe the condition, size, quantity or any important details...",
        alignLabelWithHint: true,
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.green, width: 2),
        ),
      ),
    );
  }

  TextFormField applocationfield() {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.location_on_outlined),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.green, width: 2),
        ),

        hintText: "Street address",
      ),
    );
  }
}