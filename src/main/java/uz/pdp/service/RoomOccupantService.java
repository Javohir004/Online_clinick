package uz.pdp.service;

import org.springframework.stereotype.Service;
import uz.pdp.entity.Room;
import uz.pdp.entity.RoomOccupant;
import uz.pdp.repository.RoomOccupantRepository;

import java.util.List;

@Service
public class RoomOccupantService extends BaseService<RoomOccupant, RoomOccupantRepository> {

    public RoomOccupantService(RoomOccupantRepository roomOccupantRepository) {
        repository = roomOccupantRepository;
    }

    public List<RoomOccupant> findOccupancyByRoom(Room room) {
        return repository.findOccupancyByRoom(room.getId());
    }
}
