package uz.pdp.controller;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import uz.pdp.entity.User;
import uz.pdp.enumerators.UserRole;
import uz.pdp.service.AppointmentService;
import uz.pdp.service.MessageService;
import uz.pdp.service.UserService;
import java.time.LocalDateTime;
import java.util.UUID;
@Controller
@RequestMapping("/admin")
//@Setter
@AllArgsConstructor
public class AdminController {

    @Autowired
    private final UserService userService;

    @Autowired final MessageService messageService;

    @Autowired
    private final AppointmentService appointmentService;

    @GetMapping()
    public String admin(Model model) {
        return "admin-menu";
    }

    @RequestMapping("/balance")
    public String balancePage(Model model, HttpSession session) {
        User user = (User)session.getAttribute("user");
        model.addAttribute("user", user);
        model.addAttribute("balance", user.getBalance());
        return "balance";
    }

    @RequestMapping("/back-balance")
    public String backBalancePage(Model model, HttpSession session) {
        User user = (User)session.getAttribute("user");
        model.addAttribute("user", user);
        model.addAttribute("balance", user.getBalance());
        return "patient-page";
    }

    @PostMapping("add-balance")
    public String addBalance(@RequestParam(name = "amount") double amount, Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        if(amount <= 0){
            model.addAttribute("message", "Amount must be greater than 0");
            model.addAttribute("balance", user.getBalance());
            return "balance";
        }
        user.setBalance(user.getBalance() + amount);
        userService.update(user);
        model.addAttribute("balance", user.getBalance());
        return "balance";
    }

    @PostMapping("/create-doctors")
    public String create(@ModelAttribute User userEntity, Model model , HttpSession session) {
        if(userService.checkMail(userEntity.getEmail(), userEntity.getUsername())){
            model.addAttribute("message" , "Please be focus and full fields correctly !!!");
            model.addAttribute("users", userService.getAllDoctors());
            return "create-employee";
        }
        userService.save(userEntity);
        model.addAttribute("roles", UserRole.values());
        userEntity.setCreatedAt(LocalDateTime.now());
        userEntity.setUpdatedAt(LocalDateTime.now());
        model.addAttribute("users", userService.getAllDoctors());
        return "create-employee";
    }

    @GetMapping("create" )
    public String create(Model model) {
        model.addAttribute("users", userService.getAllDoctors());
        model.addAttribute("roles", UserRole.values());
        return "admin/create";
    }

    /**bu yerda doctorga ulangan tablelar ham o'chadi**/
    @RequestMapping("/delete-doctor")
    public String delete(@RequestParam(name = "userId") UUID userId, Model model,HttpSession session) {
        UUID appointmentId = appointmentService.getAppointmentId(userId);
        messageService.deleteMessageByAppointmentId(appointmentId);
        appointmentService.deleteDoctorAppointments(userId);
        userService.delete(userId);
        model.addAttribute("users", userService.getAllDoctors());
        model.addAttribute("roles", UserRole.values());
        return "show-employee";
    }

    @RequestMapping(value = "/update-doctor", method = RequestMethod.POST)
    public String update(@RequestParam(name = "userId") UUID userID , @ModelAttribute User updatedUser, Model model) {
        updatedUser.setId(userID);
        userService.update(updatedUser);
        model.addAttribute("message", "Doctor updated successfully");
        model.addAttribute("users", userService.getAllDoctors());
        model.addAttribute("roles", UserRole.values());
        return "show-employee";
    }

    @GetMapping("show-employee")
    public String showEmployee(Model model) {
        model.addAttribute("users", userService.getAllDoctors());
        model.addAttribute("roles", UserRole.values());
        return "show-employee";
    }

}
