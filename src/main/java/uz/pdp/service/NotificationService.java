package uz.pdp.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import uz.pdp.DTO.NotificationDTO;
import uz.pdp.entity.Appointment;
import uz.pdp.entity.Message;
import uz.pdp.entity.User;
import uz.pdp.enumerators.AppointmentStatus;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Component
public class NotificationService {
    private final UserService userService;
    private final AppointmentService appointmentService;
    private final MessageService messageService;

    @Autowired
    public NotificationService(UserService userService, AppointmentService appointmentService, MessageService messageService) {
        this.userService = userService;
        this.appointmentService = appointmentService;
        this.messageService = messageService;
    }

    public List<NotificationDTO> patientNotifications(UUID patientId) {
        List<NotificationDTO> patientNotifications = new ArrayList<>();
        List<Appointment> appointmentsByUser = appointmentService.findAppointmentsByUser(patientId, "all");
        User patient = userService.findById(patientId);
        for (Appointment appointment : appointmentsByUser) {
            if (!appointment.isPatientSeen()) {
                User doctor = userService.findById(appointment.getDoctor().getId());
                NotificationDTO notification = NotificationDTO.builder()
                        .appointment_id(appointment.getId())
                        .patient_fio(patient.getFirstname() + " " + patient.getLastname())
                        .doctor_fio(doctor.getFirstname() + " " + doctor.getLastname())
                        .appointment_start(appointment.getStartTime())
                        .appointment_end(appointment.getEndTime())
                        .build();
                if (appointment.getStatus() == AppointmentStatus.CANCELLED) {
                    Message message = messageService.findByAppointmentId(appointment.getId());
                    if (message != null) {
                        notification.setText("The reason for rejection: " + message.getText());
                    } else {
                        notification.setText("The appointment cancelled");
                    }
                } else if (appointment.getStatus() == AppointmentStatus.ACCEPTED) {
                    notification.setText("The appointment accepted");
                }
                patientNotifications.add(notification);
                appointment.setPatientSeen(true);
                appointmentService.update(appointment);
            }
        }

        return patientNotifications;
    }
}
