package ch.vinnol.rickrollgenerator.entity;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
public class Prank {
    private Long id;
    private String uid;
    private String title;
    private String description;
    private String imageURL;
    private LocalDateTime createDate;
    private boolean active;
    private List<CountryStat> countries;
    private int count;

}
