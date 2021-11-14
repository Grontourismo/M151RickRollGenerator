package ch.vinnol.rickrollgenerator.service;

import ch.vinnol.rickrollgenerator.connection.MSSQLConnection;
import ch.vinnol.rickrollgenerator.connection.MariaDBConnection;
import ch.vinnol.rickrollgenerator.entity.CountryStat;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class CountryStatService {

    public Connection connection = MariaDBConnection.getConnection();
    public Statement statement;

    public CountryStatService() {
        try {
            this.statement = connection.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void newCountryStat(String prankId, CountryStat stat) {
        try {
            // MSSQL  ResultSet set = statement.executeQuery("EXEC IncreasCountryCount @prank_id='" + prankId + "', @country='" + stat.getCountry() + "', @count='" + stat.getCount() + "'");
            statement.executeQuery("CALL IncreaseCountryCount('" + prankId + "', '" + stat.getCountry() + "', '" + stat.getCount() + "')");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<CountryStat> getCountryStatsByPrankId(String prankId) {
        List<CountryStat> list = new ArrayList<>();
        try {
            ResultSet set = statement.executeQuery("SELECT * FROM CountryStats WHERE prank_fk=" + prankId);
            while (set.next()) {
                list.add(setCountryStat(set.getLong("id"), set.getString("country"), set.getInt("count")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public CountryStat setCountryStat(Long id, String country, int count) {
        CountryStat countryStat = new CountryStat();
        countryStat.setId(id);
        countryStat.setCountry(country);
        countryStat.setCount(count);
        return countryStat;
    }
}
