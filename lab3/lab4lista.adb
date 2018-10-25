with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO, Ada.Integer_Text_IO;
 
procedure Lab4Lista is
 
type Element is
  record 
    Data : Integer := 0;
    Next : access Element := Null;
  end record; 
 
type Elem_Ptr is access all Element;
 
procedure Print(List : access Element) is
  L : access Element := List;
begin
  if List = Null then
    Put_Line("List EMPTY!");
  else
    Put_Line("List:"); 
  end if; 
  while L /= Null loop
    Put(L.Data, 4); -- z pakietu Ada.Integer_Text_IO
    New_Line;
    L := L.Next;
  end loop; 
end Print;
 
procedure Insert(List : in out Elem_Ptr; D : in Integer) is
  E : Elem_Ptr := new Element; 
begin
  E.Data := D;
  E.Next := List;
  -- lub E.all := (D, List);
  List := E;
end Insert;
 
-- wstawianie jako funkcja - wersja krótka
function Insert(List : access Element; D : in Integer) return access Element is 
  ( new Element'(D,List) ); 
 
-- do napisania !! 
-- napisz procedurę wstawiającą element zachowując posortowanie (rosnące) listy
procedure Insert_Sort(List : in out Elem_Ptr; D : in Integer) is 
  L : access Element := List;
  New_El : access Element;
begin
  L := List;
  if List = Null then
    L := new Element'(D, Null);
  elsif L.Data > D then
    L := new Element'(D, L);
  else
    while L.Next /= Null and then L.Next.Data < D loop
      L := L.Next;
    end loop;
    New_El := new Element'(D, L.Next);
    L.Next := New_El;
  end if;
end Insert_Sort;

procedure Generate_And_Insert(List: in out Elem_Ptr; N : in Integer; M : in Integer) is
  Gen: Generator;
  Number: integer;
begin
  Reset(Gen);
  for I in 1..N loop
    Number := Random(Gen) mod M;
    Insert_Sort(List, Number);
  end loop;
end
 
Lista : Elem_Ptr := Null;
 
begin
  Print(Lista);
  Lista := Insert(Lista, 21);
  Print(Lista);
  Insert(Lista, 20); 
  Print(Lista);
  for I in reverse 1..12 loop
  Insert(Lista, I);
  end loop;
  Print(Lista);

  Generate_And_Insert(Lista, 4, 24);
  Print(Lista);

end Lab4Lista;