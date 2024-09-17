package uz.pdp.controller;

import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import uz.pdp.entity.Appointment;
import uz.pdp.entity.Diagnose;
import uz.pdp.entity.Prescription;
import uz.pdp.entity.User;
import uz.pdp.service.AppointmentService;
import uz.pdp.service.DiagnoseService;

import java.time.ZoneId;
import java.util.*;

@AllArgsConstructor
@Controller
@RequestMapping("/accepted-requests")
public class DiagnoseController {

    @Autowired
    private final AppointmentService service;

    @Autowired
    private final DiagnoseService diagnoseService;


    @RequestMapping("/show")
    public String showAcceptedRequestsPage(Model model, HttpSession session) {
        List<Appointment> appointments = service
                .findAcceptedAppointmentsByDoctor((User) session.getAttribute("user"));
        model.addAttribute("appointments", appointments);
        List<Map<String, Object>> formattedAppointments = new ArrayList<>();

        for (Appointment appointment : appointments) {
            Map<String, Object> appointmentData = new HashMap<>();
            appointmentData.put("patientFirstname", appointment.getPatient().getFirstname());
            appointmentData.put("patientLastname", appointment.getPatient().getLastname());
            appointmentData.put("startTime", Date.from(appointment.getStartTime().atZone(ZoneId.systemDefault()).toInstant()));
            appointmentData.put("endTime", Date.from(appointment.getEndTime().atZone(ZoneId.systemDefault()).toInstant()));
            appointmentData.put("id", appointment.getId());
            formattedAppointments.add(appointmentData);
        }

        model.addAttribute("appointments", formattedAppointments);
        return "accepted-requests";
    }

    @RequestMapping(value = "/show", method = RequestMethod.POST)
    public String showAcceptedRequests(Model model, HttpSession session) {
        List<Appointment> appointments = service.findAcceptedAppointmentsByDoctor((User) session.getAttribute("user"));
        List<Map<String, Object>> formattedAppointments = new ArrayList<>();

        for (Appointment appointment : appointments) {
            Map<String, Object> appointmentData = new HashMap<>();
            appointmentData.put("patientFirstname", appointment.getPatient().getFirstname());
            appointmentData.put("patientLastname", appointment.getPatient().getLastname());
            appointmentData.put("startTime", Date.from(appointment.getStartTime().atZone(ZoneId.systemDefault()).toInstant()));
            appointmentData.put("endTime", Date.from(appointment.getEndTime().atZone(ZoneId.systemDefault()).toInstant()));
            appointmentData.put("id", appointment.getId());
            formattedAppointments.add(appointmentData);
        }
        model.addAttribute("appointments", formattedAppointments);
        return "accepted-requests";
    }



    @RequestMapping("/selected-appointment")
    public String showSelectedAppointmentPage(@RequestParam("appointmentId") UUID selectedAppointmentId, Model model, HttpSession session) {
        Appointment byId = service.findById(selectedAppointmentId);
        List<Diagnose> diagnoseByAppointment = diagnoseService.findDiagnoseByAppointment(byId.getId());
        if (!diagnoseByAppointment.isEmpty()) {
            model.addAttribute("message", "Diagnosis already exists!");
            return "selected-appointment-page";
        }
        model.addAttribute("appointment", byId);
        return "selected-appointment-page";
    }


    @RequestMapping(value = "/selected-appointment", method = RequestMethod.POST)
    public String showSelectedAppointment(@RequestParam("appointmentId") UUID selectedAppointmentId,Model model, HttpSession session) {
        Appointment thisAppointment = service.findById(selectedAppointmentId);
        List<Diagnose> diagnoseByAppointment = diagnoseService.findDiagnoseByAppointment(thisAppointment.getId());
        if (!diagnoseByAppointment.isEmpty()) {
            model.addAttribute("message", "Diagnosis already exists!");
            return "selected-appointment-page";
        }
        model.addAttribute("appointment", thisAppointment);
        return "selected-appointment-page";
    }

    @RequestMapping("/createDiagnosis")
    public String newAppointmentPage() {
        return "doctor-page";
    }

    @RequestMapping(value = "/createDiagnosis", method = RequestMethod.POST)
    public String newAppointment(@RequestParam("appointmentId") UUID appointmentId,
                                 @RequestParam("diagnosisDescription") String diagnosisDescription,
                                 @RequestParam("hospitalization") boolean hospitalization,
                                 @RequestParam(value = "medicine", required = false) List<String> medicines,
                                 @RequestParam(value = "dosage", required = false) List<String> dosages,
                                 @RequestParam(value = "duration", required = false) List<String> durations) {

        Appointment appointment = service.findById(appointmentId);

        Diagnose diagnose = new Diagnose();
        diagnose.setAppointment(appointment);
        diagnose.setDescription(diagnosisDescription);
        diagnose.setHospitalization(hospitalization);

        if (medicines != null && dosages != null && durations != null) {
            List<Prescription> prescriptions = new ArrayList<>();
            for (int i = 0; i < medicines.size(); i++) {
                Prescription prescription = new Prescription();
                prescription.setDiagnose(diagnose);
                prescription.setMedicine(medicines.get(i));
                prescription.setDosage(dosages.get(i));
                prescription.setDuration(durations.get(i));
                prescriptions.add(prescription);
            }
            diagnose.setPrescriptions(prescriptions);
        }
         diagnoseService.save(diagnose);

        return "doctor-page";
    }



    @RequestMapping("/next-page")
    public String showPage(Model model, HttpSession session) {
        User user = (User)session.getAttribute("user");
        List<Appointment> all = service.findAppointmentsByUser(user.getId(), "ACCEPTED");
        if (all.isEmpty()) {
            model.addAttribute("message", "no appointments found");
        } else {
            model.addAttribute("appointments", all);
        }
        return "diagnosis-detail-page";
    }

    @RequestMapping(value = "/next-page", method = RequestMethod.POST)
    public String showUserAppointments(HttpSession session, Model model) {
        User user = (User)session.getAttribute("user");
        List<Appointment> all = service.findAppointmentsByUser(user.getId(), "ACCEPTED");
        if (!all.isEmpty()) {
            model.addAttribute("appointments", all);
        } else {
            model.addAttribute("message", "no appointments found");
        }
        return "diagnosis-detail-page";
    }

    @RequestMapping("/get-diagnosis")
    public String showDiagnosisPage(@RequestParam("appointmentId") UUID appointmentId, Model model) {
        List<Diagnose> diagnoseByAppointment = diagnoseService.findDiagnoseByAppointment(appointmentId);
        model.addAttribute("diagnose33s", diagnoseByAppointment);
        return "diagnosis-hospitalization-page";
    }

    @RequestMapping(value = "/get-diagnosis", method = RequestMethod.POST)
    public String showDiagnosis(@RequestParam("appointmentId") UUID appointmentId, Model model) {
        List<Diagnose> diagnoseByAppointment = diagnoseService.findDiagnoseByAppointment(appointmentId);
        model.addAttribute("diagnoses", diagnoseByAppointment);
       return "diagnosis-hospitalization-page";
    }



}
