package uz.pdp.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import uz.pdp.entity.User;
import uz.pdp.service.UserService;

@Controller
@RequestMapping("/user-profile")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping()
    public String myProfile() {
        return "my-profile";
    }


    @PostMapping()
    public String update(@ModelAttribute User user,
                         @RequestParam("image") MultipartFile imagePart,
                         Model model, HttpSession session) {
        try {

            user.setId(((User) session.getAttribute("user")).getId());

            if (imagePart != null && imagePart.getSize() > 0) {
                String imagePath = userService.savePic(imagePart);
                 user.setPicturePath(imagePath);
            }

            User res = userService.updateUser(user);
            res.setPicturePath(user.getPicturePath());
            model.addAttribute("user", res);
            session.setAttribute("user", res);

        } catch (Exception e) {
            model.addAttribute("message", e.getMessage());
            return "my-profile";
        }
        model.addAttribute("message", "User updated successfully");
        return "my-profile";
    }


//    @PostMapping()
//    public String update(@ModelAttribute User user,@RequestParam("image") MultipartFile file) {
//        if (!file.isEmpty()) {
//            String picturePath = null;
//            picturePath = userService.savePic(file);
//            user.setPicturePath(picturePath);
//        }
//        userService.save(user);
//
//        return "redirect:/my-profile";
//    }

  /*  @PostMapping()
    public String update(@ModelAttribute User user, @RequestParam("image") MultipartFile image, Model model, HttpSession session) {
        try {
            user.setId(((User) session.getAttribute("user")).getId());
            String image = userService.savePic((Part) model.getAttribute("image"));
            user.setPicturePath(image);
            User res = userService.updateUser(user);
            model.addAttribute("user", res);
            session.setAttribute("user", res);

        } catch (Exception e) {
            model.addAttribute("message", e.getMessage());
            return "my-profile";
        }
        model.addAttribute("message", "User updated successfully");
        return "my-profile";
    }*/

    @RequestMapping("/back-patient-page")
    public String backPatientPage() {
        return "patient-page";
    }

    @RequestMapping("/back-doctor-page")
    public String backDoctorPage() {
        return "doctor-page";
    }


}

