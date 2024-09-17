package uz.pdp.util;


import com.itextpdf.kernel.colors.DeviceRgb;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Table;
import com.itextpdf.io.font.constants.StandardFonts;
import com.itextpdf.kernel.colors.ColorConstants;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.property.TextAlignment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import uz.pdp.entity.Appointment;
import uz.pdp.entity.Diagnose;
import uz.pdp.entity.Prescription;
import uz.pdp.entity.User;
import uz.pdp.service.AppointmentService;
import uz.pdp.service.DiagnoseService;
import uz.pdp.service.PrescriptionService;
import uz.pdp.service.UserService;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

@Component
public class Utils {
    private final UserService userService;
    private final AppointmentService appointmentService;
    private final DiagnoseService diagnoseService;
    private final PrescriptionService prescriptionService;

    @Autowired
    public Utils(UserService userService, AppointmentService appointmentService, DiagnoseService diagnoseService, PrescriptionService prescriptionService) {
        this.userService = userService;
        this.appointmentService = appointmentService;
        this.diagnoseService = diagnoseService;
        this.prescriptionService = prescriptionService;
    }

    public File createMedicalRecordForUser(UUID id) throws IOException {
        User patient = userService.findById(id);
        List<Appointment> appointments = appointmentService.findAppointmentsByUser(id, "all");

        String directoryPath = "src/main/resources/files/";
        File directory = new File(directoryPath);
        if (!directory.exists()) {
            Files.createDirectories(Paths.get(directoryPath));
        }

        String fileName = directoryPath + patient.getFirstname() + "_" + patient.getLastname() + ".pdf";
        PdfWriter writer = new PdfWriter(fileName);
        PdfDocument pdf = new PdfDocument(writer);
        Document document = new Document(pdf);

        // Заголовок
        Paragraph title = new Paragraph("Patient Diagnosis Details")
                .setFont(PdfFontFactory.createFont(StandardFonts.HELVETICA_BOLD))
                .setFontSize(20)
                .setFontColor(new DeviceRgb(0, 102, 204)) // Синий цвет
                .setTextAlignment(TextAlignment.CENTER);
        document.add(title);

        // Информация о пациенте
        Paragraph patientInfo = new Paragraph("Patient Full Name: " + patient.getFirstname() + " " + patient.getLastname())
                .setFont(PdfFontFactory.createFont(StandardFonts.HELVETICA))
                .setFontSize(14)
                .setFontColor(ColorConstants.BLACK)
                .setMarginTop(20);
        document.add(patientInfo);

        for (Appointment appointment : appointments) {
            pdf.addNewPage();
            Paragraph appointmentHeader = new Paragraph("Appointment Details")
                    .setFont(PdfFontFactory.createFont(StandardFonts.HELVETICA_BOLD))
                    .setFontSize(16)
                    .setFontColor(new DeviceRgb(105, 105, 105)) // Темно-серый цвет
                    .setTextAlignment(TextAlignment.CENTER)
                    .setMarginTop(10)
                    .setMarginBottom(10);
            document.add(appointmentHeader);

            // Таблица для деталей встречи
            float[] columnWidths = {1, 3}; // Определите количество столбцов и их пропорции
            Table table = new Table(columnWidths);
            table.setWidth(100);

            table.addCell(new Cell().add(new Paragraph("Appointment at:").setBold()));
            table.addCell(new Cell().add(new Paragraph(appointment.getStartTime() + " - " + appointment.getEndTime())));

            List<Diagnose> diagnoses = diagnoseService.findDiagnoseByAppointment(appointment.getId());
            for (Diagnose diagnose : diagnoses) {
                table.addCell(new Cell().add(new Paragraph("Diagnose Description:").setBold()));
                table.addCell(new Cell().add(new Paragraph(diagnose.getDescription())));

                List<Prescription> prescriptions = prescriptionService.findPrescriptionsOfDiagnosis(diagnose.getId());
                int count = 1;
                for (Prescription prescription : prescriptions) {
                    table.addCell(new Cell(1, 2).add(new Paragraph("Prescription " + count++).setBold())
                            .setBackgroundColor(new DeviceRgb(230, 230, 250))); // Цвет для фона

                    table.addCell(new Cell().add(new Paragraph("Medicine:")));
                    table.addCell(new Cell().add(new Paragraph(prescription.getMedicine())));

                    table.addCell(new Cell().add(new Paragraph("Dosage:")));
                    table.addCell(new Cell().add(new Paragraph(prescription.getDosage())));

                    table.addCell(new Cell().add(new Paragraph("Duration:")));
                    table.addCell(new Cell().add(new Paragraph(prescription.getDuration())));
                }
            }
            document.add(table);
            document.add(new Paragraph("\n")); // Добавляет новую строку между встречами
        }
        document.close();
        return new File(fileName);
    }
}
