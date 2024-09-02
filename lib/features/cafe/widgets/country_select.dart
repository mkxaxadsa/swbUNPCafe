import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_m.dart';
import '../../../core/widgets/texts/text_r.dart';

class CountrySelect extends StatefulWidget {
  const CountrySelect({super.key, required this.onSelect});

  final void Function(String) onSelect;

  @override
  State<CountrySelect> createState() => _CountrySelectState();
}

class _CountrySelectState extends State<CountrySelect> {
  final scroll = ScrollController();
  bool active = false;
  String country = 'United States';

  void onTap() {
    setState(() {
      active = !active;
    });
    print(active);
  }

  void selectCountry(String value) {
    setState(() {
      country = value;
      active = false;
    });
    widget.onSelect(country);
  }

  List<String> countries = [
    'Afghanistan',
    'Albania',
    'Algeria',
    'Andorra',
    'Angola',
    'Antigua and Barbuda',
    'Argentina',
    'Armenia',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahamas',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Belarus',
    'Belgium',
    'Belize',
    'Benin',
    'Bhutan',
    'Bolivia',
    'Bosnia and Herzegovina',
    'Botswana',
    'Brazil',
    'Brunei',
    'Bulgaria',
    'Burkina Faso',
    'Burundi',
    'Cabo Verde',
    'Cambodia',
    'Cameroon',
    'Canada',
    'Central African Republic',
    'Chad',
    'Chile',
    'China',
    'Colombia',
    'Comoros',
    'Congo',
    'Costa Rica',
    'Croatia',
    'Cuba',
    'Cyprus',
    'Czech Republic',
    'Democratic Republic of the Congo',
    'Denmark',
    'Djibouti',
    'Dominica',
    'Dominican Republic',
    'East Timor',
    'Ecuador',
    'Egypt',
    'El Salvador',
    'Equatorial Guinea',
    'Eritrea',
    'Estonia',
    'Eswatini',
    'Ethiopia',
    'Fiji',
    'Finland',
    'France',
    'Gabon',
    'Gambia',
    'Georgia',
    'Germany',
    'Ghana',
    'Greece',
    'Grenada',
    'Guatemala',
    'Guinea',
    'Guinea-Bissau',
    'Guyana',
    'Haiti',
    'Honduras',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Ireland',
    'Israel',
    'Italy',
    'Ivory Coast',
    'Jamaica',
    'Japan',
    'Jordan',
    'Kazakhstan',
    'Kenya',
    'Kiribati',
    'Kuwait',
    'Kyrgyzstan',
    'Laos',
    'Latvia',
    'Lebanon',
    'Lesotho',
    'Liberia',
    'Libya',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Madagascar',
    'Malawi',
    'Malaysia',
    'Maldives',
    'Mali',
    'Malta',
    'Marshall Islands',
    'Mauritania',
    'Mauritius',
    'Mexico',
    'Micronesia',
    'Moldova',
    'Monaco',
    'Mongolia',
    'Montenegro',
    'Morocco',
    'Mozambique',
    'Myanmar',
    'Namibia',
    'Nauru',
    'Nepal',
    'Netherlands',
    'New Zealand',
    'Nicaragua',
    'Niger',
    'Nigeria',
    'North Korea',
    'North Macedonia',
    'Norway',
    'Oman',
    'Pakistan',
    'Palau',
    'Panama',
    'Papua New Guinea',
    'Paraguay',
    'Peru',
    'Philippines',
    'Poland',
    'Portugal',
    'Qatar',
    'Romania',
    'Russia',
    'Rwanda',
    'Saint Kitts and Nevis',
    'Saint Lucia',
    'Saint Vincent and the Grenadines',
    'Samoa',
    'San Marino',
    'Sao Tome and Principe',
    'Saudi Arabia',
    'Senegal',
    'Serbia',
    'Seychelles',
    'Sierra Leone',
    'Singapore',
    'Slovakia',
    'Slovenia',
    'Solomon Islands',
    'Somalia',
    'South Africa',
    'South Korea',
    'South Sudan',
    'Spain',
    'Sri Lanka',
    'Sudan',
    'Suriname',
    'Sweden',
    'Switzerland',
    'Syria',
    'Taiwan',
    'Tajikistan',
    'Tanzania',
    'Thailand',
    'Togo',
    'Tonga',
    'Trinidad and Tobago',
    'Tunisia',
    'Turkey',
    'Turkmenistan',
    'Tuvalu',
    'Uganda',
    'Ukraine',
    'United Arab Emirates',
    'United Kingdom',
    'United States',
    'Uruguay',
    'Uzbekistan',
    'Vanuatu',
    'Vatican City',
    'Venezuela',
    'Vietnam',
    'Yemen',
    'Zambia',
    'Zimbabwe'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: active ? AppColors.white : AppColors.textField,
            borderRadius: BorderRadius.circular(8),
            border: active
                ? Border.all(
                    width: 2,
                    color: AppColors.purple2,
                  )
                : null,
          ),
          child: CupertinoButton(
            onPressed: onTap,
            padding: EdgeInsets.zero,
            minSize: 50,
            child: Row(
              children: [
                const SizedBox(width: 14),
                TextM(
                  country,
                  fontSize: 15,
                  color: AppColors.grey1,
                ),
                const Spacer(),
                RotatedBox(
                  quarterTurns: active ? 2 : 4,
                  child: SvgPicture.asset(
                    'assets/chevron.svg',
                    color: active ? AppColors.black : AppColors.grey1,
                  ),
                ),
                const SizedBox(width: 14),
              ],
            ),
          ),
        ),
        if (active) ...[
          const SizedBox(height: 5),
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  blurRadius: 96,
                  color: const Color(0xff230B4E).withOpacity(0.5),
                  offset: const Offset(0, 36),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: RawScrollbar(
                controller: scroll,
                radius: const Radius.circular(2),
                padding: const EdgeInsets.only(right: 8),
                thumbColor: AppColors.pink1,
                thickness: 4,
                child: ListView.builder(
                  controller: scroll,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  itemCount: countries.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 30,
                      color: country == countries[index]
                          ? AppColors.purple2
                          : AppColors.white,
                      child: CupertinoButton(
                        onPressed: () {
                          selectCountry(countries[index]);
                        },
                        padding: EdgeInsets.zero,
                        minSize: 30,
                        child: Row(
                          children: [
                            const SizedBox(width: 24),
                            TextR(
                              countries[index],
                              fontSize: 15,
                              color: country == countries[index]
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
