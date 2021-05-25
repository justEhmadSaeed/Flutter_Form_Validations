import 'package:flutter/material.dart';
import 'package:form_validation/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Validation"),
      ),
      body: AppBody(),
    );
  }
}

class AppBody extends StatefulWidget {
  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;
  String errorMessage = '';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Register',
                style: kHeadingTextStyle,
              ),
              Text(
                'Signup to experience new ways',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: kTextFieldStyle,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: klabelStyle,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  prefixIcon: Icon(Icons.account_circle),
                  errorStyle: kErrorStyle,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter username';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: kTextFieldStyle,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  labelStyle: klabelStyle,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  prefixIcon: Icon(Icons.email),
                  errorStyle: kErrorStyle,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Please enter email address';
                  else {
                    RegExp regExp = new RegExp(
                        r'^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$');
                    if (!regExp.hasMatch(value.toString())) {
                      return 'Please Enter a valid Email address.';
                    }
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: kTextFieldStyle,
                decoration: InputDecoration(
                  labelText: 'Mobile No.',
                  labelStyle: klabelStyle,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  prefixIcon: Icon(Icons.phone),
                  errorStyle: kErrorStyle,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Mobile Number.';
                  } else if (value.toString().length != 11)
                    return 'Mobile No. must be equal to 11.';
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: kTextFieldStyle,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  labelStyle: klabelStyle,
                  prefixIcon: Icon(Icons.lock),
                  errorStyle: kErrorStyle,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Please enter Password';
                  else if (value.toString().length < 5)
                    return 'Password length must be greater than or equal to 5.';
                  else if (!RegExp(r'^[a-zA-Z0-9]+$')
                      .hasMatch(value.toString()))
                    return 'Password must contain only alphabets & digits.';
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                child: ElevatedButton(
                  child: Text('Register'),
                  style: kButtonStyle,
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (isChecked) {
                      setState(() {
                        errorMessage = '';
                      });
                    } else {
                      setState(() {
                        errorMessage = 'Kindly accept the terms & conditions.';
                      });
                    }
                    if (_formKey.currentState.validate() && isChecked) {
                      this._formKey.currentState.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Data Submit.')));
                    }
                  },
                ),
              ),
              Text(
                errorMessage,
                style: kErrorMessageStyle,
              ),
              Row(
                children: [
                  Checkbox(
                      value: isChecked,
                      onChanged: (bool value) {
                        setState(() {
                          isChecked = value;
                        });
                      }),
                  Text('I accept the terms & conditions.')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
