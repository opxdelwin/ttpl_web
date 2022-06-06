// ignore_for_file: non_constant_identifier_names

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color color_red = const Color(0xffff0002);
Color color_white = const Color(0xFFFEFDFE);
Color color_black = const Color(0xff040F0F);
Color color_cyan = const Color(0xff61F5FA);
Color color_darkBlue = const Color(0xff0000EE);

FontWeight mainFontWeight = FontWeight.w700;
FontWeight subFontWeight = FontWeight.w600;

EdgeInsets mainPadding = EdgeInsets.symmetric(
    horizontal: MediaQueryData.fromWindow(window).size.width * 0.05,
    vertical: 30);

TextStyle heading = GoogleFonts.oswald(fontSize: 20);

TextStyle body = GoogleFonts.dosis(
    color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w500);

double drawerMultiplier = 0.63;
double responsiveSize = 950;

List product_data = const [
  {
    'name': 'Wireless Addressable Fire Detection & Alarm System',
    'url': ['assets/images/fire_alarm_main.jpg'],
    'details':
        'TEXTEL Alert IP-based bus technology wireless fire alarm panel with bi-directional data transfer provides an intelligent software–aided administration of up to 200 physical addressable devices in each panel and supports unlimited control panels enabling networking of multiple sites with CMS (Centralised Monitoring Station).\n\nAddressable technology for integration of automatic and non-automatic life safety detectors as well as un-ambiguous identification of activated detectors in the event of a disaster.\n\nTextel adopts JIS Technology, ( Japan Industrial Standards ) and is manufactured in India.'
            '\n\nThe “Alert” incorporates duplex communication technology and utilizes FHSS (Frequency Hopping Spread Spectrum) signaling and reception of protocols to ensure the most secure and reliable fire alarm network.\n\nTextel “Alert” fire control panel and its accessories meets national code requirements (NCR) complying with EN, VDS, FCC, CE, ROHS, etc.*',
    'gem-link':
        'https://mkp.gem.gov.in/wireless-fire-alarm-system/wireless-fire-alarm-system-with-25-devices-connectivity/p-5116877-73318235085-cat.html#variant_id=5116877-73318235085',
    'compatible-products': [
      {
        'name': 'Wireless Smoke Sensor',
        'details': 'Powered from standard AA batteries with battery life up to 3 years.'
            '\nAnti tamper protection. Concealed antenna within sensor.'
            '\nMulti-sensor technology combining optical smoke detection and configurable*Heat detection (fixed, rate of rise and high temperature).'
            '\nHighly visible LED beacon with built-in Sounder with multi sensor technology',
        'url': 'assets/images/compatible_products/smoke_detector_front.jpg',
        'gem-link':
        'https://mkp.gem.gov.in/wireless-fire-alarm-system/wireless-fire-alarm-system-with-25-devices-connectivity/p-5116877-73318235085-cat.html#variant_id=5116877-73318235085',
      },
      {
        'name': 'Wireless Smoke & Heat Sensor',
        'details':
            'Powered from standard AA batteries with battery life up to 3 years.'
                '\nAnti tamper protection and concealed antenna within sensor.'
                '\nMulti-sensor technology combining optical smoke detection and configurable Heat detection (fixed, rate of rise and high temperature*)'
                '\nHighly visible LED beacon 2 Level volume setting',
        'url': 'assets/images/compatible_products/smoke_sensor.jpg',
      },
      {
        'name': 'Wireless Manual Call Point',
        'details':
            'Standards: EN45 Pt25 components using wireless linkEN45 Pt11 call point. '
                '\nHumidity (NC): 0 to 95% RH'
                '\nOperating voltage: Lithium battery 9V lithium battery 3V, type CR2032.'
                '\nBattery life: 3 years*(main battery)'
                '\nRange: 200m max, 3km with signal repeaters.'
                '\nAmbient temperature: 10°C to +55°C'
                '\nProtection: IP54, Frequency band: 868/ 2400 MHz.'
                '\nWeight: 200g (without batteries, with mounting box)',
        'url':
            'assets/images/compatible_products/Wireless_Manual_Call_Point.jpg',
      },
      {
        'name': 'Wireless CO Sensor',
        'details':
            'Powered from standard AA batteries with battery life up to 3 years.'
                '\nAnti tamper protection and concealed antenna within sensor.'
                '\nMulti-sensor technology combining optical smoke detection and configurable Heat detection (fixed, rate of rise and high temperature*)'
                '\nHighly visible LED beacon 2 Level volume setting',
        'url': 'assets/images/compatible_products/Wireless_CO_Sensor.jpg',
      },
      {
        'name': 'Wireless Gas Detector',
        'details':
            'Powered from standard AA batteries with battery life up to 3 years.'
                '\nAnti tamper protection and concealed antenna within sensor.'
                '\nMulti-sensor technology combining optical smoke detection and configurable Heat detection (fixed, rate of rise and high temperature*)'
                '\nHighly visible LED beacon 2 Level volume setting',
        'url': 'assets/images/compatible_products/Wireless_Gas_Detector.jpg',
      },
      {
        'name': 'Signal Repeater',
        'details': 'Standards: EN45 Pt25 components using wireless links.'
            '\nFrequency: 867MHz / 2400 MHz.'
            '\nRelay output: 4 Relay outputs.'
            '\nOperating Temperature -10°C to +55°C.'
            '\nHumidity (NC) 95% RH.'
            '\nWeight: 176 gm',
        'url': 'assets/images/compatible_products/Signal_Repeater.jpg',
      },
      {
        'name': 'Wireless Sounders and Strobe Sirens',
        'details': 'Power supply: AC 220V and battery powered.'
            '\nCurrent consumption: 70μA (sounder off).'
            '\nAmbient temperature: -10°C to +55°C.'
            '\nDimensions: 108 × 108 × 95 (W × H × D, mm).'
            '\nWeight 255g',
        'url':
            'assets/images/compatible_products/Wireless_Sounders_and_Strobe_Sirens.jpg',
      }
    ],
  },
  {
    'name': 'Wireless Nurse Call System',
    'url': ['assets/images/Wireless Nurse Call System.jpg'],
    'details': 'The Nurse Call system for HMS (Hospital Management Solutions) is suitable to manage patients by enabling quick and precise responses from duty nurses to the patients\' service requests during emergencies. Moreover, emergency patient calls in the absence of nurses, call information can be transmitted to many staffs simultaneously and it provides economical and efficient communication by reducing the operation cost such as using the conventional interphones and cell phones.'
        '\n\nFor both business and leisure wireless technology is now common worldwide, due to the advanced developments in wireless broadcasting and communication technology most people use wireless devices without a second thought.'
        '\n\nSince 1999 Textel Wireless Microprocessor-based Addressable Non-Blocking Nurse Calling Station/Panel is to connect Wireless Addressable devices like Patient Room Call + Cancellation Buttons, Hand Held Units for Patients, Wireless Toilet Call Button, and Wireless Dome Type Corridor Indication Light, etc. Wireless Nurse Call Panel is required to identify individual Patient Room & Toilet devices, to pinpoint the location of the call origination and the panel shall display the patient\'s Bed number / Room number which is accordingly programmed. The Nursing Station Panel shall have Audio & Visual, flashing indications along with service monitoring facilities for up to 8 Beds Indication simultaneously.',
    'gem-link':
        'https://mkp.gem.gov.in/wireless-attendant-calling-system/wireless-attandant-calling-system-with-32-single-function/p-5116877-80821791236-cat.html#variant_id=5116877-80821791236',
    'compatible-products': [
      {
        'name': 'Wireless Nurse Call Panel',
        'details':
            'High sensitivity wireless broadcasting technology. Zero interference with medical equipment or hospital Wi-Fi networks.\nIndicates up to 32 services requests on each panel from patient rooms.\nBuilt-in 4 types of alert tones.Corridor light indicator and amplifier system.'
                '\nHigh performance and stable wireless anti‐jamming technology.Colour LED indications to for service typeElegant appearance and elaborate finish',
        'url':
            'assets/images/compatible_products/Wireless Nurse Call Panel.jpg',
      },
      {
        'name': 'Wireless Patient Room call Station',
        'details':
            'Design: Modular switch type.\nService request button: 01(red colour).\nService cancel button: 01 (green colour).\nService pull cord: 01(optional).\nOperating voltage: 12V Battery'
                'Amp: Standby <10mA; Working < 10mA.\nOperation temp: 0°C ‐ 50°C (32°F ‐ 122°F).\nOperation humidity: 10 ‐ 90%.\nWeight: 300 gm *',
        'url':
            'assets/images/compatible_products/Wireless Patient Room call Station.jpg',
      },
      {
        'name': 'Wireless Patient Toilet Call Button',
        'details':
            'Design: Modular switch type.\nService request button: 01(red colour).\nService cancel button: 01 (green colour).\nService pull cord: 01(optional).\nOperating voltage: 12V Battery.\nAmp: Standby <10mA; Working < 10mA.\nOperation temp: 0°C ‐ 50°C (32°F ‐ 122°F).'
                '\nOperation humidity: 10 ‐ 90%.\nWeight: 300 gm *',
        'url':
            'assets/images/compatible_products/Wireless Patient Toilet Call Button.jpg',
      },
      {
        'name': 'Wireless Corridor Display',
        'details':
            'Works with remote control and pagers system.\nAdjustable volume with sound reminder\n.Works with 600pcs of call buttons.\nAble to show the different service type with flashing or non-flashing display.\nAble to show 1 or 2 or 4 or 8 groups of called number display.\nDimensions: 606x158x40mm.',
        'url':
            'assets/images/compatible_products/Wireless Cooridor Display.jpg',
      },
    ]
  },
  {
    'name': 'Wireless Attendant Call System',
    'url': ['assets/images/Wireless Attendant Call System.jpg'],
    'details': """
TEXTEL Make Wireless Attendant Call Systems are suitable for providing instant calling services for clients who need services at Restaurants, Conference Halls, Pantries, Pool Bedsides, Pubs, Coffee Shops, Casinos, or any other service area where an instant service is required. It is designed by adopting advanced digital wireless technology and gives the power of attendant to provide a real-time service response to the clients.
Wireless attendant call panels assure clients a better, efficient, quick, and real-time service response. The attendant call panel uses the latest wireless technology for easy installation and avoids all physical wiring.
The wireless attendant panel consists of simple and powerful addressable LED indicators which inform the real-time service request with flashing lights and areas where service is required. The panel have a special feature to change the service request LED colors for identifying the different level of service requirements.
A simple and powerful LED indicator informs the real-time service requests with flashing lights, the indication of the area where service is required, and different levels of service requirement by auto changing the Led color*, as the attendant can easily understand which level of service required for specific clients. Guests can enjoy immediate attention by just pressing the button helps request the service they need.

TEXTEL Make Wireless Attendant Call Systems are suitable for providing instant calling services for clients who need services at Restaurants, Conference Halls, Pantries, Pool Bedsides, Pubs, Coffee Shops, Casinos, or any other service area where an instant service is required. It is designed by adopting advanced digital wireless technology and gives the power of attendant to provide a real-time service response to the clients.

Wireless attendant call panels assure clients a better, efficient, quick, and real-time service response. The attendant call panel uses the latest wireless technology for easy installation and avoids all physical wiring.
The wireless attendant panel consists of simple and powerful addressable LED indicators which inform the real-time service request with flashing lights and areas where service is required. The panel have a special feature to change the service request LED colors for identifying the different level of service requirements.

A simple and powerful LED indicator informs the real-time service requests with flashing lights, an indication of the area where service is required, and different levels of service requirements by auto changing the Led color*, as the attendant can easily understand which level of service is required for specific clients. Guests can enjoy immediate attention by just pressing the button helps request the service they need.

    """,
    'gem-link':
        'https://mkp.gem.gov.in/wireless-attendant-calling-system/wireless-attandant-calling-system-with-32-single-function/p-5116877-80821791236-cat.html#variant_id=5116877-80821791236',
    'compatible-products': [
      {
        'name': 'Wireless Call Display Panel',
        'details':
            '32 LED indication\n3 Colour display\n7 Melody option and ringer volume control.\nSpeaker impedance : 80+15% max\nOutput power : 0.5W\nDistortion rate : 5% 3DB\nPower supply : AC220 V\nOperating voltage : DC5V 1.5A.\nStand by <30mA Full <35mA',
        'url':
            'assets/images/compatible_products/Wireless Call Display Panel.jpg',
      },
      {
        'name': 'Service Request Buttons',
        'details':
            'Single function wireless button (A1).\nCall-Bell Option : Single function (Call).\nService request buttons:1\nDimension & Weight : 60*23, 31gm \nOperating voltage : DC5V 1.5A',
        'url': 'assets/images/compatible_products/Service Request Buttons.jpg',
      },
      {
        'name': 'Service Request Buttons',
        'details':
            'Two function wireless button (A2)\nCall Bell Option : Two function (call+ cancel)\nModel Number : A2Button \nService request buttons : 1\nDimension & Weight : 60*23, 33gm\nOperating voltage : DC5V 1.5A',
        'url':
            'assets/images/compatible_products/Service Request Buttons A2.jpg',
      },
      {
        'name': 'Service Request Buttons',
        'details':
            'Four function wireless button (A4)\nCall Bell Option : Four function (call 3 colour+ cancel)\nModel Number : A4Button\nService request buttons :3\nDimension & Weight : 60*23, 35gm\nOperating voltage : DC5V 1.5A',
        'url':
            'assets/images/compatible_products/Service Request Buttons A4.jpg',
      },
    ]
  }
];


