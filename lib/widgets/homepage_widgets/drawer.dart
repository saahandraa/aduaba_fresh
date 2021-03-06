import 'package:aduaba_fresh/models/user.dart';
import 'package:aduaba_fresh/utils/user_preference.dart';
import 'package:aduaba_fresh/views/categories.dart';
import 'package:aduaba_fresh/views/account_details.dart';
import 'package:aduaba_fresh/views/orders.dart';
import 'package:aduaba_fresh/views/wishlist.dart';
import 'package:aduaba_fresh/widgets/homepage_widgets/user_name.dart';
import 'package:flutter/material.dart';


class DrawerBody extends StatefulWidget {
  const DrawerBody({ Key key }) : super(key: key);

  @override
  _DrawerBodyState createState() => _DrawerBodyState();
}

class _DrawerBodyState extends State<DrawerBody> {

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


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children:[ 
            

            Padding(
            padding: const EdgeInsets.only(right:10.0),
            child: Container(
              // color: Color(0xFFFFFFFF),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(39.0, 40.0, 39.0, 27.0),
                    child: Column(
                      children: [
                        Container(
                          width: 304.0,
                          height: 120.0,
                          decoration: BoxDecoration(
                          ),
                          child: Row(children: [
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.0),
                                color: Color(0xFF3A953C).withOpacity(0.1)
                              ),
                              child: Image.asset('assets/images/person.png'),
                            ),
                            SizedBox(width: 16.0,),
                            UserName(
                              text: '${this.user?.firstName} ${this.user?.lastName}',
                            ),
                          ],)
                        ),
                        SizedBox(height: 38.0,),
                        DrawerProfileLink(
                          image: 'assets/images/profile_cart.png',
                          title: 'Cart'
                        ),
                        SizedBox(height: 33.0,),
                        DrawerProfileLink(
                          image: 'assets/images/profile_categories.png',
                          title: 'Categories',
                          onTap: () {
                            Navigator.pushNamed(context, Categories.id);
                          },
                        ),
                        SizedBox(height: 33.0,),
                        DrawerProfileLink(
                          image: 'assets/images/profile_heart.png',
                          title: 'My Wishlist',
                          onTap: () {
                            Navigator.pushNamed(context, WishList.id);
                          },
                        ),
                        SizedBox(height: 33.5,),
                        DrawerProfileLink(
                          image: 'assets/images/profile_cart.png',
                          title: 'Orders',
                          onTap: () {
                            Navigator.pushNamed(context, Orders.id);
                          },
                        ),
                        SizedBox(height: 32.5,),
                        DrawerProfileLink(
                          image: 'assets/images/profile_person.png',
                          title: 'Account Details',
                          onTap: () {
                            Navigator.pushNamed(context, AccountDetails.id);
                          },
                        ),

                    ],),
                  ),
                  Container(
                  width: double.infinity,
                  height: 48.0,
                  color: Color(0xFFF9F9F9),
                  child: Padding(
                    padding:  EdgeInsets.fromLTRB(40.0, 14.0, 0.0, 16.0),
                    child: Text('Support',
                    style: TextStyle(
                      
                      color: Color(0xFF979797),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400
                      ),
                      ),
                  ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(36.0, 44.0, 36.0, 40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('Contact Us',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF10151A)
                        ),
                        ),
                      ),
                      SizedBox(height: 32.0,),
                      Text('Help & FAQs',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF10151A)
                      ),
                      ),
                      SizedBox(height: 73.16,),
                      Center(
                        child: Image.asset('assets/images/profile_logo.png')
                        ),
                      SizedBox(height: 31.14,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        DrawerBottomText(
                          text: 'Privacy Policy',
                        ),
                        DrawerBottomText(
                          text: '.',
                        ),
                        DrawerBottomText(
                          text: 'Terms of Use',
                        ),
                      ],)
                    ],),
                  )
                ],
              ),
            ),
          ),
        //   Positioned(
        //     left: MediaQuery.of(context).size.width/2,
        // top: MediaQuery.of(context).size.height/2,
        // right: MediaQuery.of(context).size.width/2,
        // bottom: MediaQuery.of(context).size.height/2,
        //     child: Container(
        //       width: 32.0,
        //       height: 32.0,
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(100.0),
        //         color: Colors.black
        //       ),
        //       child: Icon(Icons.close,
        //       color: Colors.white,
        //       )
        //       ),
        //   )
          ]
        ),
      ),
      
    );
  }
}



class DrawerProfileLink extends StatelessWidget {
  DrawerProfileLink({this.image, this.title, this.onTap});
  final String image;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 23.0,
          child: Row(children: [
            Image.asset(image),
            SizedBox(width: 19.3,),
            Text(title,
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w400,
              color: Color(0xFF10151A)
            ),
            ),
          ],),
        ),
      ),
    );
  }
}

class DrawerBottomText extends StatelessWidget {
  DrawerBottomText({this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(
      color: Color(0xFF999999),
      fontSize: 14.0,
      fontWeight: FontWeight.w400
    ),
    );
  }
}