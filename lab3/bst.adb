with Ada.Text_IO, Ada.Numerics.Discrete_Random, Ada.Unchecked_Deallocation, Ada.Strings;
use Ada.Text_IO, Ada.Strings;

procedure BST is
-- typ - węzeł drzewa binarnego
type Node is
  record
    Data : Integer := 0;
    Left : access Node := Null;
    Right : access Node := Null;
  end record;  

type Node_Ptr is access all Node;

-- procedurę wypisującą drzewo na ekran
procedure Print(Tree : Node_Ptr) is
begin
	if Tree = Null then
		return;
	end if;
	if Tree.Left /= Null then
		Put(Character'Val(40));
		Print(Tree.Left);
		Put(Character'Val(41));
		Put("<-");
	end if;
	Put(Integer'Image(Tree.Data));
	if Tree.Right /= Null then
		Put("->");
		Put(Character'Val(40));
		Print(Tree.Right);
		Put(Character'Val(41));
	end if;
end Print;

-- procedurę wstawiającą element - budującą binarne drzewo przeszukiwań (BST), dane z generatora j.w. dla listy
procedure Insert(Tree : in out Node_Ptr; Number : Integer) is
begin
	if Tree = Null then
		 Tree := new Node'(Number, Null, Null);
	elsif Number < Tree.Data then
		
		if Tree.Left = Null then
			Tree.Left := new Node'(Number, Null, Null);
		else
			Insert(Tree.Left, Number);
		end if;
	elsif Number > Tree.Data then
		if Tree.Right = Null then
			Tree.Right := new Node'(Number, Null, Null);
		else
			Insert(Tree.Right, Number);
		end if;
	end if;	
end Insert;

procedure Generate_And_Insert(Tree: in out Node_Ptr; N : in Integer; M : in Integer) is
	subtype Random_Range is Integer range 0 .. M;
  package Random_Generator is new Ada.Numerics.Discrete_Random (Random_Range);
  use Random_Generator;
  Gen: Generator;
  Number: Integer;
begin
 	Reset(Gen);
	for I in 1..N loop
		Number := Random(Gen) mod M;
		Insert(Tree, Number);
	end loop;
end Generate_And_Insert;

-- podprogram przeszukujący drzewo (search),
function Search(Tree : in Node_Ptr; El : Integer) return Boolean is
begin
	if Tree = Null then
		return false;
	elsif Tree.Data = El then
		return true;
	elsif El < Tree.Data then
		return search(Tree.Left, El);
	else
		return search(Tree.Right, El);
	end if; 
end;

-- serializacja
function Serialize(Tree: in out Node_Ptr) return String is
begin
    if Tree /= Null then
        return "{"
		& """data"":" & Integer'Image(Tree.Data)
        & ",""left"":" & Serialize(Tree.Left)
        & ",""right"":" & Serialize(Tree.Right) 
        & "}";
    else
        return "null";
    end if;
end Serialize;

Tree : Node_Ptr := Null;

begin
	Generate_And_Insert(Tree, 9, 20);
	Insert(Tree,5);
	Insert(Tree,15);

	Print(Tree);

	Put_Line(Boolean'Image(Search(Tree, 15)));

	Put_Line(Serialize(Tree));

end BST;