package uz.pdp.entity;
import jakarta.persistence.*;
import lombok.*;
import uz.pdp.enumerators.AppointState;
import uz.pdp.enumerators.AppointmentStatus;
import java.time.LocalDateTime;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
@Entity
@Table(name = "appointments")
public class Appointment extends BaseEntity {

    @ManyToOne
    @JoinColumn(name = "doctor_id")
    private User doctor;
    @ManyToOne
    @JoinColumn(name = "patient_id")
    private User patient;
    @Enumerated(EnumType.STRING)
    private AppointState state;
    private LocalDateTime startTime;
    private LocalDateTime endTime;
    @Enumerated(EnumType.STRING)
    private AppointmentStatus status;
    private boolean isDoctorSeen;
    private boolean isPatientSeen;


    @PrePersist
    protected void onCreate() {
        if (!isPatientSeen) {
            isPatientSeen = true; // Ensure default value is true
        }
        if (!isDoctorSeen) {
            isDoctorSeen = true;
        }
    }

}
