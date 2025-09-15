

x1 = 'Teacher2'
x2 = '2Teacher'
x3 = 'Teacher_25'
x4 = 'TeaCher'

x5 = 2.5e6
A = 6
B = 5
a = ''

print(str(x1))

print(str(x3))

print(str(x2))

print(str(x4))

print(str(x5))

print(str("2.5e6"))

if A == 127 or B != 18:
  print((str("True")))
else:
  print((str("False")))
    
for i in range(1, 5):
    print(i, "multiplied by 8 =", i * 8)

for a in range(0,2):
    for b in range(0,2):
        for c in range(0,2):
            for d in range(0,2):
                for g in range(0,2):
                   for f in range(0,2):
                      print(a,b,c,d,g,f)


games = [print(("b"))]
while True:
   a = input()
   if a == '':
        break
   else:
      games.append(a)
      print(games)
   