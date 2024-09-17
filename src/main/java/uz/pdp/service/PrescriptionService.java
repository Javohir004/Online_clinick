package uz.pdp.service;

import org.springframework.stereotype.Service;
import uz.pdp.entity.Prescription;
import uz.pdp.repository.PrescriptionRepository;

import java.util.List;
import java.util.UUID;

@Service
public class PrescriptionService extends BaseService <Prescription, PrescriptionRepository> {

    public PrescriptionService(PrescriptionRepository prescriptionRepository) {
        repository = prescriptionRepository;
    }

    public List<Prescription> findPrescriptionsOfDiagnosis(UUID diagnosisId) {
        return repository.findPrescriptionsOfDiagnosis(diagnosisId);
    }
}
