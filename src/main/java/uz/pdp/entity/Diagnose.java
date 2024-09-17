package uz.pdp.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;


@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@Entity
@Table(name = "diagnoses")
public class Diagnose extends BaseEntity {
    @ManyToOne
    @JoinColumn(name = "appointment_id")
    private Appointment appointment;
    private String description;

    @OneToMany(mappedBy = "diagnose", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Prescription> prescriptions;

    private Boolean hospitalization;
    private String agreedToHospitalization;
}
