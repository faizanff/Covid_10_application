/// updated : 1695711065442
/// cases : 695750008
/// todayCases : 2
/// deaths : 6919476
/// todayDeaths : 0
/// recovered : 667793648
/// todayRecovered : 4228
/// active : 21036884
/// critical : 38063
/// casesPerOneMillion : 89258
/// deathsPerOneMillion : 887.7
/// tests : 7006718691
/// testsPerOneMillion : 881910.12
/// population : 7944935131
/// oneCasePerPeople : 0
/// oneDeathPerPeople : 0
/// oneTestPerPeople : 0
/// activePerOneMillion : 2647.84
/// recoveredPerOneMillion : 84052.75
/// criticalPerOneMillion : 4.79
/// affectedCountries : 231

class WorldStatsModel {
  WorldStatsModel({
       required  num updated,
    required num cases,
    required num todayCases,
    required num deaths,
    required num todayDeaths,
    required num recovered,
    required num todayRecovered,
    required num active,
    required num critical,
    required num casesPerOneMillion,
    required num deathsPerOneMillion,
    required num tests,
    required num testsPerOneMillion,
    required num population,
    required num oneCasePerPeople,
    required num oneDeathPerPeople,
    required num oneTestPerPeople,
    required num activePerOneMillion,
    required num recoveredPerOneMillion,
    required num criticalPerOneMillion,
    required num affectedCountries,}){
    _updated = updated;
    _cases = cases;
    _todayCases = todayCases;
    _deaths = deaths;
    _todayDeaths = todayDeaths;
    _recovered = recovered;
    _todayRecovered = todayRecovered;
    _active = active;
    _critical = critical;
    _casesPerOneMillion = casesPerOneMillion;
    _deathsPerOneMillion = deathsPerOneMillion;
    _tests = tests;
    _testsPerOneMillion = testsPerOneMillion;
    _population = population;
    _oneCasePerPeople = oneCasePerPeople;
    _oneDeathPerPeople = oneDeathPerPeople;
    _oneTestPerPeople = oneTestPerPeople;
    _activePerOneMillion = activePerOneMillion;
    _recoveredPerOneMillion = recoveredPerOneMillion;
    _criticalPerOneMillion = criticalPerOneMillion;
    _affectedCountries = affectedCountries;
}

