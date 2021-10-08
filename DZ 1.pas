program dz;
const p=3.14;
var r, S_pryamugol, H_trap_1, H_trap_2 : real;
     first, second, small, big: array [0..2] of real;

begin
  write('Введите радиус: ');
  readln(r);
  write('Введите высоту первого прямоуголника: ');
  readln(first[0]);
  write('Введите ширину первого прямоуголника: ');
  readln(first[1]);
  write('Введите высоту второго прямоуголника: ');
  readln(second[0]);
  write('Введите ширину второго прямоуголника: ');
  readln(second[1]);
  //найдем наибольшую стоорону у каждой пластины, затем сравним их и скажем,что большая-хорда
  if first[0]>first[1] then first[2]:=first[0]
  else first[2]:=first[1];
  if second[0]>second[1] then second[2]:=second[0]
  else second[2]:=second[1];
  if first[2]>second[2] then begin big:=first; small:=second; end
  else begin big:=second; small:=first; end;
  //найдем прямоугольную площадь в круге, через высоту между хордой и радиусом
  S_pryamugol:=(sqrt(sqr(r)-sqr(big[2]/2))*2*big[2]);
  //если площадь оставщейся пластины входит в прямоугольную площадь, то задача выполнена, если нет, то ищем варианты в секторах
  if S_pryamugol >= ((small[0]*small[1])+(big[0]*big[1])) then writeln('Из заготовки данного радиуса можно вырезать пластины данных размеров')
  else begin
   //можно утверждать, что равнобедренная трапеция с основаниями в виде большей стороны большей пластины и большей стороны меньшей пластины поместиться в сектор
   //если перемножить высоту трапеции на меньшее осмнование, то можно найти площадь, в которую либо впишется оставшаяся пластина, либо нет
   H_trap_1:=sqrt(sqr(r)-sqr(small[2]/2))-sqrt(sqr(r)-sqr(big[2]/2));
   H_trap_2:=sqrt(sqr(r)-sqr(small[2]/2))-(big[2]/2);
   writeln(H_trap_1);
   writeln(H_trap_2);
   if (S_pryamugol >= big[0]*big[1]) and((H_trap_1*small[2] >= small[1]*small[0]) or (H_trap_2*small[2] >= small[1]*small[0])) then writeln('Из заготовки данного радиуса можно вырезать пластины данных размеров')
   else writeln('Из заготовки данного радиуса нельзя вырезать пластинки данных размеров');
  end; 
end.