package uz.pdp.repository;

import org.springframework.stereotype.Repository;
import uz.pdp.entity.Diagnose;

import java.util.List;
import java.util.UUID;

@Repository
public class DiagnoseRepository extends BaseRepository<Diagnose> {
    public DiagnoseRepository() {
        this.type = Diagnose.class;
    }


    public List<Diagnose> findDiagnoseByAppointment(UUID appointmentId) {
        return entityManager.createQuery(
                        "SELECT d FROM Diagnose d LEFT JOIN FETCH d.prescriptions WHERE d.appointment.id = :appointmentId", Diagnose.class)
                .setParameter("appointmentId", appointmentId)
                .getResultList();
    }

}
