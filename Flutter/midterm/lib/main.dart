import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    ChangeNotifierProvider(
        create: (context) => AuthenicatorProvider(),
        builder: (context, _) => Consumer<AuthenicatorProvider>(
            builder: (ctx, auth, _) => MaterialApp(
      home: auth.credentail != null ?Complete(): Scaffold(
        appBar: AppBar(
          title: Text('Sign in Form'),
        ),
        body: LoginPage(),
      ),
    )));
  }
}

class LoginPage extends StatelessWidget {
  String _username, _email, _password = "";
  FocusNode _usernameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  controller: _emailController,
                  onFieldSubmitted: (_) {
                    fieldFocusChange(
                        context, _emailFocusNode, _passwordFocusNode);
                  },
                  textInputAction: TextInputAction.next,
                  validator: (email) => EmailValidator.validate(email)
                      ? null
                      : "Invalid email address",
                  onSaved: (email) => _email = email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'e.g @gmail.com',
                    border: OutlineInputBorder(),
                  )),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  validator: (password) {
                    ;
                    RegExp regex = new RegExp(r"^\d+$");
                    if (!regex.hasMatch(password))
                      return 'Invalid password';
                    else
                      return null;
                  },
                  controller: _passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  )),
              TextButton(
                child: Text('Sign in'),
                onPressed: () {
                  final email = _emailController.text;
                  final password = _passwordController.text;
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();

                    Provider.of<AuthenicatorProvider>(context, listen: false)
                        .login(email, password, context);
                    ;
                  }
                },
              )
            ],
          ),
        ));
  }
}

void fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

class AuthenicatorProvider extends ChangeNotifier {
  String credentail;
  AuthenicatorProvider() {
    init();
  }
  Future<void> init() async {
    await Firebase.initializeApp();
    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        credentail = user.email;
      } else {
        credentail = null;
      }
      notifyListeners();
    });
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }

  Future<void> login(
      String email, String password, BuildContext context) async {
    UserInfo userInfo = UserInfo(email: email, password: password);
    try {
      var status = await FirebaseAuth.instance
          .fetchSignInMethodsForEmail(userInfo.email);
      if (!status.contains('password')) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: userInfo.email, password: userInfo.email);
      } else {
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: userInfo.email, password: userInfo.password);
        } on FirebaseAuthException catch (_) {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: Text("Email is already used with others password"),
                  ));
        }
      }
    } on FirebaseAuthException catch (_) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text("Email is Invalid Format"),
              ));
    }
    notifyListeners();
  }
}

class UserInfo {
  String email;
  String password;
  UserInfo({this.email, this.password});
}

class Complete extends StatelessWidget {
  final email;
  final password;
  Complete({this.email,this.password});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Complete'),),
      body: Column(
        children: [
          Container(
            child: Text(email),
          ),
          Text(password)
        ],
      ),

    );
  }
}
