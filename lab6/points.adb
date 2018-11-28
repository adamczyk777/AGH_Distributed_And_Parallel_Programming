with Ada.Text_IO, Ada.Numerics.Float_Random, Ada.Numerics.Elementary_Functions;
use Ada.Text_IO, Ada.Numerics.Float_Random, Ada.Numerics.Elementary_Functions;

procedure Points is

type Point is
  record
    X, Y: Float;
  end record;

task Client is
  entry Start(N: in Integer);	
end Client;

task Server is
  entry Start;
  entry Finish;
  entry Input(P:Point);
end Server;

task body Client is
  Gen: Generator;
  P: Point;
  Point_Num: Integer;
begin
  accept Start(N: in Integer) do
    Point_Num := N;
    Put_Line("Client started");
  end Start;
  Reset(Gen);
  for I in 1..Point_Num loop
    P.X := Random(Gen);
    P.Y := Random(Gen);
	  Server.Input(P);
  end loop;
  Server.Finish;
end Client;

task body Server is
  P1: Point;
  P2: Point;
  Prev_Point: Boolean := false;
begin
  accept Start;
  Put_Line("Server started");
  loop
    select 
      accept Input(P: in Point) do
        if Prev_Point then
          P2 := P1;
        end if;
        P1 := P;
      end Input;
      Put_Line("Point(X = " & P1.X'Img & ", Y = " & P1.Y'Img & ")");
      Put_Line("Distnace from base of coordinate system: " & Sqrt(P1.X * P1.X + P1.Y * P1.Y)'Img);
      if Prev_Point then
        Put_Line("Distance from base of coordinate system: " & Sqrt((P1.X - P2.X) * (P1.X - P2.X) + (P1.Y - P2.Y) * (P1.Y - P2.Y))'Img);
      else
        Prev_Point := true;
      end if;
    or 
      accept Finish;
      Put_Line("Server finished");
      exit;
    end select;
  end loop;
end Server;

begin
  Server.Start;
  delay 1.5;
  Client.Start(3);
end Points; 