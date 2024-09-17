package uz.pdp.repository;

import org.springframework.stereotype.Repository;
import uz.pdp.entity.Prescription;
import uz.pdp.entity.RoomOccupant;

import java.util.List;
import java.util.UUID;

@Repository
public class RoomOccupantRepository extends BaseRepository<RoomOccupant> {

    public RoomOccupantRepository() {
        this.type = RoomOccupant.class;
    }

    public List<RoomOccupant> findOccupancyByRoom(UUID roomId) {
        return entityManager.createQuery("from RoomOccupant where room.id = :room_id", RoomOccupant.class)
                .setParameter("room_id", roomId)
                .getResultList();
    }
}
