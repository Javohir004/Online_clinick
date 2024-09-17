package uz.pdp.repository;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import uz.pdp.entity.Message;

import java.util.UUID;

@Repository
public class MessageRepository extends BaseRepository<Message>{

    public Message findMessageByAppointmentId(UUID appointmentId) {
        try {
            return entityManager.createQuery("from Message where appointment.id = :appointmentId", Message.class)
                    .setParameter("appointmentId", appointmentId)
                    .getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Transactional
    public void deleteMessageByAppointmentId(UUID appointmentId) {
        try {
             entityManager.createQuery("delete Message where appointment.id = :appointmentId", Message.class)
                    .setParameter("appointmentId", appointmentId)
                    .executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
