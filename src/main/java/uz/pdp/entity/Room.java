package uz.pdp.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@ToString
@Entity
@Table(name = "rooms")
public class Room extends BaseEntity {
    private String name;
    private Integer number;
    private Integer floor;
    private Integer beds;
}
