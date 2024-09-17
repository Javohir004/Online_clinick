package uz.pdp.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class TimeSlot {


    private LocalTime start;
    private LocalTime end;
    private boolean available = true;

    public TimeSlot(LocalTime start, LocalTime end) {
        this.start = start;
        this.end = end;
    }

    public boolean overlapsWith(LocalTime otherStart, LocalTime otherEnd) {
        return !(end.isBefore(otherStart) || start.isAfter(otherEnd) || end.equals(otherStart) || start.equals(otherEnd));
    }


    @Override
    public String toString() {
        return start + " - "+ end;
    }
}
