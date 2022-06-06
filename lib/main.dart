import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ttpl_website/provider/navigation_provider.dart';
import 'package:ttpl_website/screens/landing/LandingResponsive.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDZ73IJyyaOstTLS_8Oix30Q9nCHYwKmgQ",
        authDomain: "textel-technologies-pvt-af40e.firebaseapp.com",
        projectId: "textel-technologies-pvt-af40e",
        storageBucket: "textel-technologies-pvt-af40e.appspot.com",
        messagingSenderId: "883159467934",
        appId: "1:883159467934:web:69b12cc0c93c68fd5c388f",
        measurementId: "G-YMJ6QWEDVB"
    )
      );
  // FirebaseAppCheck appCheck = FirebaseAppCheck.instance;
  // await appCheck.setTokenAutoRefreshEnabled(true);
  // await appCheck.activate(webRecaptchaSiteKey: '6LepNRIgAAAAAKhLxI6C5CPNovKPsoCSLxvvFOyC');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => NavigationProvider()),
    ],
    child: const MaterialApp(
      title: 'Textel Technologies Private Limited',
      debugShowCheckedModeBanner: false,
      home: ResponsiveLanding(),
      // home: ResponsiveProducts(),
    )
  ));
}

