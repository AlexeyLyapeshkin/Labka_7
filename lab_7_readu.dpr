program lab_7_readu;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  windows;

const
  N = 256;
  glass =['a', 'e', 'i', 'o', 'u', 'а', 'о', 'э', 'и', 'у', 'ы', 'е', 'ё', 'ю', 'я'];

type
  TArr = array[1..N] of string;

  TNumArr = array[1..N] of integer;

  treal = array[1..N] of Real;

var
  s, z1, tmp, s2: string[255];
  arr, a, b: tarr;
  c: treal;
  tmpi: Real;
  len, p, i, schet, j, count, kol, m, k: integer;
  proverka: Boolean;

procedure invert(i: Integer; var arr: TArr);
var
  tmp: char;
  nachalo, konec: integer;
begin
  konec := Length(arr[i]);
  for nachalo := 1 to length(arr[i]) div 2 do
  begin
    tmp := arr[i, nachalo];
    arr[i, nachalo] := arr[i, konec];
    arr[i, konec] := tmp;
    dec(konec);
  end;
end;

begin
  SetConsoleCP(1251);
  SetConsoleOutputCP(1251);
  repeat
    Writeln('Введите Вашу строку:');
    Readln(s);
    Writeln;
    s := LowerCase(s);
    s := trim(s);
    if s = '' then
      Writeln('Вы ничего не ввели или ввели только пробелы.')
    else
    begin
      Len := Length(S);
      p := 1;
      schet := 0;

      for i := 1 to Len do
      begin
        if S[i] <> ' ' then
          arr[p] := arr[p] + S[i]
        else
        begin
          if arr[p] <> '' then
          begin
            inc(p);
            Inc(schet);
          end;
        end;
      end;
   {if schet=1 then Writeln('Вы ввели одно слово(')
   {else}
      schet := schet + 1;

      count := 0;
      for i := 1 to schet do
      begin
        if AnsiCompareStr(arr[schet], arr[i]) = 0 then
        begin
          delete(arr[i], 1, length(arr[schet]));
          count := count + 1;
        end;
      end;
      kol := schet - count;
      m := 1;
      for i := 1 to schet do
      begin
        if arr[i] = '' then
        begin
        end
        else
        begin
          a[m] := arr[i];
          Inc(m);
        end;
      end;
        // обработка массива закончена

       //if kol=0 then write('Нет слов, удовлетворяющих заданию.');
      b := a;
      for i := 1 to kol do
      begin
        proverka := false;
        invert(i, b);
        for j := i to kol do
        begin
          if (AnsiCompareStr(b[i], a[j + 1]) = 0) and (proverka = False) then
          begin
            z1 := z1 + a[i] + ' - ' + a[j + 1] + ', ';
            proverka := True;
          end;
        end;
      end;
      if z1 = '' then
        Writeln('S1: В Вашей строке нет слов, удовлетворяющих условию.')
      else
        Writeln('S1: ', z1);

       // задание 2

       {Writeln(kol);
       readln;
       for i:=1 to kol do writeln(a[i]);
       Readln;}
      for i := 1 to kol do
      begin
        k := 0;
        for j := 1 to Length(a[i]) do
        begin
          if a[i, j] in glass then
          begin
            k := k + 1;
          end;
        end;
        c[i] := k / Length(a[i]);

      end;

      k := 0;
      repeat
        i := 1;
        while i <= kol - 1 do
        begin
          if c[i] >= c[i + 1] then
          begin
            tmp := a[i];
            a[i] := a[i + 1];
            a[i + 1] := tmp;
              //
            tmpI := c[i];
            c[i] := c[i + 1];
            c[i + 1] := tmpI;
          end;
          i := i + 1;
        end;
        k := k + 1;
      until k <= Sqr(kol);

      for i := 1 to kol do
        s2 := s2 + a[i] + ' ';

      Writeln('S2: ', s2);
      Writeln;

    end;
    Writeln('Если хотите повторить программу введите 0.');
    Readln(m);
  until m = 1;

end.

