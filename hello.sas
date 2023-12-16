/* นำเข้าไลบรารีที่จำเป็น */
proc import datafile="HelloWorld.txt" out=text;
run;

/* แปลงข้อความเป็นตัวเลข */
data text_num;
set text;
x = input(text, best32.);
run;

/* กำหนดขนาดตาข่าย */
data lattice;
set text_num;
n = 4096;
y = (x - mean(x)) / stdev(x);
z = (y - mean(y)) / stdev(y);
run;

/* เข้ารหัสข้อความ */
data cipher;
set lattice;
a = (z * q)^k;
b = (z - a) / s;
run;

/* แสดงผลลัพธ์ */
proc print data=cipher;
run;