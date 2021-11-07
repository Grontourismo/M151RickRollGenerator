package ch.vinnol.rickrollgenerator.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CountryStat {
    private Long id;
    private String country;
    private int count;
}
