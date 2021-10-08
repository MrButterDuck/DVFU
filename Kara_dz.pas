program Kara;
var coord: array [0..5] of real;
  b1, b2, b3, k1, k2, k3, x01, x02, x03 :real;
  has_zero_coord: boolean;
begin
  has_zero_coord:=false;
  writeln('Введите координаты первой точки(x1,y1): ');
  read(coord[0], coord[1]);
  writeln('Введите координаты второй точки(x2,y2): ');
  read(coord[2], coord[3]);
  writeln('Введите координаты третей точки(x2,y3): ');
  read(coord[4], coord[5]);
  //находим смещение(b) и коэфециент наклона(k) из формулы y=kx+b
  //коэфециент через подстановку k=(y1-y2)/(x1-x2)
  k1:=(coord[1]-coord[3])/(coord[0]-coord[2]);
  k2:=(coord[3]-coord[5])/(coord[2]-coord[4]);
  k3:=(coord[5]-coord[1])/(coord[4]-coord[0]);
  //смещение просто выражаем, тк k мы уже знаем
  b1:=coord[1]-coord[0]*k1;
  b2:=coord[3]-coord[2]*k2;
  b3:=coord[5]-coord[4]*k3;
  //нули функций, место где они пересекаются с абциссой при ординате равной 0
  x01:=(0-b1)/k1;
  x02:=(0-b2)/k2;
  x03:=(0-b3)/k3;
  writeln(x01);writeln( x02);writeln( x03);
  //проверяем чтобы одна сторона и смежная ей пересекали абциссу, ибо в противном случае проверка бесполезна
  if ((coord[1] >= 0.0) and (coord[3] <= 0.0)) and ((coord[3] <=0.0) and (coord[5] >= 0.0)) then
    //смотрим где они пересекают абцисуу, если по обе стороны от 0, то соответственно начало координат входит в треугольник
    //если нули лежать по одну сторону от начала координат, то оно не входит в треугольник
    if ((x01 <= 0.0) and (x02 >= 0.0)) or ((x01 >= 0.0) and (x02 <= 0.0)) then has_zero_coord:= true;
  if ((coord[3] >=0.0) and (coord[5] <= 0.0)) and ((coord[5] <=0.0) and (coord[1] >= 0.0)) then
    if ((x02 <= 0.0) and (x03 >= 0.0)) or ((x02 >= 0.0) and (x03 <= 0.0)) then has_zero_coord:= true;
  if ((coord[1] >=0.0) and (coord[3] <= 0.0)) and ((coord[5] <=0.0) and (coord[1] >= 0.0)) then
    if ((x01 <= 0.0) and (x03 >= 0.0)) or ((x01 >= 0.0) and (x03 <= 0.0)) then has_zero_coord:= true;
 //для надежности инвертированные условия, в час ночи тяжко сказать, нужно это или нет 
  if ((coord[1] <= 0.0) and (coord[3] >= 0.0)) and ((coord[3] >=0.0) and (coord[5] <= 0.0)) then
    if ((x01 <= 0.0) and (x02 >= 0.0)) or ((x01 >= 0.0) and (x02 <= 0.0)) then has_zero_coord:= true;
  if ((coord[3] <= 0.0) and (coord[5] >= 0.0)) and ((coord[5] >=0.0) and (coord[1] <= 0.0)) then
    if ((x02 <= 0.0) and (x03 >= 0.0)) or ((x02 >= 0.0) and (x03 <= 0.0)) then has_zero_coord:= true;
  if ((coord[1] <=0.0) and (coord[3] >= 0.0)) and ((coord[5] >=0.0) and (coord[1] <= 0.0)) then
    if ((x01 <= 0.0) and (x03 >= 0.0)) or ((x01 >= 0.0) and (x03 <= 0.0)) then has_zero_coord:= true;
  //если одно из условий сработало, то говорим что все ок, если нет, то материм заказчика и отправляем править ТЗ
  if has_zero_coord then writeln('принадлежит')
  else writeln('иди пересчитывай');
end.