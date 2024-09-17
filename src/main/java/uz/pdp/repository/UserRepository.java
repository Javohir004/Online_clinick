package uz.pdp.repository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Repository;
import uz.pdp.entity.User;
import uz.pdp.enumerators.UserRole;
import uz.pdp.exception.InvalidInputException;
import java.util.List;


@Repository
public class UserRepository extends BaseRepository<User> {

    {
        type = User.class;
    }



    @PersistenceContext
    private EntityManager entityManager;

    public void test() {
        entityManager.createQuery("from User u", User.class)
                .getResultList();
    }


    @Transactional
    public User save(User entity){
        try {
        if(entityManager.contains(entity)){
            return null;
        }
        entity.setBalance(100000.0);
        entityManager.persist(entity);
        return entity;
        }catch (InvalidInputException e){
            return null;
        }
    };

    public boolean checkMail(String email, String currentUsername) {
        try {
            entityManager.createQuery("from User where email =:email or username =:currentUsername", User.class)
                    .setParameter("email", email)
                    .setParameter("currentUsername", currentUsername)
                    .getSingleResult();
            return true;
        } catch (Exception e) {
            return false;
        }
    }


    public User signIn(String username, String password) {
        try {
            return entityManager.createQuery("select u from User u where u.username =:username and " +
                            "u.password =:password", type)
                    .setParameter("username", username)
                    .setParameter("password", password)
                    .getSingleResult();
        }catch (Exception e){
            System.out.println(e.getMessage());
            return new User();
        }
    }



    public List<User> getDoctors(){
        return entityManager.createQuery(
                        "SELECT e FROM User e WHERE e.role NOT IN (:excludedRoles)", User.class)
                .setParameter("excludedRoles", List.of("MAIN_DOCTOR"))
                .getResultList(); ///,"PATIENT", "ADMINISTRATOR"
    }


    public List<User> getAllDoctors(UserRole specialties) {
        Query query = entityManager.createQuery("select u from User u where u.role = : special", User.class);
        query.setParameter("special", specialties);
        return query.getResultList();
    }


}
