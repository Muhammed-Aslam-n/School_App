import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import '../model/school.dart';
import '../utils/database_helper.dart';
import '../Pages/home.dart';
import '../Pages/editdetails.dart';
import '../Pages/fullldetail.dart';
import '../Pages/shortdetail.dart';

class EditDetails extends StatefulWidget {
  // const EditDetails({Key? key}) : super(key: key);
  final School? school;

  const EditDetails({
    Key? key,
    this.school,
  }) : super(key: key);


  @override
  _EditDetailsState createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  final _formKey = GlobalKey<FormState>();
  late String sName;
  late String sAge;
  late String sRoll;
  late String sMobile;
  late String image;


  @override
  void initState(){
    super.initState();
    sName = widget.school?.name ?? '';
    sAge = widget.school?.age ?? '';
    sRoll = widget.school?.rollnum ?? '';
    sMobile = widget.school?.mobile ?? '';
    // image = widget.
  }


  Widget userInputField(
      {String labelText = '',
      String hintText = '',
      IconData? icon,
      TextFormField? controllerName,required TextInputType keyType,
        required String? Function(String?) validator, initial }) {
    return SizedBox(
      child: TextFormField(
        controller: controllerName?.controller,
        keyboardType: keyType,
        validator: Validators.compose([
          Validators.required("This is Field is Required"),
          validator,
        ]),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          icon: Icon(icon),
          hintText: hintText,
          labelText: labelText,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 9, 87, 102),
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // resetControls() {
    //   print("Name : ${sName.text}");
    //   print("Age : ${sAge.text}");
    //   print("Roll number : ${sRoll.text}");
    //   print("Mobile : ${sMobile.text}");
    //   if (sName.text == '' ||
    //       sAge.text == '' ||
    //       sRoll.text == '' ||
    //       sMobile.text == '') {
    //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //         backgroundColor: Colors.white,
    //         content: Text('One or More Fields are Empty',
    //             style: TextStyle(
    //               color: Colors.red,
    //             ))));
    //   } else {
    //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //         backgroundColor: Colors.white,
    //         content: Text('Saved',
    //             style: TextStyle(
    //               color: Color.fromARGB(255, 9, 87, 102),
    //             ))));
    //     sName.text = '';
    //     sAge.text = '';
    //     sRoll.text = '';
    //     sMobile.text = '';
    //   }
    // }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(227, 222, 222, 1)),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(left: 50, top: 100),
              child: Text("Profile",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 50),
              child: Text("Update Profile",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300)),
            ),
            Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.only(left: 50, top: 50, right: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: TextFormField(
                        initialValue: sName,
                        keyboardType: TextInputType.name,
                        validator: (sName) => sName != null && sName.isEmpty ? 'The Name Must Be Filled ': null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (sName) => setState(() => this.sName = sName),
                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: "Full Name",
                          labelText: "Enter Name",
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 9, 87, 102),
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: TextFormField(
                        initialValue: sAge,
                        keyboardType: TextInputType.name,
                        validator: (sAge) => sAge != null && sAge.isEmpty ? 'The Name Must Be Filled ': null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (sAge) => setState(() => this.sAge = sAge),
                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: "Full Name",
                          labelText: "Enter Name",
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 9, 87, 102),
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: TextFormField(
                        initialValue: sRoll,
                        keyboardType: TextInputType.number,
                        validator: (sRoll) => sRoll != null && sRoll.isEmpty ? 'The Name Must Be Filled ': null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (sRoll) => setState(() => this.sRoll = sRoll),
                        decoration: InputDecoration(
                          icon: Icon(Icons.padding),
                          hintText: "Roll Number",
                          labelText: "Roll Number",
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 9, 87, 102),
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: TextFormField(
                        initialValue: sMobile,
                        keyboardType: TextInputType.phone,
                        validator: (sMobile) => sMobile != null && sMobile.isEmpty ? 'The Name Must Be Filled ': null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (sMobile) => setState(() => this.sMobile = sMobile),
                        decoration: InputDecoration(
                          icon: Icon(Icons.phone),
                          hintText: "Roll Number",
                          labelText: "Roll Number",
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 9, 87, 102),
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 50),
                      child: OutlinedButton(
                        onPressed: addOrUpdateNote,
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                color: Color.fromARGB(255, 9, 87, 102),
                                width: 1.0),
                            minimumSize: Size(230, 50)),
                        child: Text(
                          "Save",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 9, 87, 102)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void addOrUpdateNote() async{
    final  isValid = _formKey.currentState!.validate();

    if(isValid){
      final isUpdating = widget.school != null;

      if(isUpdating){
        await updateSchool();
      }else{

      }
    }
  }
}
