package uz.pdp.service;

import org.springframework.stereotype.Service;
import uz.pdp.entity.Diagnose;
import uz.pdp.repository.DiagnoseRepository;

import java.util.List;
import java.util.UUID;

@Service
public class DiagnoseService extends BaseService <Diagnose, DiagnoseRepository> {

    public DiagnoseService(DiagnoseRepository diagnoseRepository) {
        repository = diagnoseRepository;
    }

    public List<Diagnose> findDiagnoseByAppointment(UUID appointmentId) {
        return repository.findDiagnoseByAppointment(appointmentId);
    }
}
