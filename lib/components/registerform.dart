import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:smartdnd/utilities/registrationform.dart';

class RegisterForm extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return UserRegistrationForm();
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class UserRegistrationForm extends StatefulWidget {
  const UserRegistrationForm({super.key});

  @override
  UserRegistrationFormState createState() {
    return UserRegistrationFormState();
  }
}

class UserRegistrationFormState extends State<UserRegistrationForm> {
  FormGroup registrationForm = form;

  //go to home page if logged in
  void isLoggedIn() {
    // MaterialPageRoute(builder: (context) => MyHomePage(title: "SmartDND"));
    Navigator.pushNamed(context, '/home');
    Navigator.pop(context);
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade100),
      child: Center(
        child: Card(
          margin: EdgeInsets.all(10.0),
          elevation: 5.0,
          clipBehavior: Clip.hardEdge,
          shadowColor: Colors.grey,
          // color: Colors.,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            width: double.maxFinite,
            height: 350.0,
            child: Column(
              children: <Widget>[
                Text(
                  "Register on SmartDnD",
                  style: GoogleFonts.teko(
                      fontWeight: FontWeight.w500, fontSize: 30.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                ReactiveForm(
                    formGroup: registrationForm,
                    child: Column(
                      children: <Widget>[
                        ReactiveTextField(
                          formControlName: 'username',
                          decoration: InputDecoration(labelText: 'username'),
                          validationMessages: {
                            ValidationMessage.required: (error) =>
                                'Name is required',
                            ValidationMessage.minLength: (error) =>
                                'Name must be at least 3 characters',
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        ReactiveTextField<String>(
                          formControlName: 'password',
                          decoration: InputDecoration(labelText: 'password'),
                          validationMessages: {
                            ValidationMessage.required: (error) =>
                                'Password is required',
                            ValidationMessage.minLength: (error) =>
                                'Password must be at least 8 characters'
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        InkWell(
                            splashFactory: InkSplash.splashFactory,
                            splashColor: Colors.white54,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black87, // Button color
                                  foregroundColor: Colors.white, // Text color
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 12), // Button padding
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight:
                                          FontWeight.bold), // Font styling
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        12), // Rounded corners
                                  ),
                                ),
                                onPressed: () => isLoggedIn,
                                child: Text(
                                  "Submit",
                                  style: GoogleFonts.roboto(
                                    color: Colors.white60,
                                  ),
                                )))
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
