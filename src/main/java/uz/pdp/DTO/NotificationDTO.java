package uz.pdp.DTO;
import lombok.*;
import java.time.LocalDateTime;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class NotificationDTO {
    private UUID appointment_id;
    private String patient_fio;
    private String doctor_fio;
    private String text;
    private LocalDateTime appointment_start;
    private LocalDateTime appointment_end;
}
