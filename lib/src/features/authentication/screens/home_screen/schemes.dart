import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class Schemes extends StatefulWidget {
  const Schemes({Key? key}) : super(key: key);

  @override
  State<Schemes> createState() => _SchemesState();
}

class _SchemesState extends State<Schemes> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            color: Color(0xFFFCF3F8),
            child: Column(
              children: [
                const Text('Schemes', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800, color: Color(0xFF583608)),),
                Divider(color: Color(0xFF583608),),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFE4B975),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Kisan Credit Card',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF583608),
                        ),
                      ),
                      const ReadMoreText(
                        "The KCC Scheme was introduced with the objective of providing adequate and timely credit to the farmers for their agricultural operations. The Government of India provides interest subvention of 2% and Prompt Repayment Incentive of 3% to the farmers, thus making the credit available at a very subsidized rate of 4% per annum.\nThe scheme was further extended for the investment credit requirement of farmers viz. allied and non-farm activities in the year 2004 and further revisited in 2012 by a working Group under the Chairmanship of Shri T. M. Bhasin, CMD, Indian Bank with a view to simplify the scheme and facilitate issue of Electronic Kisan Credit Cards. The scheme provides broad guidelines to banks for operationalizing the KCC scheme. Implementing banks will have the discretion to adopt the same to suit institution/location-specific requirements.",
                        trimLines: 2,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show More',
                        trimExpandedText: 'Show Less',
                        moreStyle: TextStyle(fontSize: 16, color: Colors.deepPurple),
                        lessStyle: TextStyle(fontSize: 16, color: Colors.deepPurple),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {
                            launchUrl(Uri.parse('https://myscheme.gov.in/schemes/kcc'), mode: LaunchMode.inAppWebView);
                          },
                          child: Text('More Details'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF583608),
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFB0BCBC),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pradhan Mantri Fasal Bima Yojna',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF364242),
                        ),
                      ),
                      const ReadMoreText(
                        "The PMFBY works on the One Nation, One Crop, One Premium. To provide insurance coverage and financial support to the farmers in the event of failure of any of the notified crops as a result of natural calamities, pests & diseases.",
                        trimLines: 2,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show More',
                        trimExpandedText: 'Show Less',
                        moreStyle: TextStyle(fontSize: 16, color: Colors.deepPurple),
                        lessStyle: TextStyle(fontSize: 16, color: Colors.deepPurple),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {
                            launchUrl(Uri.parse('https://www.myscheme.gov.in/schemes/pmfby'), mode: LaunchMode.inAppWebView);
                          },
                          child: Text('More Details'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF364242),
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFBBB3CB),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Agri-Clinics And Agri-Business Centres Scheme',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF4B4166),
                        ),
                      ),
                      const ReadMoreText(
                        "A welfare scheme by the Ministry of Agriculture and Farmers' Welfare was launched in 2002. AC&ABC aims at agricultural development by supplementing the efforts of public extension by providing extension and other services to farmers either on a payment basis or free of cost as per the business model of agri-preneur, local needs, and affordability of the target group of farmers. AC&ABC creates gainful self-employment opportunities for unemployed agricultural graduates, agricultural diploma holders, intermediate in agriculture, and biological science graduates with PG in agri-related courses.",
                        trimLines: 2,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show More',
                        trimExpandedText: 'Show Less',
                        moreStyle: TextStyle(fontSize: 16, color: Colors.deepPurple),
                        lessStyle: TextStyle(fontSize: 16, color: Colors.deepPurple),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {
                            launchUrl(Uri.parse('https://myscheme.gov.in/schemes/kcc'), mode: LaunchMode.inAppWebView);
                          },
                          child: Text('More Details'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF4B4166),
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFCB9CA4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Krishi Unnati Yojana - MOVCDNER',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF60272D),
                        ),
                      ),
                      const ReadMoreText(
                        "Realizing the potential of organic farming in the North Eastern Region of the country Ministry of Agriculture and Farmer Welfare has launched a Central Sector Scheme entitled “Mission Organic Value Chain Development for North Eastern Region\" for implementation in the states of Arunachal Pradesh, Assam, Manipur, Meghalaya, Mizoram, Nagaland, Sikkim and Tripura, during the 12th plan period. The scheme aims at development of certified organic production in a value chain mode to link growers with consumers and to support the development of entire value chain starting from inputs, seeds, and certification, to the creation of facilities for collection, aggregation, processing marketing and brand building initiative.",
                        trimLines: 2,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show More',
                        trimExpandedText: 'Show Less',
                        moreStyle: TextStyle(fontSize: 16, color: Colors.deepPurple),
                        lessStyle: TextStyle(fontSize: 16, color: Colors.deepPurple),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {
                            launchUrl(Uri.parse('https://www.myscheme.gov.in/schemes/kuy-movcdner'), mode: LaunchMode.inAppWebView);
                          },
                          child: Text('More Details'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF60272D),
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF9DCBC9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Agricultural Marketing Infrastructure',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF075852),
                        ),
                      ),
                      const ReadMoreText(
                        "The scheme envisages value addition and processing at farmers level so as to enhance their income by selling more marketable and processed produce in the market. For creation of Agricultural Marketing Infrastructure including scientific Storage capacity, the Ministry of Agriculture & Farmers Welfare, Govt. of India is implementing capital subsidy sub-scheme “Agricultural Marketing Infrastructure (AMI)” of Integrated Scheme for Agricultural Marketing (ISAM) across the country and is continued till 31.03.2026",
                        trimLines: 2,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show More',
                        trimExpandedText: 'Show Less',
                        moreStyle: TextStyle(fontSize: 16, color: Colors.deepPurple),
                        lessStyle: TextStyle(fontSize: 16, color: Colors.deepPurple),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {
                            launchUrl(Uri.parse('https://www.myscheme.gov.in/schemes/ami'), mode: LaunchMode.inAppWebView);
                          },
                          child: Text('More Details'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF075852),
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFE4B975),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'National Mission on Natural Farming',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF614112),
                        ),
                      ),
                      const ReadMoreText(
                        "National Mission on Natural farming aims at creating institutional capacities for documentation and dissemination of best practices, make practicing farmers as partners in promotion strategy, ensure capacity building and continuous handholding and finally attracting farmers to the natural farming willingly on the merit of the system. ",
                        trimLines: 2,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show More',
                        trimExpandedText: 'Show Less',
                        moreStyle: TextStyle(fontSize: 16, color: Colors.deepPurple),
                        lessStyle: TextStyle(fontSize: 16, color: Colors.deepPurple),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {
                            launchUrl(Uri.parse('https://www.myscheme.gov.in/schemes/nmnf'), mode: LaunchMode.inAppWebView);
                          },
                          child: Text('More Details'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF614112),
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFB0BCBC),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'RKVY Soil Health and Fertility - Soil Health Card',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF3D4949),
                        ),
                      ),
                      const ReadMoreText(
                        "SHC can be downloaded by the farmers from the SHC portal or through SMS link received on mobile. It will contain the status of his soil with respect to 12 parameters, namely N,P,K, S (Macro-nutrients); Zn, Fe, Cu, Mn, Bo (Micro - nutrients) ; and pH, EC, OC. Based on this, the SHC will also indicate fertilizer recommendations and soil amendment required for the farm.",
                        trimLines: 2,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show More',
                        trimExpandedText: 'Show Less',
                        moreStyle: TextStyle(fontSize: 16, color: Colors.deepPurple),
                        lessStyle: TextStyle(fontSize: 16, color: Colors.deepPurple),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {
                            launchUrl(Uri.parse('https://www.myscheme.gov.in/schemes/rkvyshfshc'), mode: LaunchMode.inAppWebView);
                          },
                          child: Text('More Details'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF3D4949),
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFBBB3CB),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'National Beekeeping & Honey Mission',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF453B60),
                        ),
                      ),
                      const ReadMoreText(
                        "ain objectives of the scheme are:\na)	Promoting holistic growth of beekeeping industry for income & employment generation, providing livelihood support to farm and non-farm households and to enhance agriculture/ horticulture production;\nb)	Developing additional infrastructural facilities for developing quality nucleus stock of honeybees, multiplication of stock by bee breeders, setting up of disease diagnostic labs, Integrated Beekeeping Development Centres (IBDCs)/ Centres of Excellence (CoEs) on Beekeeping, beekeeping equipment manufacturing units, etc. and postharvest and marketing infrastructures, including honey processing plants, storages/ cold storages, collection, branding,marketing, centre,etc.",
                        trimLines: 2,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show More',
                        trimExpandedText: 'Show Less',
                        moreStyle: TextStyle(fontSize: 16, color: Colors.deepPurple),
                        lessStyle: TextStyle(fontSize: 16, color: Colors.deepPurple),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {
                            launchUrl(Uri.parse('https://www.myscheme.gov.in/schemes/nbhm'), mode: LaunchMode.inAppWebView);
                          },
                          child: Text('More Details'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF453B60),
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFCB9CA4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pradhan Mantri Krishi Sinchayee Yojana: Per Drop More Crop',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF5F282D),
                        ),
                      ),
                      const ReadMoreText(
                        "The scheme “Pradhan Mantri Krishi Sinchayee Yojana: Per Drop More Crop” was launched by the Dept. of Agriculture & Farmers Welfare, Ministry of Agriculture & Farmers Welfare, Govt. of India on 1st July 2015. The scheme mainly focuses on enhancing water use efficiency at the farm level through Micro Irrigation (Drip and Sprinkler Irrigation System). Besides, it also supports micro-level water storage, and water conservation/management activities (Other Interventions) to supplement source creation for Micro Irrigation.",
                        trimLines: 2,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show More',
                        trimExpandedText: 'Show Less',
                        moreStyle: TextStyle(fontSize: 16, color: Colors.deepPurple),
                        lessStyle: TextStyle(fontSize: 16, color: Colors.deepPurple),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {
                            launchUrl(Uri.parse('https://www.myscheme.gov.in/schemes/pmksypdmc'), mode: LaunchMode.inAppWebView);
                          },
                          child: Text('More Details'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF5F282D),
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF9DCBC9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'RKVY Soil Health and Fertility Village level Soil Testing Lab',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF075852),
                        ),
                      ),
                      const ReadMoreText(
                        "Village level labs can be set up by rural youth, village-level entrepreneurs, including SHGs set up under The Rural Awareness Works Experience (RAWE) programme, Krishi Sakhis, students of government schools, and agriculture graduates from SAUs, PACS, etc. The labs should be operated by local youth.\nUnder the scheme, a one-time financial assistance of Rs 1.5 lakh will be given for establishment of VLSTL.",
                        trimLines: 2,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show More',
                        trimExpandedText: 'Show Less',
                        moreStyle: TextStyle(fontSize: 16, color: Colors.deepPurple),
                        lessStyle: TextStyle(fontSize: 16, color: Colors.deepPurple),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {
                            launchUrl(Uri.parse('https://www.myscheme.gov.in/schemes/rkvyshfvlstl'), mode: LaunchMode.inAppWebView);
                          },
                          child: Text('More Details'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF075852),
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFE4B974),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pradhan Mantri Kisan Samman Nidhi',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF6A4519),
                        ),
                      ),
                      const ReadMoreText(
                        "The scheme aims to supplement the financial needs of all landholding farmers’ families by procuring various inputs to ensure proper crop health and appropriate yields, commensurate with the anticipated farm income as well as for domestic needs. Under the scheme an amount of ₹ 6000/- per year is released by the Central Government online directly into the bank accounts of the eligible farmers under Direct Benefit Transfer mode, subject to certain exclusions. ",
                        trimLines: 2,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show More',
                        trimExpandedText: 'Show Less',
                        moreStyle: TextStyle(fontSize: 16, color: Colors.deepPurple),
                        lessStyle: TextStyle(fontSize: 16, color: Colors.deepPurple),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {
                            launchUrl(Uri.parse('https://www.myscheme.gov.in/schemes/pm-kisan'), mode: LaunchMode.inAppWebView);
                          },
                          child: Text('More Details'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF6A4519),
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFB0BCBC),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Rainfed Area Development',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF3D4949),
                        ),
                      ),
                      const ReadMoreText(
                        "Rainfed Area Development (RAD) scheme was launched in 2014-15 to mainstream development of rainfed areas in a sustainable manner. It adopts an area-based approach, focuses on Integrated Farming System (IFS) for enhancing productivity and minimizing risks associated with climatic variability. Under this system, crops/ cropping system is integrated with activities like horticulture, livestock, fishery, agro-forestry, apiculture etc. to enable farmers not only in maximizing farm returns for sustaining livelihood, but also to mitigate the impacts of drought, flood or other extreme weather events with the income opportunity from allied activities during crop damage.",
                        trimLines: 2,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show More',
                        trimExpandedText: 'Show Less',
                        moreStyle: TextStyle(fontSize: 16, color: Colors.deepPurple),
                        lessStyle: TextStyle(fontSize: 16, color: Colors.deepPurple),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {
                            launchUrl(Uri.parse('https://www.myscheme.gov.in/schemes/rad'), mode: LaunchMode.inAppWebView);
                          },
                          child: Text('More Details'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF3D4949),
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
