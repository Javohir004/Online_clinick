package uz.pdp.DTO;

import jakarta.persistence.Column;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import uz.pdp.enumerators.UserRole;

@AllArgsConstructor
@NoArgsConstructor

public class DoctorsDTO {
    @Enumerated(EnumType.STRING)
    private UserRole role;
    private String firstname;
    private String lastname;
    @Column(unique = true)
    private String username;
    private String password;
    private String email;
    private Integer age;
    private String gender;
    private String phoneNumber;
    private String address;
}
