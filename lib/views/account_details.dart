import 'package:aduaba_fresh/models/user.dart';
import 'package:aduaba_fresh/utils/user_preference.dart';
import 'package:aduaba_fresh/views/edit_user_profile.dart';
import 'package:aduaba_fresh/views/homepage.dart';
import 'package:aduaba_fresh/views/orders.dart';
import 'package:aduaba_fresh/views/payment_card.dart';
import 'package:aduaba_fresh/views/shipping_details.dart';
import 'package:aduaba_fresh/views/sign_in.dart';
import 'package:aduaba_fresh/views/wishlist.dart';
import 'package:aduaba_fresh/widgets/homepage_widgets/user_name.dart';
import 'package:aduaba_fresh/widgets/reusable_button_no_img.dart';
import 'package:aduaba_fresh/widgets/reusable_box_header.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({ Key key }) : super(key: key);
  static String id = 'account_details';

  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  
  User user;

  @override
  void initState() {
    getUserFromSP();
    super.initState();
  }

  getUserFromSP() async {
    UserPreference up = new UserPreference();
    User usr = await up.getUser();
    setState(() {
      user = usr;
    });
  }

  void logoutUser() async{
SharedPreferences prefs = await SharedPreferences.getInstance();
prefs?.clear();
 Navigator.of(context)
    .pushNamedAndRemoveUntil(SignIn.id, (Route<dynamic> route) => false);
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 45.0),
          child: Column(children: [
            ReusableBoxHeader(
              text: 'Account',
              onTap: () {
                Navigator.pushNamed(context, HomePage.id);
              },
            ),
            Expanded(
            child: Container(
            // color: Color(0XFFF5F5F5),
            child: Column(children: [
              SizedBox(height: 48.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Row(
                  children: [
                    Container(
                      height: 60.0,
                      width: 60.0,
                      child: CircleAvatar(
                        backgroundColor: Color(0xFF3A953C).withOpacity(0.1),
                        child: Image.asset('assets/images/person.png'),
                      )
                      ),
                  
                  SizedBox(width: 16.0,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    UserName(
                      text: '${this.user?.firstName} ${this.user?.lastName}',
                    ),
                    SizedBox(height: 8.0,),
                    UserContactDetails(
                      text: '${this.user?.email}',
                    ),
                    SizedBox(height: 8.0,),
                    UserContactDetails(
                      text: '+234 ${this.user?.phoneNumber}',
                    )
                  ],),
                  ],
                ),
                  // SizedBox(width: 71.0,),
                  Container(
                    height: 15.0,
                    width: 16.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, EditUserProfile.id);
                      },
                      child: Image.asset('assets/images/edit_account.png')),
                  )
              ],),
              SizedBox(height: 53.0,),
              UserProfileLink(
                image: 'assets/images/acc_heart_icon.png',
                text: 'My wishlist',
                onTap: () {
                  Navigator.pushNamed(context, WishList.id);
                },
              ),
              UserProfileLink(
                image: 'assets/images/acc_cart_icon.png',
                text: 'My orders',
                onTap: () {
                  Navigator.pushNamed(context, Orders.id);
                },
              ),
              UserProfileLink(
                image: 'assets/images/card_payment.png',
                text: 'Payment',
                onTap: () {
                  Navigator.pushNamed(context, PaymentCard.id);
                },
              ),
              UserProfileLink(
                image: 'assets/images/shipping_icon.png',
                text: 'Shipping details',
                onTap: () {
                  Navigator.pushNamed(context, ShippingDetails.id);
                },
              ),
              UserProfileLink(
                image: 'assets/images/acc_setting_icon.png',
                text: 'Settings',
                onTap: () {},
              ),
              Spacer(),
              ReusableButtonNoImg(
                text: 'Log-Out',
                primary: Color(0xFFBB2F48),
                color: Colors.white,
                onpressed: () {
                  logoutUser();
                },
              ),
            ],),
            ),
          ),
          ]),
        ),
      )
      );
  }
}

class UserProfileLink extends StatelessWidget {
  UserProfileLink({this.image, this.text, this.onTap});
  
  final String image;
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFFF5F5F5),
                width: 1.0,
                style: BorderStyle.solid
              )
            )
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Row(children: [
              Image.asset(image),
              SizedBox(width: 19.0,),
              Text(text,
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w400,
                color: Color(0xFF10151A),
              ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class UserContactDetails extends StatelessWidget {
  UserContactDetails({this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: Color(0xFF999999)
    ),
    );
  }
}


