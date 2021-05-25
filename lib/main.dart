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
              TextFormField(
                style: kTextFieldStyle,
                decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: klabelStyle,
                    prefixIcon: Icon(Icons.account_circle)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Some Text';
                  }
                  return null;
                },
              ),
              TextFormField(
                style: kTextFieldStyle,
                decoration: InputDecoration(
                    labelText: 'Email Address',
                    labelStyle: klabelStyle,
                    prefixIcon: Icon(Icons.email)),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Please Enter Some Text';
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
              TextFormField(
                style: kTextFieldStyle,
                decoration: InputDecoration(
                    labelText: 'Mobile No.',
                    labelStyle: klabelStyle,
                    prefixIcon: Icon(Icons.phone)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Mobile Number.';
                  } else if (value.toString().length != 11)
                    return 'Mobile No. must be equal to 11.';
                  return null;
                },
              ),
              TextFormField(
                style: kTextFieldStyle,
                decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: klabelStyle,
                    prefixIcon: Icon(Icons.lock)),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Please Enter Some Text';
                  else if (value.toString().length < 5)
                    return 'Password length must be greater than or equal to 5.';
                  else if (!RegExp(r'^[a-zA-Z0-9]+$')
                      .hasMatch(value.toString()))
                    return 'Password must contain only alphabets & digits.';
                  return null;
                },
              ),
              ListTile(
                title: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (isChecked) {
                      setState(() {
                        errorMessage = '';
                      });
                      if (_formKey.currentState.validate()) {
                        this._formKey.currentState.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Data Submit.')));
                      }
                    } else {
                      setState(() {
                        errorMessage = 'Kindly accept the terms & conditions.';
                      });
                    }
                  },
                  child: Text('Register'),
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
