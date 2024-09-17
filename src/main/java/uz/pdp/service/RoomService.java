package uz.pdp.service;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import uz.pdp.entity.Room;
import uz.pdp.entity.RoomOccupant;
import uz.pdp.repository.RoomRepository;

import java.util.List;
import java.util.Optional;

@Service
//@RequiredArgsConstructor
public class RoomService extends BaseService<Room, RoomRepository> {
    @Autowired
    private RoomOccupantService roomOccupantService;

    public RoomService(RoomRepository roomRepository) {
        repository = roomRepository;
    }

    public List<Room> getAllRooms() {
        return repository.getAllRooms();
    }

    public Optional<Room> findAvailableRoom() {
        List<Room> rooms = repository.getAllRooms();
        if (rooms.isEmpty()) {
            return Optional.empty();
        }
        for (Room room : rooms) {
            List<RoomOccupant> occupants = roomOccupantService.findOccupancyByRoom(room);
            int occupiedBeds = occupants.size();
            int availableBeds = room.getBeds() - occupiedBeds;
            if (availableBeds > 0) {
                return Optional.of(room);
            }
        }
        return Optional.empty();
    }
}
