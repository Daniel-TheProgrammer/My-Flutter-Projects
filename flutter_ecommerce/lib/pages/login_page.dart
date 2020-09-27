import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/shared/routes_names.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;

  Widget _showTitle() => Text(
        'Login',
        style: Theme.of(context).textTheme.headline,
      );

//  Widget _showUsernameInput() => Padding(
//        padding: EdgeInsets.only(top: 20.0),
//        child: TextFormField(
//          onSaved: (val) => _username = val,
//          validator: (val) => val.length < 6 ? 'Username too short' : null,
//          decoration: InputDecoration(
//              border: OutlineInputBorder(),
//              labelText: "Username",
//              hintText: 'Enter  username, min length 6',
//              icon: Icon(
//                Icons.face,
//                color: Colors.grey,
//              )),
//        ),
//      );

  Widget _showEmailInput() => Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: TextFormField(
          onSaved: (val) => _email = val,
          validator: (val) =>
              !val.contains('@') && !val.contains('.') ? 'Invalid Email' : null,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Email",
              hintText: 'Enter a valid email ',
              icon: Icon(
                Icons.mail,
                color: Colors.grey,
              )),
        ),
      );

  Widget _showPasswordInput() => Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: TextFormField(
          onSaved: (val) => _password = val,
          validator: (val) => val.length < 6 ? 'Password too short' : null,
          obscureText: _obscureText,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: (){
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: Icon(
               _obscureText ? Icons.visibility : Icons.visibility_off
              ),
            ),
              border: OutlineInputBorder(),
              labelText: "Password",
              hintText: 'Enter password, min length 6',
              icon: Icon(
                Icons.lock,
                color: Colors.grey,
              )),
        ),
      );

  Widget _showFormActions() => Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text(
                'Login',
                style: Theme.of(context)
                    .textTheme
                    .body1
                    .copyWith(color: Colors.black),
              ),
              elevation: 8.0,
              onPressed: () => _submit,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              color: Theme.of(context).accentColor,
            ),
            FlatButton(
              child: Text('New user? Register'),
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed(RegisterRoute),
            )
          ],
        ),
      );

  void _submit() {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save();
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  _showTitle(),
//                  _showUsernameInput(),
                  _showEmailInput(),
                  _showPasswordInput(),
                  _showFormActions(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
