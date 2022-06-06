import 'package:flutter/material.dart';
import 'package:ttpl_website/utils/utils.dart';

import '../custom_drawer.dart';
import '../footer.dart';
import '../header.dart';

class ServicesPc extends StatefulWidget {
  const ServicesPc({Key? key}) : super(key: key);

  @override
  State<ServicesPc> createState() => _GalleryPcState();
}

class _GalleryPcState extends State<ServicesPc> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
          height: height,
          width: width,
          child: ListView(
            children: [
              const Header(),
              Center(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.12),
                      height: 100,
                      width: width,
                      child: FittedBox(
                        child: Text(
                          'Services',
                          style: heading,
                        ),
                      ))),
              const SizedBox(height: 30),

              ///details
              Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.10),
                child: Text(
                    'We at Textel, engage in the Design, Supply, Erection, Installation, Testing & Commissioning of Fire Fighting Systems, Automatic Fire Hydrant systems, and Sprinkler Systems for any firms of Industrial, Commercial, High rise buildings, Hospitals, Offices, Commercial complexes, Airport terminals, Housing societies, IT parks, Hotels, Factories, Shopping malls, Educational institution, Auditorium, Banks, Theatres, Steel plants, Residential apartments, Warehouse, and Storehouses, etc.',
                    style: body),
              ),
              const SizedBox(
                height: 50,
              ),

              ///offers
              Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.12),
                  height: 75,
                  width: width,
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Offers',
                      style: heading,
                    ),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '• Fire Protection Engineering Works',
                      style: body,
                    ),
                    Text(
                      '• Fire Safety Auditing & Consulting',
                      style: body,
                    ),
                    Text(
                      '• Fire Awareness Drills and Training',
                      style: body,
                    ),
                    Text(
                      '• AMC of Fire Protection Installations',
                      style: body,
                    ),
                    Text(
                      '• Fire Extinguishers Refilling',
                      style: body,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),

              ///Fire Protection Engineering Works
              Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.12),
                  height: 75,
                  width: width,
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Fire Protection Engineering Works',
                      style: heading,
                    ),
                  )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            'We carry out Supply, Installation, Testing, and Commissioning of ALSBMs [Active Life Safety Building Management Systems], a project consisting of Engineering of IP based Wireless/Wired addressable Fire Alarm System Panels, Smoke Sensors, MCPs, Indoor Sounders, Hooters, various types of Signage, Extinguishers, Installation of raisers, Hydrant valves, First aid hose reels, air release valves, Pressure gauges, Fire brigade 4 ways, Butterfly valves, Engineering of sprinkler systems, various pumps such as Jockey pumps, main pumps, diesel pumps, Automation of Control Panels, Construction of Ground-level and Overhead water tanks on turnkey basis.',
                            style: body,
                          ),
                        ),
                        const SizedBox(width: 25),
                        SizedBox(
                          width: 300,
                          height: 225,
                          child: ListView(
                            children: [
                              Image.asset(
                                  'assets/images/services/protection_eng_works_1.jpg'),
                              const SizedBox(height: 25),
                              Image.asset(
                                  'assets/images/services/protection_eng_works_2.jpg'),
                              const SizedBox(height: 25),
                              Image.asset(
                                  'assets/images/services/protection_eng_works_3.jpg'),
                              const SizedBox(height: 25),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 50),

              ///Fire Safety Auditing, Consulting & Training
              Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.12),
                  height: 75,
                  width: width,
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Fire Safety Auditing, Consulting & Training',
                      style: heading,
                    ),
                  )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                        'assets/images/services/fire-safety-audit-500x500.jpg'),
                    const SizedBox(width: 25),
                    Flexible(
                        child: Text(
                            'The audit is an examination of the premises and relevant documents to ascertain how the premises are being managed regarding fire safety. The emphasis is on the responsible person demonstrating they have met the duties required by the fire safety order.'
                            '\n\nWe at Textel, provide all types of consultancy services related to Fire and safety on Fire Systems Designing, Fire Protection Engineers, Fire Safety Training, Fire Drills, and also a skilled service provider for offering complete fire-fighting solutions for hospitals, Industrial and Commercial High Rise Buildings. Clients can avail of the services of safety programmers, Safety audits, Risk Assessment, Risk Management, Disaster plans, and Re-Engineering as per their requirements for electrical panels, server rooms, data centers, computer rooms, Paint Booth, Gas Turbine, High Pressure, Spray Booth, Power Line, Residential Apartment, FM Global approved Projects, Major Industrial Projects, Office and Commercial Complexes, Hotels, Airport Terminal, School and Auditorium, and Steel Plant. They find total assistance from our trained and skilled professionals.',
                            style: body)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.10),
                child: Text(
                    '\nWe also undertake Turnkey Projects for Designs and Installation of Fire Suppression Systems (Gas/Water), Fire Alarm (Heat/Smoke Detection) Systems, Sales & Service of All Type Fire Extinguishers/ Equipment/Signage/ Evacuation Plan/ Emergency Lights, and Rescue Operation Devices.',
                    style: body),
              ),
              const SizedBox(height: 50),

              ///Fire Awareness Drills & Training
              Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.12),
                  height: 75,
                  width: width,
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Fire Awareness Drills & Training',
                      style: heading,
                    ),
                  )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.10),
                child: Row(
                  children: [
                    SizedBox(
                        width: 500,
                        child: Image.asset(
                            'assets/images/services/Fire-safety-training-for-employees.jpg')),
                    const SizedBox(width: 25),
                    Flexible(
                        child: Text(
                      'Fire safety awareness is an educational process to remind everyone in the workplace of best practices to avoid creating a fire risk, and the measures to take in the event a fire happens in the workplace. A plan educates and reminds everyone of the specific prevention methods and the safety procedures that apply to the organization.'
                      '\n\nEvery workplace needs a defined training process to communicate the responsibilities and essential fire safety procedures to all personnel. The best communication approach starts with training in the fire alarm systems, the evacuation routes to safely exit the building, and the process of accounting for all personnel.',
                      style: body,
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 50),

              ///AMC of Fire Protection & Detection Systems
              Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.12),
                  height: 75,
                  width: width,
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'AMC of Fire Protection & Detection Systems',
                      style: heading,
                    ),
                  )),

              Container(
                height: 200,
                padding: EdgeInsets.symmetric(horizontal: width * 0.10),
                child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                            'assets/images/services/fire-safety-audit-500x500.jpg'),
                        Image.asset(
                            'assets/images/services/fire-safety-audit-500x500.jpg'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.10),
                    child: Text(
                      'Fire safety awareness is an educational process to remind everyone in the workplace of best practices to avoid creating a fire risk, and the measures to take in the event a fire happens in the workplace. A plan educates and reminds everyone of the specific prevention methods and the safety procedures that apply to the organization.'
                      '\n\nEvery workplace needs a defined training process to communicate the responsibilities and essential fire safety procedures to all personnel. The best communication approach starts with training in the fire alarm systems, the evacuation routes to safely exit the building, and the process of accounting for all personnel.',
                      style: body,
                    ),
                  ),

              const SizedBox(height: 50),

              ///Fire Extinguishers Refilling
              Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.12),
                  height: 75,
                  width: width,
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Fire Extinguishers Refilling',
                      style: heading,
                    ),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.10),
                child: Text(
                  'We engage by providing a reliable Extinguisher refilling service. Keeping all existing safety factors in mind, we refill the fire extinguishers for uninterrupted and continuous usage for any sort of such as ABC stored pressure, dry chemical powder fire extinguishers, Co2 fire extinguishers, AFFF mechanical foam fire extinguishers, Clean Agent Fire extinguishers, automatic fire extinguishers, and all HFC-227 (FM200) fire extinguishers, etc. In other words, a must to contact us once for the best fire cylinder refilling, inspection, drill training, testing, and recharging. We establish close coordination with clients and our experts help focus on delivery on time thereby maintaining a trustworthy.',
                  style: body,
                ),
              ),
              const SizedBox(height: 50),
              const Footer(),
            ]

    )));
  }
}

