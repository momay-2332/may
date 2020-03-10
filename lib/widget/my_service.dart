import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:may/container/show_map.dart';
import 'package:may/container/show_list_product.dart';
import 'package:may/utility/my_style.dart';
import 'package:may/widget/authen.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
// Field
  String nameLogin, emailLogin, urlAvatarLogin;
  Widget currentwidget = ShowListProduct();

// Method
  @override
  void initState() {
    super.initState();
    findUser();
  }

  Future<void> findUser() async {
    print('work');
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await auth.currentUser();
    setState(() {
      nameLogin = firebaseUser.displayName;
      emailLogin = firebaseUser.email;
      urlAvatarLogin = firebaseUser.photoUrl;
      // print('url = $urlAvatarLogin');
    });
  }

  Widget menuListProduct() {
    return ListTile(
        onTap: () {
          setState(() {
            currentwidget = ShowListProduct();
          });
          Navigator.of(context).pop();
        },
        subtitle: Text('showList Product from Json'),
        title: Text('List Productdata'),
        leading: Icon(
          Icons.home,
          size: 36.0,
          color: Colors.green.shade700,
        ));
  }

  Widget menuMap() {
    return ListTile(
        onTap: () {
          setState(() {
            currentwidget = ShowMap();
             Navigator.of(context).pop();
          });
        },
        subtitle: Text('show Map and Get Location'),
        title: Text('List Productdata'),
        leading: Icon(
          Icons.map,
          size: 36.0,
          color: Colors.red.shade600,
        ));
  }

  Widget showAvatar() {
    return urlAvatarLogin == null
        ? Image.network(MyStyle().urlAvatar)
        : showNetworkAvatar();
  }

  Widget showNetworkAvatar() {
    return ClipOval(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(urlAvatarLogin), fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget menuSighOut() {
    return ListTile(
      onTap: () {
        processSignOut();
      },
      subtitle: Text('Sign Out and Back to Authentication'),
      title: Text('Sign Out'),
      leading: Icon(
        Icons.exit_to_app,
        size: 36.0,
        color: Colors.red,
      ),
    );
  }

  Future<void> processSignOut() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut().then((response) {
      MaterialPageRoute route = MaterialPageRoute(builder: (value) => Authen());
      Navigator.of(context).pushAndRemoveUntil(route, (route) => false);
    });
  }

  Widget showHead() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/wall.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      accountName: showName(),
      accountEmail: showemail(),
      currentAccountPicture: showAvatar(),
    );
  }

  Text showemail() {
    return emailLogin == null
        ? Text(
            'email Login',
            style: TextStyle(color: MyStyle().darkColor),
          )
        : Text(
            emailLogin,
            style: TextStyle(color: MyStyle().darkColor),
          );
  }

  Text showName() {
    return nameLogin == null
        ? Text(
            'Name Login',
            style: TextStyle(color: MyStyle().darkColor),
          )
        : Text(
            nameLogin,
            style: TextStyle(color: MyStyle().darkColor),
          );
  }

  Widget showDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          showHead(),
          menuListProduct(),
          menuMap(),
          menuSighOut(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: currentwidget,
      drawer: showDrawer(),
      appBar: AppBar(
        title: Text('My service'),
        backgroundColor: MyStyle().primaryColor,
      ),
    );
  }
}
