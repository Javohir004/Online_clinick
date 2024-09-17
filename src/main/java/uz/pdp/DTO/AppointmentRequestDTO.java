package uz.pdp.DTO;


import lombok.*;

import java.time.LocalDateTime;
import java.util.UUID;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class AppointmentRequestDTO {
    private UUID appointment_id;
    private String user_fio;
    private LocalDateTime start_time;
    private LocalDateTime end_time;
}
