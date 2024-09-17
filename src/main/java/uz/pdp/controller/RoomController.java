package uz.pdp.controller;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import uz.pdp.entity.Diagnose;
import uz.pdp.entity.Room;
import uz.pdp.entity.RoomOccupant;
import uz.pdp.entity.User;
import uz.pdp.service.DiagnoseService;
import uz.pdp.service.RoomOccupantService;
import uz.pdp.service.RoomService;

import java.time.LocalDateTime;
import java.util.Optional;
import java.util.UUID;


@Controller
@AllArgsConstructor
@RequestMapping("/create-room")
public class RoomController {

    @Autowired
    private RoomService roomService;

    @Autowired
    private RoomOccupantService roomOccupantService;

    @Autowired
    private DiagnoseService diagnoseService;

    @GetMapping
    public String createRoom() {
        return "create-room";
    }

    @PostMapping
    public String createRoom(@ModelAttribute Room room, Model model) {
        roomService.save(room);
        model.addAttribute("rooms", room);
        model.addAttribute("root", roomService.getAllRooms());
        return "create-room";
    }

    @RequestMapping("/back-administrator-page")
    public String backAdministratorPage() {
        return "administrator-page";
    }


    @GetMapping("/all-rooms")
    public String showRoom() {
        return "all-rooms";
    }

    @PostMapping("/all-rooms")
    public String allRooms(Model model, HttpSession session) {
        model.addAttribute("room", roomService.getAllRooms());
        session.setAttribute("room", roomService.getAllRooms());
        return "all-rooms";
    }

    @RequestMapping("/reject")
    public String rejectHospitalisation(@RequestParam("diagnosisId") UUID diagnoseId) {
        Diagnose diagnose = diagnoseService.findById(diagnoseId);
        diagnose.setAgreedToHospitalization("reject");
        diagnoseService.update(diagnose);
        return "patient-page";
    }

    @RequestMapping("/accept")
    public String acceptHospitalisation(Model model, HttpSession session, @RequestParam("diagnosisId") UUID diagnoseId) {
        Diagnose diagnose = diagnoseService.findById(diagnoseId);

        Optional<Room> availableRoom = roomService.findAvailableRoom();
        if (availableRoom.isPresent()) {
            LocalDateTime startAt = LocalDateTime.now().plusDays(7);
            LocalDateTime endAt = startAt.plusDays(7);

            RoomOccupant roomOccupant = RoomOccupant.builder()
                    .endAt(endAt)
                    .startAt(startAt)
                    .room(availableRoom.get())
                    .user((User) session.getAttribute("user"))
                    .build();
            roomOccupantService.save(roomOccupant);

            String message = "You will be accommodated in room No."+availableRoom.get().getNumber() +
                    ", on the" + availableRoom.get().getFloor() + " floor.";
            model.addAttribute("successMessage", message);
            diagnose.setAgreedToHospitalization("accept");
            diagnoseService.update(diagnose);
            return "diagnosis-hospitalization-page";
        } else {
            model.addAttribute("failMessage", "No room available");
            return "diagnosis-hospitalization-page";
        }
    }


}