List clientele = [
  {'name': 'Aditya Birla', 'link': 'assets/images/clientele/aditya.jpg'},
  {'name': 'Care Hospitals', 'link': 'assets/images/clientele/ADITYA-CARE.png'},
  {
    'name': 'Aligarh Alumni Association',
    'link': 'assets/images/clientele/aligarh.jpg'
  },
  {
    'name': 'Apollo Hospital',
    'link': 'assets/images/clientele/APPOLO-HOSPITAL.jpg'
  },
  {'name': 'Bharat Electronics', 'link': 'assets/images/clientele/bhe.jpg'},
  {'name': 'Central Institute of Petrochemicals Engineering & Technology', 'link': 'assets/images/clientele/CIPET.png'},
  {'name': 'Central Industrial Security Force', 'link': 'assets/images/clientele/CISF.jpg'},
  {
    'name': 'Defence Research & Development Organisation',
    'link': 'assets/images/clientele/drdo.jpg'
  },
  {
    'name': 'Electronics Corporation of India',
    'link': 'assets/images/clientele/ecl.jpg'
  },
  {'name': 'Four Seasons Hotels & Resorts', 'link': 'assets/images/clientele/four.jpg'},
  {
    'name': 'Global Hospitals',
    'link': 'assets/images/clientele/GLOBAL-HOSPITAL.png'
  },
  {'name': 'Indian Institute of Management Bangalore', 'link': 'assets/images/clientele/iibm.png'},
  {'name': 'Industrial Leasing & Financial Services Limited', 'link': 'assets/images/clientele/ilfs.jpg'},
  {'name': 'Indian Metal & Ferro Alloys Limited', 'link': 'assets/images/clientele/IMFA.jpg'},
  {'name': 'Indian Army', 'link': 'assets/images/clientele/indian-army.jpg'},
  {
    'name': 'Indian Railways',
    'link': 'assets/images/clientele/INDIAN-RAILWAY.jpg'
  },
  {'name': 'Indian Navy', 'link': 'assets/images/clientele/indian_navy.jpg'},
  {'name': 'Indian Oil', 'link': 'assets/images/clientele/IndianOil.jpg'},
  {'name': 'Industrial Training Institute', 'link': 'assets/images/clientele/iti.jpg'},
  {'name': 'Jehangir Hospital', 'link': 'assets/images/clientele/jahangir.jpg'},
  {'name': 'Larsen & Turbo', 'link': 'assets/images/clientele/lt.jpg'},
  {'name': 'Marriott Hotels', 'link': 'assets/images/clientele/Marriott.jpg'},
  {'name': 'Mahanadi Coalfields Limited', 'link': 'assets/images/clientele/mcl_hospitals.jpg'},
  {'name': 'National Power Corporation Limited', 'link': 'assets/images/clientele/NTPC.gif'},
  {'name': 'Oberoi Hotels & Resorts', 'link': 'assets/images/clientele/OBEROI.jpg'},
  {'name': 'Reliance', 'link': 'assets/images/clientele/Reliance.jpg'},
  {'name': 'SAHARA', 'link': 'assets/images/clientele/SAHARA1.JPG'},
  {'name': 'Steel Authority of India Limited', 'link': 'assets/images/clientele/sail.jpg'},
  {'name': 'TATA STEEL', 'link': 'assets/images/clientele/TATA-STEEL.png'},
  {'name': 'The LEELA hotels & Resorts', 'link': 'assets/images/clientele/THE-LEELA.jpg'},
  {'name': 'TRIDENT Hotels', 'link': 'assets/images/clientele/TRIDENT.png'},
];

List certificates = [
  {
    'name': 'Hospitality Exibition at Banglore on 2013',
    'link': 'assets/images/certificates/certificates2_thumb.jpg'
  },
  {
    'name': 'STQC',
    'link': 'assets/images/certificates/certificates6.jpg',
  },
  {
    'name': 'Electronics Test & Development Centre',
    'link': 'assets/images/certificates/certificates8.jpg',
  },
  {
    'name': 'MHADA',
    'link': 'assets/images/certificates/certificates3.jpg',
  },
  {
    'name': 'MSME',
    'link': 'assets/images/certificates/certificates7.jpg',
  },
  {
    'name': 'RoHS',
    'link': 'assets/images/certificates/RoHS.jpg',
  },
];
