package uz.pdp.entity;


import jakarta.persistence.*;
import lombok.*;
import uz.pdp.enumerators.MessageState;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
@Entity
@Table(name = "messages")
public class Message extends BaseEntity {
    @ManyToOne
    @JoinColumn(name = "appointment_id")
    private Appointment appointment;
    private String text;
    @Enumerated(EnumType.STRING)
    MessageState messageState;
}
