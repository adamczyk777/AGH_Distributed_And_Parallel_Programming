with Ada.Text_IO, Ada.Calendar;
use Ada.Text_IO, Ada.Calendar;

procedure Clockie is

    task Counter is
        entry Start;
        entry Finish;
        entry Reset;
        entry Clock;
    end Counter;

    task body Counter is
        Time1: Time;
        Time2: Time;
        TImeDifference: Duration;
    begin
        accept Start;
        Time1 := Clock;
        Put_Line("Starting Counter");
        loop
            select
                accept Clock;
                Time2 := Clock;
                TimeDifference := Time2 - Time1;
                Put_Line("Current time: " & TimeDifference'Img & " s");
            or
                accept Reset;
                Time1 := Clock;
            or 
                accept Finish;
                Put_Line("Finishing Counter :/");
                exit;
            end select;
        end loop;
    end Counter;

begin 
    Counter.Start;
    Counter.Clock;
    delay 5.0;
    Counter.Clock;
    Counter.Reset;
    delay 5.0;
    Counter.Clock;
    Counter.Clock;
    Counter.Finish;
end Clockie;