program prm13;
var r, h1, h2:real;
    first, second: array [0..2] of real;
    first_is_bigger, is_possible: boolean;
begin
  writeln('Введите радиус окружности, длину и ширину первой пластины, длину и ширину второй пластины');
  readln(r, first[0], first[1], second[0], second[1]);
  if (r*2 < first[0]) or (r*2 < first[1]) or (r*2 < second[0]) or (r*2 < second[1]) then
    begin
      writeln('Вырезать невозможно');
      halt(0);
    end;
  //найдем большую сторону
  if first[0] > first [1] then first[2]:= first[0]
  else first[2]:= first[1];
  if second[0] > second[1] then second[2]:= second[0]
  else second[2]:= second[1];
  if second[2] > first[2] then first_is_bigger:= false
  else first_is_bigger:= true;
  //скажем, что это хорда, найдем пространство в круге от хорды до хорды и вясним, поместиться ли деталь в нее
  //для этого найдем высоту между хордой и радиусом
  if first_is_bigger then
    begin
      h1 := sqrt(sqr(r)-sqr(first[2] / 2));
      if ((h1*2*first[2]) < (first[1]*first[0])) then is_possible:= false;
      if (h1*2*first[2] >= (first[1]*first[0]+second[0]*second[1])) and ((h1*2) >= ((first[1]+first[0]-first[2])+(second[1]+second[0]-second[2]))) then is_possible:=true;
      //если вторая пластина не вписалась, то говорим, что ее набольшая сторона-хорда, находим высоту до нее
      //если разница высоты первой и второй хорд больше, чем высота второй пластины, то она поместиться
      h2 := sqrt(sqr(r)-sqr(second[2] / 2));
      if ((h2-h1) >= (second[1]+second[0]-second[2])) or ((h2-(first[2]/2)) >= (second[1]+second[0]-second[2])) or ((h2+(h1 - (first[1]+first[0]-first[2]))) >= (second[1]+second[0]-second[2])) then is_possible:=true
      else is_possible:=false;
    end;
  if not(first_is_bigger) then
    begin
      h1 := sqrt(sqr(r)-sqr(second[2] / 2));
      if ((h1*2*second[2]) < (second[1]*second[0])) then is_possible:=false;
      if (h1*2*second[2] >= (first[1]*first[0]+second[0]*second[1])) and (h1*2 >= ((first[1]+first[0]-first[2])+(second[1]+second[0]-second[2]))) then is_possible:=true;
      //если вторая пластина не вписалась, то говорим, что ее наибольшая сторона-хорда, находим высоту до нее
      //если разница высоты первой и второй хорд больше, чем высота второй пластины, то она поместиться
      h2 := sqrt(sqr(r)-sqr(first[2] / 2));
      if ((h2-h1) >= (first[1]+first[0]-first[2])) or ((h2-(second[2]/2)) >= (first[1]+first[0]-first[2])) or ((h2+(h1 - (second[1]+second[0]-second[2]))) >= (first[1]+first[0]-first[2])) then is_possible:=true
      else is_possible:=false;
    end;
  if is_possible then writeln('Возможно')
  else writeln('Невозможно');
end.