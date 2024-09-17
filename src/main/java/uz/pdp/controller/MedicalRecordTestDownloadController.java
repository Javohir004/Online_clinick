package uz.pdp.controller;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import uz.pdp.entity.User;
import uz.pdp.util.Utils;

import java.io.File;
import java.io.IOException;

@Controller
@RequestMapping("/test-download")
public class MedicalRecordTestDownloadController {

    private final Utils utils;

    @Autowired
    public MedicalRecordTestDownloadController(Utils utils) {
        this.utils = utils;
    }

    @GetMapping
    public String showDownloadPage() {
        return "test-download";
    }

    @PostMapping
    public ResponseEntity<FileSystemResource> downloadMedicalRecord(HttpSession session) throws IOException {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }

        File medicalRecordFile = utils.createMedicalRecordForUser(user.getId());
        FileSystemResource fileSystemResource = new FileSystemResource(medicalRecordFile);

        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + medicalRecordFile.getName());
        headers.add(HttpHeaders.CONTENT_TYPE, "application/pdf");

        return new ResponseEntity<>(fileSystemResource, headers, HttpStatus.OK);
    }

}
