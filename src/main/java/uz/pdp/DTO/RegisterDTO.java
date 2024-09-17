package uz.pdp.DTO;
import jakarta.persistence.Column;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class RegisterDTO {
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
    private String code;
}