class ServicesMobile extends StatefulWidget {
  const ServicesMobile({Key? key}) : super(key: key);

  @override
  State<ServicesMobile> createState() => _ServicesMobileState();
}

class _ServicesMobileState extends State<ServicesMobile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        endDrawer: CustomDrawer(width: width*drawerMultiplier, height: height,),
        body: SizedBox(
            height: height,
            width: width,
            child: ListView(
              children: [
                const Header(),
                Center(
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.12),
                        height: 100,
                        width: width,
                        child: FittedBox(
                          child: Text(
                            'Services',
                            style: heading,
                          ),
                        ))),
                const SizedBox(height: 30),

                ///details
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.10),
                  child: Text(
                      'We at Textel, engage in the Design, Supply, Erection, Installation, Testing & Commissioning of Fire Fighting Systems, Automatic Fire Hydrant systems, and Sprinkler Systems for any firms of Industrial, Commercial, High rise buildings, Hospitals, Offices, Commercial complexes, Airport terminals, Housing societies, IT parks, Hotels, Factories, Shopping malls, Educational institution, Auditorium, Banks, Theatres, Steel plants, Residential apartments, Warehouse, and Storehouses, etc.',
                      style: body),
                ),
                const SizedBox(
                  height: 50,
                ),

                ///offers
                Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.12),
                    height: 100,
                    width: width,
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Offers',
                        style: heading,
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '• Fire Protection Engineering Works',
                        style: body,
                      ),
                      Text(
                        '• Fire Safety Auditing & Consulting',
                        style: body,
                      ),
                      Text(
                        '• Fire Awareness Drills and Training',
                        style: body,
                      ),
                      Text(
                        '• AMC of Fire Protection Installations',
                        style: body,
                      ),
                      Text(
                        '• Fire Extinguishers Refilling',
                        style: body,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),

                ///Fire Protection Engineering Works
                Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.12),
                    height: 75,
                    width: width,
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Fire Protection Engineering Works',
                        style: heading,
                      ),
                    )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.10),
                  width: width,
                  height: 175,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    children: [
                      Image.asset('assets/images/services/protection_eng_works_1.jpg'),
                      const SizedBox(width: 25),
                      Image.asset('assets/images/services/protection_eng_works_2.jpg'),
                      const SizedBox(width: 25),
                      Image.asset('assets/images/services/protection_eng_works_3.jpg'),
                      const SizedBox(width: 25),
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.10),
                  child: Text(
                    'We carry out Supply, Installation, Testing, and Commissioning of ALSBMs [Active Life Safety Building Management Systems], a project consisting of Engineering of IP based Wireless/Wired addressable Fire Alarm System Panels, Smoke Sensors, MCPs, Indoor Sounders, Hooters, various types of Signage, Extinguishers, Installation of raisers, Hydrant valves, First aid hose reels, air release valves, Pressure gauges, Fire brigade 4 ways, Butterfly valves, Engineering of sprinkler systems, various pumps such as Jockey pumps, main pumps, diesel pumps, Automation of Control Panels, Construction of Ground-level and Overhead water tanks on turnkey basis.',
                    style: body,
                  ),
                ),
                const SizedBox(height: 50),

                ///Fire Safety Auditing, Consulting & Training
                Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.12),
                    height: 75,
                    width: width,
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Fire Safety Auditing, Consulting & Training',
                        style: heading,
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.10),
                  child: Text(
                    'The audit is an examination of the premises and relevant documents to ascertain how the premises are being managed regarding fire safety. The emphasis is on the responsible person demonstrating they have met the duties required by the fire safety order.'
                    '\n\nWe at Textel, provide all types of consultancy services related Fire and safety on Fire Systems Designing, Fire Protection Engineers, Fire Safety Training , Fire Drills and also a skilled service provider for offering complete fire-fighting solutions for Hospital , Industrial and Commercial High Rise Buildings . Clients can avail the services for safety programmers, Safety Audit, Risk Assessment, Risk Management, Disaster Plan, Re- Engineering as per their requirements for electrical panel, server room, data centres, computer rooms, Paint Booth, Gas Turbine, High Pressure, Spray Booth, Power Line, Residential Apartment ,FM Global approved Projects, Major Industrial Projects, Office and Commercial Complexes, Hotels , Airport Terminal, School and Auditorium, and Steel Plant. They find total assistance from our trained and skilled professionals.'
                    '\n\nWe also undertake Turnkey Projects for Designs and Installation of Fire Suppression Systems (Gas/Water), Fire Alarm (Heat/Smoke Detection) Systems, Sales & Service of All Type Fire Extinguishers/ Equipment/Signage/ Evacuation Plan/ Emergency Lights, and Rescue Operation Devices.',
                    style: body,
                  ),
                ),
                const SizedBox(height: 50),

                ///Fire Awareness Drills & Training
                Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.12),
                    height: 75,
                    width: width,
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Fire Awareness Drills & Training',
                        style: heading,
                      ),
                    )),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.10),
                  child: Text(
                    'Fire safety awareness is an educational process to remind everyone in the workplace of best practices to avoid creating a fire risk, and the measures to take in the event a fire happens in the workplace. A plan educates and reminds everyone of the specific prevention methods and the safety procedures that apply to the organization.'
                    'Every workplace needs a defined training process to communicate the responsibilities and essential fire safety procedures to all personnel. The best communication approach starts with training in the fire alarm systems, the evacuation routes to safely exit the building, and the process of accounting for all personnel.',
                    style: body,
                  ),
                ),
                const SizedBox(height: 50),

                ///AMC of Fire Protection & Detection Systems
                Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.12),
                    height: 75,
                    width: width,
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'AMC of Fire Protection & Detection Systems',
                        style: heading,
                      ),
                    )),
                SizedBox(
                  height: 250,
                  child: Center(
                    child: Image.asset('assets/images/services/Fire-safety-training-for-employees.jpg'),
                  ),
                ),
                const SizedBox(
                  height:35
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.10),
                  child: Text(
                    'A comprehensive Annual Maintenance Contract is an agreement with a service provider for the repair and maintenance of property used by any organization. It offers security on all services of facilities supplied, installed, and commissioned by the Service Provider. Comprehensive contracts are required and essential for in-depth and detail-oriented service support post-warranty period.\n'
                    'Textel provides Annual maintenance contract service for all types of fire protection and detection systems.\n\n'
                    'Textel’s AMC shall ensure regular Inspection, Testing & Maintenance of Fire Protection system consisting of Fire Automatic sprinkler, Hydrant valve, First-aid hose reel, Alarm Gong bell, Hose Box, Fire Brigade Inlet, Brass ball valve, Air release valve, Butterfly valve, Branch pipe and nozzle, RRL Hose pipe, Coupling of RRL Hose, Welding, Painting of Hydrant pipe line, sprinkler pipeline, Raiser, Drainage line, Bypass line, Elbow, Reducer, Tee, Socket with Flange, Draining of water from Hydrant & Sprinkler lines, Refilling of water from the tank. Flow rate testing of the sprinkler head, wet raiser, Hydrant valve, and First-aid Hose reel and Refilling and maintenance of all fire Extinguishers.\n\n'
                    'AMC of Fire Detection Systems consists of inspection, testing, and maintenance for Fire detection systems consisting of Fire alarm control panels, Smoke detectors (cleaning of all detectors with suitable means)) and Inspection of all Fire Sensors by facilitating approved smoke tester to all devices installed on each floor, Manual call point, Hooter cum strobe light, network booster, and Indoor siren. Checking and inspection of AC battery LED signage and photo-luminescent signage and also attending to any breakdown & emergency calls immediately, including provisioning of skilled & qualified supervisor at AMC Site as per Odisha Fire Department for ensuring proper maintenance support including regular fortnight training to all security and maintenance staff.\n\n',
                    style: body,
                  ),
                ),
                const SizedBox(height: 35),

                ///Fire Extinguishers Refilling
                Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.12),
                    height: 75,
                    width: width,
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Fire Extinguishers Refilling',
                        style: heading,
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.10),
                  child: Text(
                    'We engage by providing a reliable Extinguisher refilling service. Keeping all existing safety factors in mind, we refill the fire extinguishers for uninterrupted and continuous usage for any sort of such as ABC stored pressure, dry chemical powder fire extinguishers, Co2 fire extinguishers, AFFF mechanical foam fire extinguishers, Clean Agent Fire extinguishers, automatic fire extinguishers, and all HFC-227 (FM200) fire extinguishers, etc. In other words, a must to contact us once for the best fire cylinder refilling, inspection, drill training, testing, and recharging. We establish close coordination with clients and our experts help focus on delivery on time thereby maintaining a trustworthy.',
                    style: body,
                  ),
                ),
                const SizedBox(height: 50),
                const Footer(),
              ],
            )));
  }
}
