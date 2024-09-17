package uz.pdp.repository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import uz.pdp.entity.Room;
import java.util.List;


@Repository
public class RoomRepository extends BaseRepository<Room> {
    public RoomRepository() {
        this.type = Room.class;
    }

    @PersistenceContext
    private EntityManager entityManager;
    public List<Room> getAllRooms() {
        return entityManager.createQuery("select r from Room r", Room.class)
                .getResultList();
    }


}
