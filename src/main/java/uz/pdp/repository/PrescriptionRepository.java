package uz.pdp.repository;

import org.springframework.stereotype.Repository;
import uz.pdp.entity.Prescription;

import java.util.List;
import java.util.UUID;

@Repository
public class PrescriptionRepository extends BaseRepository<Prescription> {
    public PrescriptionRepository() {
        this.type = Prescription.class;
    }


    public List<Prescription> findPrescriptionsOfDiagnosis(UUID diagnosisId) {
        return entityManager.createQuery("from Prescription where diagnose.id = :diagnosisId", Prescription.class)
                .setParameter("diagnosisId", diagnosisId)
                .getResultList();
    }
}
