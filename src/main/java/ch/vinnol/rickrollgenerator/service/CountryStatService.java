package ch.vinnol.rickrollgenerator.service;

import ch.vinnol.rickrollgenerator.entity.CountryStat;

import java.util.List;

public class CountryStatService {
    public CountryStat newCountryStat(String prankId, CountryStat stat) {
        return new CountryStat();
    }

    public List<CountryStat> getCountryStatsByPrankId(String prankId) {
        List<CountryStat> list = null;
        return list;
    }
}
