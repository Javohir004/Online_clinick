package uz.pdp.controller;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import uz.pdp.DTO.LoginDTO;
import uz.pdp.DTO.RegisterDTO;
import uz.pdp.entity.Appointment;
import uz.pdp.entity.User;
import uz.pdp.enumerators.UserRole;
import uz.pdp.service.AppointmentService;
import uz.pdp.service.UserService;
import uz.pdp.service.VerificationService;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/auth")
//@Setter
@AllArgsConstructor
public class AuthController {

    @Autowired
    private final UserService userService;

    @Autowired
    private final VerificationService verificationService;
    @Autowired
    private final AppointmentService service;


    @RequestMapping("/login")
    public String loginPage() {
///      userService.test();
        return "login";
    }

    @RequestMapping("/register")
    public String registerPage() {
        return "register";
    }


    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@ModelAttribute LoginDTO loginDto, HttpSession session, Model model) {
        User userEntity = userService.signIn(loginDto.username(), loginDto.password());
        session.setAttribute("user", userEntity);
        if (userEntity.getRole() == UserRole.PATIENT) {
            model.addAttribute("user", userEntity);
            return "patient-page";
        }else if (userEntity.getRole() == UserRole.MAIN_DOCTOR) {
            model.addAttribute("user", userEntity);
            return "admin-menu";
        } else if (userEntity.getRole() == UserRole.ADMINISTRATOR) {
            model.addAttribute("user", userEntity);
            return "administrator-page";
        } else if(userEntity.getRole()!=null) {
            List<Appointment> newAppointments = service.getNewAppointments(userEntity.getId());
            List<User> users = new ArrayList<>();
            for (Appointment newAppointment : newAppointments) {
                users.add(userService.findById(newAppointment.getPatient().getId()));
            }
            model.addAttribute("appointments",users);
            model.addAttribute("user", userEntity);
            return "doctor-page";
        }
        model.addAttribute("error", "Username or password incorrect");
        return "login";
    }


    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String Register(@ModelAttribute RegisterDTO registerDTO, Model model, HttpSession session) {
        if (userService.checkMail(registerDTO.getEmail(), registerDTO.getUsername())) {
            model.addAttribute("message", "This email address or username is already in use!");
            return "register";
        }
        User user = User.builder()
                .age(registerDTO.getAge())
                .address(registerDTO.getAddress())
                .email(registerDTO.getEmail())
                .role(UserRole.PATIENT)
                .gender(registerDTO.getGender())
                .lastname(registerDTO.getLastname())
                .firstname(registerDTO.getFirstname())
                .phoneNumber(registerDTO.getPhoneNumber())
                .password(registerDTO.getPassword())
                .username(registerDTO.getUsername())
                .build();

       // User user = userService.registerDto(registerDTO);

        String code = verificationService.sendVerificationCode(registerDTO.getEmail());


        session.setAttribute("user", registerDTO);
        session.setAttribute("code", code);
        return "registration-code";
    }

    @PostMapping("/registration-code")
    public String registrationCode(@ModelAttribute RegisterDTO registerDTO, Model model, HttpSession session) {
         String code = (String) session.getAttribute("code");
        RegisterDTO user = (RegisterDTO) session.getAttribute("user");
        if (code.equals(registerDTO.getCode())) {
            userService.registerDto(user);
            return "index";
        }
        model.addAttribute("message", "Invalid code");
        return "registration-code";

    }


}
