import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logi_app/customs/text_styles.dart';
import 'package:logi_app/profile_screen.dart';
import 'package:logi_app/register_auth/register_user_state.dart';
import 'package:provider/provider.dart';

class RegisterUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<RegisterUserState>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(context, state),
    );
  }
}

Widget _buildBody(context, RegisterUserState state) {
  return Padding(
    padding: EdgeInsets.only(left: 32.0, top: 76.0, right: 32.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        headerText("Register Email"),
        SizedBox(
          height: 11.0,
        ),
        bodyText("Enter your email address"),
        SizedBox(
          height: 33.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEmailField(state),
            SizedBox(
              height: 64.0,
            ),
            _buildCircleAvatar(context, state),
          ],
        ),
      ],
    ),
  );
}

Widget _buildEmailField(RegisterUserState state) {
  return TextFormField(
    controller: state.emailController,
    keyboardType: TextInputType.emailAddress,
    validator: (v) => state.validateEmail(v),
    decoration: InputDecoration(
      hintText: 'Email address',
      hintStyle: TextStyle(
        fontFamily: 'Lato',
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      ),
    ),
  );
}

Widget _buildCircleAvatar(context, RegisterUserState state) {
  return Consumer<RegisterUserState>(
    builder: (context, value, child) => InkWell(
      child: CircleAvatar(
        radius: 28.93,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        child: state.state == ApiState.Loading
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              )
            : Icon(Icons.arrow_forward),
      ),
      onTap: () {
        if (state.state == ApiState.Initials) {
          state.executeSendEmail();
        } else if (state.state == ApiState.Success) {
          return Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProfilePage()));
        } else if (state.state == ApiState.Error) {
          return Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("An Error Occured"),
          ));
        }
      },
    ),
  );
}