   WorldStatsModel.fromJson(dynamic json) {
    _updated = json['updated'];
    _cases = json['cases'];
    _todayCases = json['todayCases'];
    _deaths = json['deaths'];
    _todayDeaths = json['todayDeaths'];
    _recovered = json['recovered'];
    _todayRecovered = json['todayRecovered'];
    _active = json['active'];
    _critical = json['critical'];
    _casesPerOneMillion = json['casesPerOneMillion'];
    _deathsPerOneMillion = json['deathsPerOneMillion'];
    _tests = json['tests'];
    _testsPerOneMillion = json['testsPerOneMillion'];
    _population = json['population'];
    _oneCasePerPeople = json['oneCasePerPeople'];
    _oneDeathPerPeople = json['oneDeathPerPeople'];
    _oneTestPerPeople = json['oneTestPerPeople'];
    _activePerOneMillion = json['activePerOneMillion'];
    _recoveredPerOneMillion = json['recoveredPerOneMillion'];
    _criticalPerOneMillion = json['criticalPerOneMillion'];
    _affectedCountries = json['affectedCountries'];
  }
  late num _updated;
  late num _cases;
  late num _todayCases;
  late num _deaths;
  late num _todayDeaths;
  late num _recovered;
  late num _todayRecovered;
  late num _active;
  late num _critical;
  late num _casesPerOneMillion;
  late num _deathsPerOneMillion;
  late num _tests;
  late num _testsPerOneMillion;
  late num _population;
  late num _oneCasePerPeople;
  late num _oneDeathPerPeople;
  late num _oneTestPerPeople;
  late num _activePerOneMillion;
  late num _recoveredPerOneMillion;
  late num _criticalPerOneMillion;
  late num _affectedCountries;
WorldStatsModel copyWith({  required num updated,
  required num cases,
  required num todayCases,
  required num deaths,
  required num todayDeaths,
  required num recovered,
  required num todayRecovered,
  required num active,
  required num critical,
  required num casesPerOneMillion,
  required num deathsPerOneMillion,
  required num tests,
  required num testsPerOneMillion,
  required num population,
  required num oneCasePerPeople,
  required num oneDeathPerPeople,
  required num oneTestPerPeople,
  required num activePerOneMillion,
  required num recoveredPerOneMillion,
  required num criticalPerOneMillion,
  required num affectedCountries,
}) => WorldStatsModel(  updated: updated ?? _updated,
  cases: cases ?? _cases,
  todayCases: todayCases ?? _todayCases,
  deaths: deaths ?? _deaths,
  todayDeaths: todayDeaths ?? _todayDeaths,
  recovered: recovered ?? _recovered,
  todayRecovered: todayRecovered ?? _todayRecovered,
  active: active ?? _active,
  critical: critical ?? _critical,
  casesPerOneMillion: casesPerOneMillion ?? _casesPerOneMillion,
  deathsPerOneMillion: deathsPerOneMillion ?? _deathsPerOneMillion,
  tests: tests ?? _tests,
  testsPerOneMillion: testsPerOneMillion ?? _testsPerOneMillion,
  population: population ?? _population,
  oneCasePerPeople: oneCasePerPeople ?? _oneCasePerPeople,
  oneDeathPerPeople: oneDeathPerPeople ?? _oneDeathPerPeople,
  oneTestPerPeople: oneTestPerPeople ?? _oneTestPerPeople,
  activePerOneMillion: activePerOneMillion ?? _activePerOneMillion,
  recoveredPerOneMillion: recoveredPerOneMillion ?? _recoveredPerOneMillion,
  criticalPerOneMillion: criticalPerOneMillion ?? _criticalPerOneMillion,
  affectedCountries: affectedCountries ?? _affectedCountries,
);
  num get updated => _updated;
  num get cases => _cases;
  num get todayCases => _todayCases;
  num get deaths => _deaths;
  num get todayDeaths => _todayDeaths;
  num get recovered => _recovered;
  num get todayRecovered => _todayRecovered;
  num get active => _active;
  num get critical => _critical;
  num get casesPerOneMillion => _casesPerOneMillion;
  num get deathsPerOneMillion => _deathsPerOneMillion;
  num get tests => _tests;
  num get testsPerOneMillion => _testsPerOneMillion;
  num get population => _population;
  num get oneCasePerPeople => _oneCasePerPeople;
  num get oneDeathPerPeople => _oneDeathPerPeople;
  num get oneTestPerPeople => _oneTestPerPeople;
  num get activePerOneMillion => _activePerOneMillion;
  num get recoveredPerOneMillion => _recoveredPerOneMillion;
  num get criticalPerOneMillion => _criticalPerOneMillion;
  num get affectedCountries => _affectedCountries;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['updated'] = _updated;
    map['cases'] = _cases;
    map['todayCases'] = _todayCases;
    map['deaths'] = _deaths;
    map['todayDeaths'] = _todayDeaths;
    map['recovered'] = _recovered;
    map['todayRecovered'] = _todayRecovered;
    map['active'] = _active;
    map['critical'] = _critical;
    map['casesPerOneMillion'] = _casesPerOneMillion;
    map['deathsPerOneMillion'] = _deathsPerOneMillion;
    map['tests'] = _tests;
    map['testsPerOneMillion'] = _testsPerOneMillion;
    map['population'] = _population;
    map['oneCasePerPeople'] = _oneCasePerPeople;
    map['oneDeathPerPeople'] = _oneDeathPerPeople;
    map['oneTestPerPeople'] = _oneTestPerPeople;
    map['activePerOneMillion'] = _activePerOneMillion;
    map['recoveredPerOneMillion'] = _recoveredPerOneMillion;
    map['criticalPerOneMillion'] = _criticalPerOneMillion;
    map['affectedCountries'] = _affectedCountries;
    return map;
  }

}