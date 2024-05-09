// To parse this JSON data, do
//
//     final countrymodel = countrymodelFromMap(jsonString);

import 'dart:convert';

Countrymodel countrymodelFromMap(String str) =>
    Countrymodel.fromMap(json.decode(str));

String countrymodelToMap(Countrymodel data) => json.encode(data.toMap());

class Countrymodel {
  Name? name;
  List<String>? tld;
  String? cca2;
  String? ccn3;
  String? cca3;
  String? cioc;
  bool? independent;
  String? status;
  bool? unMember;
  Currencies? currencies;
  Idd? idd;
  List<String>? capital;
  List<String>? altSpellings;
  String? region;
  String? subregion;
  Languages? languages;
  Map<String, Translation>? translations;
  List<double>? latlng;
  bool? landlocked;
  List<String>? borders;
  double? area;
  Demonyms? demonyms;
  String? flag;
  Maps? maps;
  int? population;
  // Gini? gini;
  String? fifa;
  Car? car;
  List<String>? timezones;
  List<String>? continents;
  Flags? flags;
  CoatOfArms? coatOfArms;
  String? startOfWeek;
  CapitalInfo? capitalInfo;
  PostalCode? postalCode;

  Countrymodel({
    this.name,
    this.tld,
    this.cca2,
    this.ccn3,
    this.cca3,
    this.cioc,
    this.independent,
    this.status,
    this.unMember,
    this.currencies,
    this.idd,
    this.capital,
    this.altSpellings,
    this.region,
    this.subregion,
    this.languages,
    this.translations,
    this.latlng,
    this.landlocked,
    this.borders,
    this.area,
    this.demonyms,
    this.flag,
    this.maps,
    this.population,
    // this.gini,
    this.fifa,
    this.car,
    this.timezones,
    this.continents,
    this.flags,
    this.coatOfArms,
    this.startOfWeek,
    this.capitalInfo,
    this.postalCode,
  });

