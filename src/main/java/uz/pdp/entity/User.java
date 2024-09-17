package uz.pdp.entity;


import jakarta.persistence.*;
import lombok.*;
import uz.pdp.enumerators.UserRole;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
@Entity
@Table(name = "users")
public class User extends BaseEntity {
    @Enumerated(EnumType.STRING)
    private UserRole role;
    private String firstname;
    private String lastname;
    @Column(unique = true)
    private String username;
    private String password;
    @Column(unique = true)
    private String email;
    private Integer age;
    private String gender;
    private String phoneNumber;
    private String address;
    private double balance;
    private String picturePath;
}

