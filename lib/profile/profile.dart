import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyProfile(),
    );
  }
}

class MyProfile extends StatefulWidget {
  MyProfile({super.key});

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _changePhoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  void _deletePhoto() {
    setState(() {
      _profileImage = null;
    });
  }

  void _showPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.photo_camera),
              title: Text('Change Photo'),
              onTap: () {
                Navigator.pop(context);
                _changePhoto();
              },
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Delete Photo'),
              onTap: () {
                Navigator.pop(context);
                _deletePhoto();
              },
            ),
            ListTile(
              leading: Icon(Icons.cancel),
              title: Text('Cancel'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, 'main_food_page');
          },
        ),
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => _showPhotoOptions(context),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:
                  _profileImage != null ? FileImage(_profileImage!) : null,
                  child: _profileImage == null
                      ? Icon(Icons.person, size: 50, color: Colors.white)
                      : null, // Show icon only if no profile image
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Username',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ProfileMenuItem(
                title: 'Your Profile',
                onTap: () {
                  Navigator.pushNamed(context, '/user');
                },
              ),
              ProfileMenuItem(
                title: 'Your Orders',
                onTap: () {
                  Navigator.pushNamed(context, '/orders');
                },
              ),
              ExpansionTile(
                title: Text('Payment & Refunds'),
                children: [
                  ListTile(
                    title: Text('Refund Status'),
                    onTap: () {
                      Navigator.pushNamed(context, '/refund');
                    },
                  ),
                  ListTile(
                    title: Text('Payment Modes'),
                    onTap: () {
                      Navigator.pushNamed(context, '/payment_mode');
                    },
                  ),
                ],
              ),
              ProfileMenuItem(
                  title: 'Address',
                  onTap: () {
                    Navigator.pushNamed(context, '/address');
                  }),
              ProfileMenuItem(
                  title: 'Eat with Friends',
                  onTap: () {
                    Navigator.pushNamed(context, '/eat_with_friends');
                  }),
              ProfileMenuItem(
                  title: 'Subscribe & Save',
                  onTap: () {
                    Navigator.pushNamed(context, '/subscribe_&_save');
                  }),
              ProfileMenuItem(
                  title: 'Premium',
                  onTap: () {
                    Navigator.pushNamed(context, '/premium');
                  }),
              ProfileMenuItem(
                  title: 'FAQs',
                  onTap: () {
                    Navigator.pushNamed(context, '/faq');
                  }),
              ProfileMenuItem(
                  title: 'Feedback',
                  onTap: () {
                    Navigator.pushNamed(context, '/feedback');
                  }),
              ProfileMenuItem(
                  title: 'Log Out',
                  onTap: () {
                    Navigator.pushNamed(context, 'login');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ProfileMenuItem({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
