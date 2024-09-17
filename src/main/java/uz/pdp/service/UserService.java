package uz.pdp.service;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import uz.pdp.DTO.RegisterDTO;
import uz.pdp.entity.User;
import uz.pdp.enumerators.UserRole;
import uz.pdp.repository.UserRepository;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;


@Service
public class UserService extends BaseService<User, UserRepository>{


    public UserService(UserRepository userRepository) {
        repository = userRepository;
    }

    private final String picPath = "web/profilePics";


    public void test(){
//        repository.test();
    }


    public User signIn(String username, String password) {
        return repository.signIn(username, password);
    }

    public List<User> getAllDoctors(){
        return repository.getDoctors();
    }


    public List<User> getAllDoctorsBySpecialty(String specialties) {
        return repository.getAllDoctors(UserRole.valueOf(specialties));
    }

    public boolean checkMail(String email, String username) {
        return repository.checkMail(email, username);
    }

    public User registerDto(RegisterDTO registerDTO) {
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
        save(user);
        return user;
    }


    public User updateUser(User user) {
        try {
            User byId = super.findById(user.getId());

            byId.setId(user.getId());
            byId.setFirstname(user.getFirstname());
            byId.setLastname(user.getLastname());
            byId.setUsername(user.getUsername());
            byId.setPassword(user.getPassword());
            byId.setEmail(user.getEmail());
            byId.setGender(user.getGender());
            byId.setAge(user.getAge());
            byId.setAddress(user.getAddress());
            byId.setPhoneNumber(user.getPhoneNumber());
            byId.setPicturePath(user.getPicturePath());
            super.update(byId);

            return byId;
            //return super.findById(byId.getId());
        } catch (Exception e) {
            throw new RuntimeException("User update failed");
        }
    }

    public String savePic(MultipartFile file) {
        String fileName = getFileName(file);
        try {
            // Ensure the directory exists
            Path directoryPath = Paths.get(picPath);
            if (!Files.exists(directoryPath)) {
                Files.createDirectories(directoryPath);
            }

            // Save the file
            Files.write(directoryPath.resolve(fileName), file.getBytes());
        } catch (IOException e) {
            throw new RuntimeException("Failed to save the picture", e);
        }
        return "profilePics/" + fileName;
    }

    private String getFileName(MultipartFile file) {
        String originalFilename = file.getOriginalFilename();
        if (originalFilename != null && !originalFilename.isEmpty()) {
            return originalFilename;
        }
        return "file-" + UUID.randomUUID();
    }

}
