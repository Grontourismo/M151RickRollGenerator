package ch.zli.m223.rickrollgenerator.domain;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
public class Prank {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private LocalDateTime checkIn;

    @Column(nullable = false)
    private LocalDateTime checkOut;

}
