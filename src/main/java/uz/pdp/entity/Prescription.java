package uz.pdp.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
@Entity
@Table(name = "prescriptions")
public class Prescription extends BaseEntity {
    @ManyToOne
    @JoinColumn(name = "diagnose_id")
    private Diagnose diagnose;

    private String medicine;
    private String dosage;
    private String duration;
}
