
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics.Discrete_Random, Ada.Unchecked_Deallocation;
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
  subtype Random_Range is Integer range 0 .. M;
  package Random_Generator is new Ada.Numerics.Discrete_Random (Random_Range);
  use Random_Generator;
  Gen: Generator;
  Number: Integer;
begin
  Reset(Gen);
  for I in 1..N loop
    Number := Random(Gen) mod M;
    Insert_Sort(List, Number);
  end loop;
end;

function Find(List: in Elem_Ptr; El: in Integer) return access Element is
  L: access Element := List;
begin
  while L.Next /= Null loop
    if L.Data = El then
      return L;
    else
      L := L.Next;
    end if;
  end loop;
  return Null;
end Find;

procedure Deallocate is new Ada.Unchecked_Deallocation(Element, Elem_Ptr);

procedure Remove(List: in out Elem_Ptr; El: in Integer) is
	L : access Element := List;
	Temp : access Element;
begin	
  if L /= Null then
    if L.Data = El then
      Temp := L;
      L := L.Next;
      Deallocate(Temp);
    else
      if L /= Null then
        while L.Next /= Null loop
          if L.Next.Data = El then
            Temp := L.Next.Next;
            Deallocate(L.Next);
            L.Next := Temp;
          end if;
          L := L.Next;
        end loop;	
      end if;
    end if;
  end if;
end Remove;
 
Lista : Elem_Ptr := Null;
Result: access Element := Null;
 
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

  Result := Find(Lista, 12);


  -- Removing
  Lista := Null;
  for I in reverse 1..12 loop
    Insert(Lista, I);
  end loop;
  Print(Lista);

  -- Remove(Lista, 1);
  -- Remove(Lista, 12);
  
  Print(Lista);
end Lab4Lista;