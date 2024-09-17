package uz.pdp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import uz.pdp.DTO.AppointmentRequestDTO;
import uz.pdp.entity.Appointment;
import uz.pdp.entity.TimeSlot;
import uz.pdp.entity.User;
import uz.pdp.enumerators.AppointmentStatus;
import uz.pdp.repository.AppointmentRepository;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class AppointmentService extends BaseService<Appointment, AppointmentRepository>{

    private final UserService userService;

    @Autowired
    public AppointmentService(AppointmentRepository repository, UserService userService) {
        super(repository);
        this.userService = userService;
    }


    public List<Appointment> getUserAppointments (User patient) {
        return repository.getAllUserAppointments(patient.getId());
    }

    public List<TimeSlot> getAvailableTimeSlots(UUID doctorId, LocalDate date) {
        List<Appointment> appointments = repository.findByDoctorIdAndDate(doctorId, date);

        LocalTime startOfDay = LocalTime.of(9, 0);
        LocalTime endOfDay = LocalTime.of(17, 0);
        int intervalMinutes = 30;
        int breakMinutes = 20;

        List<TimeSlot> allTimeSlots = createTimeSlots(startOfDay, endOfDay, intervalMinutes, breakMinutes);

        for (Appointment appointment : appointments) {
            LocalTime startTime = appointment.getStartTime().toLocalTime();
            LocalTime endTime = appointment.getEndTime().toLocalTime();
            for (TimeSlot timeSlot : allTimeSlots) {
                if (timeSlot.overlapsWith(startTime, endTime)) {
                    timeSlot.setAvailable(false);
                }
            }

        }
        return allTimeSlots;
        }



    public List<Appointment> findAppointmentsByUser(UUID userId, String status) {
        return repository.findAppointmentsByUser(userId, status);
    }

    public List<AppointmentRequestDTO> findAppointmentRequests(UUID doctorId) {
        List<Appointment> appointmentRequestsOfDoctor = repository.findAppointmentRequestsOfDoctor(doctorId);
        List<AppointmentRequestDTO> appointmentRequestDTOS = new ArrayList<>();
        for (Appointment appointment : appointmentRequestsOfDoctor) {
            appointmentRequestDTOS.add(
                    AppointmentRequestDTO.builder()
                            .appointment_id(appointment.getId())
                            .user_fio(appointment.getPatient().getFirstname() + " " + appointment.getPatient().getLastname())
                            .start_time(appointment.getStartTime())
                            .end_time(appointment.getEndTime())
                            .build()
            );
        }
        return appointmentRequestDTOS;
    }


    private List<TimeSlot> createTimeSlots(LocalTime start, LocalTime end, int intervalMinutes, int breakMinutes) {
        List<TimeSlot> timeSlots = new ArrayList<>();
        LocalTime current = start;
        LocalTime now = LocalTime.now();
        int intervalsBeforeBreak = 2;

        while (current.isBefore(end)) {
            for (int i = 0; i < intervalsBeforeBreak && current.isBefore(end); i++) {
                LocalTime endTime = current.plusMinutes(intervalMinutes);
                if (endTime.isAfter(end)) {
                    break;
                }
                    timeSlots.add(new TimeSlot(current, endTime));
                current = endTime;
            }
            current = current.plusMinutes(breakMinutes);
        }
        return timeSlots;
    }

    public void updateAppointmentRequest(UUID appointmentRequestId , boolean isAccepted) {
        Appointment appointment = repository.findById(appointmentRequestId);
        if (isAccepted) {
            User doctor = appointment.getDoctor();
            doctor.setBalance(doctor.getBalance() + 10000);
            userService.updateUser(doctor);
            appointment.setStatus(AppointmentStatus.ACCEPTED);
        } else {
            User patient = appointment.getPatient();
            patient.setBalance(patient.getBalance() + 10000);
            userService.updateUser(patient);
            appointment.setStatus(AppointmentStatus.CANCELLED);
        }
        appointment.setPatientSeen(false);
        repository.update(appointment);
    }
    public List<Appointment> findAcceptedAppointmentsByDoctor(User doctor) {
        return repository.findAcceptedAppointmentsByDoctor(doctor.getId());
    }


    public List<Appointment> getNewAppointments(UUID doctorId) {
       return repository.getNewAppointments(doctorId);
    }

    public void deleteDoctorAppointments(UUID doctorId){
        repository.deleteDoctorAppointment(doctorId);
    }

    public UUID getAppointmentId(UUID doctorId) {
     return  repository.findAppointmentId(doctorId);
    }
}