  factory Countrymodel.fromMap(Map<String, dynamic> json) {
    return Countrymodel(
      name: json.containsKey('name') ? Name.fromMap(json['name']) : null,
      tld: json.containsKey('tld') ? List<String>.from(json['tld']) : null,
      cca2: json['cca2'],
      ccn3: json['ccn3'],
      cca3: json['cca3'],
      cioc: json['cioc'],
      independent: json['independent'],
      status: json['status'],
      unMember: json['unMember'],
      currencies: json.containsKey('currencies')
          ? Currencies.fromMap(json['currencies'])
          : null,
      idd: json.containsKey('idd') ? Idd.fromMap(json['idd']) : null,
      capital: json.containsKey('capital')
          ? List<String>.from(json['capital'])
          : null,
      altSpellings: json.containsKey('altSpellings')
          ? List<String>.from(json['altSpellings'])
          : null,
      region: json['region'],
      subregion: json['subregion'],
      languages: json.containsKey('languages')
          ? Languages.fromMap(json['languages'])
          : null,
      translations: json.containsKey('translations')
          ? (json['translations'] as Map<String, dynamic>)
              .map((key, value) => MapEntry(key, Translation.fromMap(value)))
          : null,
      // translations: json.containsKey('translations')
      //     ? Map<String, Translation>.from(json['translations'])
      //     : null,
      latlng:
          json.containsKey('latlng') ? List<double>.from(json['latlng']) : null,
      landlocked: json['landlocked'],
      borders: json.containsKey('borders')
          ? List<String>.from(json['borders'])
          : null,
      area: json['area'],
      demonyms: json.containsKey('demonyms')
          ? Demonyms.fromMap(json['demonyms'])
          : null,
      flag: json['flag'],
      maps: json.containsKey('maps') ? Maps.fromMap(json['maps']) : null,
      population: json['population'],
      // gini: Gini.fromMap(json["gini"]),
      fifa: json['fifa'],
      car: json.containsKey('car') ? Car.fromMap(json['car']) : null,
      timezones: json.containsKey('timezones')
          ? List<String>.from(json['timezones'])
          : null,
      continents: json.containsKey('continents')
          ? List<String>.from(json['continents'])
          : null,
      flags: json.containsKey('flags') ? Flags.fromMap(json['flags']) : null,
      coatOfArms: json.containsKey('coatOfArms')
          ? CoatOfArms.fromMap(json['coatOfArms'])
          : null,
      startOfWeek: json['startOfWeek'],
      capitalInfo: json.containsKey('capitalInfo')
          ? CapitalInfo.fromMap(json['capitalInfo'])
          : null,
      postalCode: json.containsKey('postalCode')
          ? PostalCode.fromMap(json['postalCode'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name?.toMap(),
      "tld": tld,
      "cca2": cca2,
      "ccn3": ccn3,
      "cca3": cca3,
      "cioc": cioc,
      "independent": independent,
      "status": status,
      "unMember": unMember,
      "currencies": currencies?.toMap(),
      "idd": idd?.toMap(),
      "capital": capital,
      "altSpellings": altSpellings,
      "region": region,
      "subregion": subregion,
      "languages": languages?.toMap(),
      "translations": translations != null
          ? Map.from(translations!)
              .map((k, v) => MapEntry<String, dynamic>(k, v.toMap()))
          : null,
      "latlng": latlng,
      "landlocked": landlocked,
      "borders": borders,
      "area": area,
      "demonyms": demonyms?.toMap(),
      "flag": flag,
      "maps": maps?.toMap(),
      "population": population,
      // "gini": gini.toMap(),
      "fifa": fifa,
      "car": car?.toMap(),
      "timezones": timezones,
      "continents": continents,
      "flags": flags?.toMap(),
      "coatOfArms": coatOfArms?.toMap(),
      "startOfWeek": startOfWeek,
      "capitalInfo": capitalInfo?.toMap(),
      "postalCode": postalCode?.toMap(),
    };
  }
}

class CapitalInfo {
  List<double> latlng;

  CapitalInfo({
    required this.latlng,
  });

  factory CapitalInfo.fromMap(Map<String, dynamic> json) => CapitalInfo(
        latlng: List<double>.from(json["latlng"].map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toMap() => {
        "latlng": List<dynamic>.from(latlng.map((x) => x)),
      };
}

class Car {
  List<String> signs;
  String side;

  Car({
    required this.signs,
    required this.side,
  });

  factory Car.fromMap(Map<String, dynamic> json) => Car(
        signs: List<String>.from(json["signs"].map((x) => x)),
        side: json["side"],
      );

  Map<String, dynamic> toMap() => {
        "signs": List<dynamic>.from(signs.map((x) => x)),
        "side": side,
      };
}

// class CoatOfArms {
//   String png;
//   String svg;

//   CoatOfArms({
//     required this.png,
//     required this.svg,
//   });

//   factory CoatOfArms.fromMap(Map<String, dynamic> json) => CoatOfArms(
//         png: json["png"],
//         svg: json["svg"],
//       );

//   Map<String, dynamic> toMap() => {
//         "png": png,
//         "svg": svg,
//       };
// }

class CoatOfArms {
  String? png;
  String? svg;

  CoatOfArms({
    this.png,
    this.svg,
  });

  factory CoatOfArms.fromMap(Map<String, dynamic>? json) {
    if (json == null) {
      return CoatOfArms(
          png: null,
          svg:
              null); // Return CoatOfArms instance with null values if json is null
    }
    return CoatOfArms(
      png: json.containsKey("png") ? json["png"] : null,
      svg: json.containsKey("svg") ? json["svg"] : null,
    );
  }

  Map<String, dynamic> toMap() => {
        "png": png,
        "svg": svg,
      };
}

class Currencies {
  Mdl? mdl; // Make mdl field nullable

  Currencies({
    required this.mdl,
  });

  factory Currencies.fromMap(Map<String, dynamic>? json) {
    if (json == null) {
      return Currencies(
          mdl:
              null); // Return Currencies instance with mdl set to null if json is null
    }
    // Check if "MDL" key exists in json and if its value is not null
    if (json.containsKey("MDL") && json["MDL"] != null) {
      return Currencies(
        mdl: Mdl.fromMap(json["MDL"]), // Parse "MDL" value
      );
    } else {
      return Currencies(
          mdl:
              null); // Return Currencies instance with mdl set to null if "MDL" is null or absent
    }
  }

  Map<String, dynamic> toMap() => {
        "MDL": mdl
            ?.toMap(), // Use safe navigation operator to access toMap() method if mdl is not null
      };
}

// class Currencies {
//   Mdl mdl;

//   Currencies({
//     required this.mdl,
//   });

//   factory Currencies.fromMap(Map<String, dynamic> json) => Currencies(
//         mdl: Mdl.fromMap(json["MDL"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "MDL": mdl.toMap(),
//       };
// }

class Mdl {
  String name;
  String symbol;

  Mdl({
    required this.name,
    required this.symbol,
  });

  factory Mdl.fromMap(Map<String, dynamic> json) => Mdl(
        name: json["name"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "symbol": symbol,
      };
}

class Demonyms {
  Eng? eng;
  Eng? fra;

  Demonyms({
    this.eng,
    this.fra,
  });

  factory Demonyms.fromMap(Map<String, dynamic>? json) {
    if (json == null) {
      return Demonyms(
          eng: null,
          fra:
              null); // Return Demonyms instance with null values if json is null
    }
    return Demonyms(
      eng: json.containsKey("eng") ? Eng.fromMap(json["eng"]) : null,
      fra: json.containsKey("fra") ? Eng.fromMap(json["fra"]) : null,
    );
  }

  Map<String, dynamic> toMap() => {
        "eng": eng?.toMap(),
        "fra": fra?.toMap(),
      };
}

// class Demonyms {
//   Eng eng;
//   Eng fra;

//   Demonyms({
//     required this.eng,
//     required this.fra,
//   });

//   factory Demonyms.fromMap(Map<String, dynamic> json) => Demonyms(
//         eng: Eng.fromMap(json["eng"]),
//         fra: Eng.fromMap(json["fra"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "eng": eng.toMap(),
//         "fra": fra.toMap(),
//       };
// }

class Eng {
  String f;
  String m;

  Eng({
    required this.f,
    required this.m,
  });

  factory Eng.fromMap(Map<String, dynamic> json) => Eng(
        f: json["f"],
        m: json["m"],
      );

  Map<String, dynamic> toMap() => {
        "f": f,
        "m": m,
      };
}

class Flags {
  String? png;
  String? svg;
  String? alt;

  Flags({
    this.png,
    this.svg,
    this.alt,
  });

  factory Flags.fromMap(Map<String, dynamic>? json) {
    if (json == null) {
      return Flags(
          png: null,
          svg: null,
          alt: null); // Return Flags instance with null values if json is null
    }
    return Flags(
      png: json.containsKey("png") ? json["png"] : null,
      svg: json.containsKey("svg") ? json["svg"] : null,
      alt: json.containsKey("alt") ? json["alt"] : null,
    );
  }

  Map<String, dynamic> toMap() => {
        "png": png,
        "svg": svg,
        "alt": alt,
      };
}

// class Gini {
//   double the2018;

//   Gini({
//     required this.the2018,
//   });

//   factory Gini.fromMap(Map<String, dynamic> json) => Gini(
//         the2018: json["2018"]?.toDouble(),
//       );

//   Map<String, dynamic> toMap() => {
//         "2018": the2018,
//       };
// }

class Idd {
  String? root;
  List<String>? suffixes;

  Idd({
    this.root,
    this.suffixes,
  });

  factory Idd.fromMap(Map<String, dynamic>? json) {
    if (json == null) {
      return Idd(
          root: null,
          suffixes:
              null); // Return Idd instance with null values if json is null
    }
    return Idd(
      root: json.containsKey("root") ? json["root"] : null,
      suffixes: json.containsKey("suffixes")
          ? List<String>.from(json["suffixes"].map((x) => x))
          : null,
    );
  }

  Map<String, dynamic> toMap() => {
        "root": root,
        "suffixes": suffixes,
      };
}

class Languages {
  String? ron; // Make ron field nullable

  Languages({
    required this.ron,
  });

  factory Languages.fromMap(Map<String, dynamic>? json) {
    // Check if json is null or if "ron" key is absent
    if (json == null || !json.containsKey("ron")) {
      return Languages(
          ron: null); // Return Languages instance with ron set to null
    } else {
      // If "ron" key exists, assign its value to ron field
      return Languages(ron: json["ron"]);
    }
  }

  Map<String, dynamic> toMap() => {
        "ron": ron,
      };
}

class Maps {
  String googleMaps;
  String openStreetMaps;

  Maps({
    required this.googleMaps,
    required this.openStreetMaps,
  });

  factory Maps.fromMap(Map<String, dynamic> json) => Maps(
        googleMaps: json["googleMaps"],
        openStreetMaps: json["openStreetMaps"],
      );

  Map<String, dynamic> toMap() => {
        "googleMaps": googleMaps,
        "openStreetMaps": openStreetMaps,
      };
}

class Name {
  String common;
  String official;
  NativeName nativeName;

  Name({
    required this.common,
    required this.official,
    required this.nativeName,
  });

  factory Name.fromMap(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
        nativeName: NativeName.fromMap(json["nativeName"]),
      );

  Map<String, dynamic> toMap() => {
        "common": common,
        "official": official,
        "nativeName": nativeName.toMap(),
      };
}

class NativeName {
  Translation? ron; // Mark ron field as nullable

  NativeName({
    required this.ron,
  });

  factory NativeName.fromMap(Map<String, dynamic>? json) {
    if (json == null) {
      // If json is null, return a NativeName instance with ron set to null
      return NativeName(ron: null);
    }
    return NativeName(
      ron: json.containsKey("ron") ? Translation.fromMap(json["ron"]) : null,
    );
  }

  Map<String, dynamic> toMap() => {
        "ron": ron
            ?.toMap(), // Use the safe navigation operator ?. to access ron's toMap() method
      };
}

class Translation {
  String official;
  String common;

  Translation({
    required this.official,
    required this.common,
  });

  factory Translation.fromMap(Map<String, dynamic> json) => Translation(
        official: json["official"],
        common: json["common"],
      );

  Map<String, dynamic> toMap() => {
        "official": official,
        "common": common,
      };
}

class PostalCode {
  String format;
  String regex;

  PostalCode({
    required this.format,
    required this.regex,
  });

  factory PostalCode.fromMap(Map<String, dynamic> json) => PostalCode(
        format: json["format"],
        regex: json["regex"],
      );

  Map<String, dynamic> toMap() => {
        "format": format,
        "regex": regex,
      };
}
