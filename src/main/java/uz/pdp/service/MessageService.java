package uz.pdp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import uz.pdp.entity.Message;
import uz.pdp.enumerators.MessageState;
import uz.pdp.repository.MessageRepository;

import java.util.UUID;


@Service
public class MessageService extends BaseService<Message, MessageRepository>{

    private final MessageRepository messageRepository;
    private AppointmentService appointmentService;

    @Autowired
    public MessageService(MessageRepository repository, AppointmentService appointmentService, MessageRepository messageRepository) {
        super(repository);
        this.appointmentService = appointmentService;
        this.messageRepository = messageRepository;
    }

    public Message save(UUID appointmentId, String text) {
        return save(
                Message.builder()
                        .appointment(appointmentService.findById(appointmentId))
                        .messageState(MessageState.NEW)
                        .text(text)
                        .build()
        );
    }

    public Message findByAppointmentId(UUID appointmentId) {
        return messageRepository.findMessageByAppointmentId(appointmentId);
    }

    public void deleteMessageByAppointmentId(UUID appointmentId) {
        messageRepository.deleteMessageByAppointmentId(appointmentId);
    }
}
